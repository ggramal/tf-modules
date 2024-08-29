variable "name" {
  description = "Clou task name"
  type        = string
}

variable "location" {
  description = "Cloud task location"
  type        = string
}

variable "rate_limits" {
  description = "Cloud task rate limits"
  type = object(
    {
      max_dispatches_per_second = optional(number)
      max_concurrent_dispatches = optional(number)
      max_burst_size            = optional(number)
    }
  )

  default = null
}

variable "retry_configs" {
  description = "Cloud task retry configuration"
  type = object(
    {
      max_attempts       = optional(number)
      max_retry_duration = optional(string)
      min_backoff        = optional(string)
      max_backoff        = optional(string)
      max_doublings      = optional(number)
    }
  )

  default = null
}

variable "logging" {
  description = "cloud task logging configuration"
  type = object(
    {
      enabled        = optional(bool, false)
      sampling_ratio = optional(number, 1)
    }
  )
  default = {
    enabled = false
  }
}

variable "iam_bindings" {
  description = "Iam bindings for this cloud task"
  type = map(
    object(
      {
        role    = string
        members = list(string)
      }
    )
  )
  default = {}
}
