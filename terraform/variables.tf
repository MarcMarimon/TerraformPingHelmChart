variable "acr_server" {
  description = "Azure container registry server name"
  type        = string
}

variable "acr_server_subscription" {
  description = "Azure subscription ID for the ACR"
  type        = string
}
variable "source_acr_client_id" {
  description = "Azure client ID for the ACR"
  type        = string
}
variable "source_acr_client_secret" {
  description = "Azure client secret for the ACR"
  type        = string
}
variable "source_acr_server" {
  description = "Azure container registry server name for the source ACR"
  type        = string
}
variable "charts" {
  description = "List of Helm charts to be deployed"
  type = list(object({
    chart_name       = string
    chart_namespace  = string
    chart_repository = string
    chart_version    = string
    values = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}
