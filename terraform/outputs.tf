output "installed_charts" {
  description = "List of installed Helm charts"
  value       = "Successfully installed charts:  ${length(var.charts)} charts"
}
