resource "null_resource" "copy_charts" {
  count = length(var.charts)

  provisioner "local-exec" {
    command = <<-EOT
      # Log in to the instance ACR
      az acr login --name "${var.acr_server}" --subscription "${var.acr_server_subscription}"
      
      # Log in to the reference ACR
      az acr login --name "${var.source_acr_server}" --username "${var.source_acr_client_id}" --password "${var.source_acr_client_secret}"

      # Pull and tag the Helm chart from reference ACR
      helm pull "${var.charts[count.index].chart_repository}/${var.charts[count.index].chart_name}:${var.charts[count.index].chart_version}" --username "${var.source_acr_client_id}" --password "${var.source_acr_client_secret}"

      # Tag the Helm chart
      helm tag "${var.source_acr_server}/${var.charts[count.index].chart_repository}/${var.charts[count.index].chart_name}:${var.charts[count.index].chart_version}" "${var.acr_server}/${var.charts[count.index].chart_repository}/${var.charts[count.index].chart_name}:${var.charts[count.index].chart_version}"

      # Push the Helm chart to instance ACR
      helm push "${var.acr_server}/${var.charts[count.index].chart_repository}/${var.charts[count.index].chart_name}:${var.charts[count.index].chart_version}" --username "${var.source_acr_client_id}" --password "${var.source_acr_client_secret}"
    EOT
  }
}

resource "helm_release" "install_charts" {
  for_each = { for idx, chart in var.charts : idx => chart }

  name       = each.value.chart_name
  repository = var.acr_server
  chart      = "${each.value.chart_repository}/${each.value.chart_name}"
  version    = each.value.chart_version

  dynamic "set" {
    for_each = each.value.values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }

  dynamic "set_sensitive" {
    for_each = each.value.sensitive_values
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
    }
  }
}
