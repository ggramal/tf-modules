resource "google_logging_metric" "logging_metric" {
  name   = var.name
  filter = var.filter

  metric_descriptor {
    metric_kind = var.metric_kind
    value_type  = var.value_type
    unit        = var.unit

    display_name = coalesce(var.display_name, var.name)

    dynamic "labels" {
      for_each = var.labels
      content {
        key         = labels.value.key
        value_type  = labels.value.value_type
        description = labels.value.description
      }
    }
  }

  value_extractor = var.value_extractor

  label_extractors = { for label in var.labels : label.key => label.extractor }

  dynamic "bucket_options" {
    for_each = var.bucket_options != null ? [var.bucket_options] : []
    content {
      linear_buckets {
        num_finite_buckets = bucket_options.value.linear_buckets.num_finite_buckets
        width              = bucket_options.value.linear_buckets.width
        offset             = bucket_options.value.linear_buckets.offset
      }

      exponential_buckets {
        num_finite_buckets = bucket_options.value.exponential_buckets.num_finite_buckets
        growth_factor      = bucket_options.value.exponential_buckets.growth_factor
        scale              = bucket_options.value.exponential_buckets.scale
      }

      explicit_buckets {
        bounds = bucket_options.value.explicit_buckets.bounds
      }
    }
  }
}
