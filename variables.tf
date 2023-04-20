

variable "dashboard_sources_path" {
  description = "Path to process dashboard source files"
  type        = string
}

variable "enable_alert_policies" {
  description = "Enable Alert Polices"
  type        = bool
  default     = false
}
variable "enable_dashboards" {
  description = "Enable Dashboards"
  type        = bool
  default     = false
}
variable "enable_groups" {
  description = "Enable Groups"
  type        = bool
  default     = false
}
variable "enable_log_metrics" {
  description = "Enable Log Metrics"
  type        = bool
  default     = false
}
variable "enable_notification_channels" {
  description = "Enable Notification Channels"
  type        = bool
  default     = false
}
variable "enable_project_scope" {
  description = "Enable Project Scope"
  type        = bool
  default     = false
}
variable "enable_uptime_checks" {
  description = "Enable Uptime Checks"
  type        = bool
  default     = false
}

variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}
variable "gcp_org_id" {
  description = "Google Organization ID"
  type        = string
  default     = ""
}

variable "alert_policies" {
  description = "Alert policy configuration objects"
  type = list(object({
    alert_strategy = optional(object({
      notification_rate_limit = optional(object({
        period = optional(number)
      }))
      auto_close = optional(string)
    }))
    combiner = string
    conditions = list(object({
      condition_absent = optional(object({
        aggregations = list(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string) # validate
          group_by_fields      = optional(string) # ??
          per_series_aligner   = optional(string) # validate
        }))
        duration = string # Valid: minutes in seconds: must be /60
        filter   = optional(string)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_matched_log = optional(object({
        filter           = optional(string)
        label_extractors = optional(map(string))
      }))
      condition_monitoring_query_language = optional(object({
        duration                = string
        evaluation_missing_data = optional(string) # validate
        query                   = string
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_threshold = optional(object({
        aggregations = optional(list(object({
          alignment_period     = optional(string)       # validate
          cross_series_reducer = optional(string)       # validate
          group_by_fields      = optional(list(string)) # ??
          per_series_aligner   = optional(string)       # validate
        })))
        comparison = string # validate [COMPARISON_GT COMPARISON_GE COMPARISON_LT COMPARISON_LE COMPARISON_EQ COMPARISON_NE]
        denominator_aggregations = optional(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string) # validate
          group_by_fields      = optional(string) # ??
          per_series_aligner   = optional(string) # validate
        }))
        denominator_filter      = optional(string)
        duration                = string
        evaluation_missing_data = optional(string) # validate
        filter                  = optional(string)
        threshold_value         = optional(number)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      display_name = string
    }))
    display_name = string
    documentation = object({
      content   = string
      mime_type = optional(string, "text/markdown")
    })
    enabled               = optional(bool, true)
    notification_channels = optional(list(string), [])
    user_labels           = optional(map(string))
  }))
  # Minimum required fields
  default = [{
    combiner = ""
    conditions = [{
      display_name = ""
    }]
    display_name = ""
    documentation = {
      content = ""
    }
  }]
}

variable "groups" {
  description = "Group configuration objects"
  type        = list(object({}))
  default     = []
}
variable "logging_metrics" {
  description = "Logging Metric configuration objects"
  type        = list(object({}))
  default     = []
}
variable "notification_channels" {
  description = "Notification Channel configuration objects"
  type        = list(object({}))
  default     = []
}
variable "uptime_checks" {
  description = "Uptime Check configuration objects"
  type        = list(object({}))
  default     = []
}
