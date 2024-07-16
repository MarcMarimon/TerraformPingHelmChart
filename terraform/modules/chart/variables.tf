variable "acr_server" {
  description = "Azure Container Registry server name"
  type        = string
}

variable "acr_server_subscription" {
  description = "Azure subscription ID"
  type        = string
}

variable "source_acr_client_id" {
  description = "Client ID for accessing the source ACR"
  type        = string
}

variable "source_acr_client_secret" {
  description = "Client Secret for accessing the source ACR"
  type        = string
}

variable "source_acr_server" {
  description = "Azure Container Registry server name for source ACR"
  type        = string
}

variable "charts" {
  description = "List of Helm charts to import and install"
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
