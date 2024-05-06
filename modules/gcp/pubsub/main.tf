resource "google_pubsub_topic" "this" {
  name                       = var.name
  message_retention_duration = var.message_retention_duration
  #  dynamic "labels" {
  #    for_each = var.labels
  #    content {
  #      labels.key = labels.value.value # doesn't work
  #    }
  #  }

  #  dynamic "message_storage_policy" {
  #    for_each = var.regions
  #    content {
  #      allowed_persistence_regions = message_storage_policy.value
  #    }
  #  }
}

resource "google_pubsub_subscription" "this" {
  for_each   = var.subscriptions
  name       = each.key
  topic      = google_pubsub_topic.this.id
  depends_on = [google_pubsub_topic.this]
}

resource "google_pubsub_topic_iam_binding" "publisher" {
  count      = length(var.publishers) > 0 ? 1 : 0
  project    = google_pubsub_topic.this.project
  topic      = google_pubsub_topic.this.name
  role       = "roles/pubsub.publisher"
  members    = var.publishers
  depends_on = [google_pubsub_topic.this]
}

resource "google_pubsub_topic_iam_binding" "subscriber" {
  count      = length(var.subscribers) > 0 ? 1 : 0
  project    = google_pubsub_topic.this.project
  topic      = google_pubsub_topic.this.name
  role       = "roles/pubsub.subscriber"
  members    = var.subscribers
  depends_on = [google_pubsub_topic.this]
}

resource "google_pubsub_topic_iam_binding" "editor" {
  count      = length(var.editors) > 0 ? 1 : 0
  project    = google_pubsub_topic.this.project
  topic      = google_pubsub_topic.this.name
  role       = "roles/pubsub.editor"
  members    = var.editors
  depends_on = [google_pubsub_topic.this]
}

resource "google_pubsub_subscription_iam_binding" "publisher" {
  for_each     = var.subscriptions
  subscription = each.key
  role         = "roles/pubsub.publisher"
  members      = each.value.publishers
  depends_on   = [google_pubsub_subscription.this]
}

resource "google_pubsub_subscription_iam_binding" "subscriber" {
  for_each     = var.subscriptions
  subscription = each.key
  role         = "roles/pubsub.subscriber"
  members      = each.value.subscribers
  depends_on   = [google_pubsub_subscription.this]
}

resource "google_pubsub_subscription_iam_binding" "editor" {
  for_each     = var.subscriptions
  subscription = each.key
  role         = "roles/pubsub.editor"
  members      = each.value.editors
  depends_on   = [google_pubsub_subscription.this]
}
