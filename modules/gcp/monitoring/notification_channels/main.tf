resource "google_monitoring_notification_channel" "default" {
  display_name = var.name
  type         = var.type
  labels       = var.labels

  dynamic "sensitive_labels" {
    for_each = var.sensitive_labels != null ? [var.sensitive_labels] : []
    content {
      auth_token  = var.sensitive_labels.auth_token
      password    = var.sensitive_labels.password
      service_key = var.sensitive_labels.service_key
    }
  }
}