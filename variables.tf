variable "metering_computation_queries" {
  description = <<EOT
Map of metering_computation_queries, attributes below
Required:
    - compartment_id
    - query_definition (block):
        - cost_analysis_ui (required, block):
            - graph (optional)
            - is_cumulative_graph (optional)
        - display_name (required)
        - report_query (required, block):
            - compartment_depth (optional)
            - date_range_name (optional)
            - filter (optional)
            - forecast (optional, block):
                - forecast_type (optional)
                - time_forecast_ended (required)
                - time_forecast_started (optional)
            - granularity (required)
            - group_by (optional)
            - group_by_tag (optional, block):
                - key (optional)
                - namespace (optional)
                - value (optional)
            - is_aggregate_by_time (optional)
            - query_type (optional)
            - tenant_id (required)
            - time_usage_ended (optional)
            - time_usage_started (optional)
        - version (required)
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    query_definition = object({
      cost_analysis_ui = object({
        graph               = optional(string)
        is_cumulative_graph = optional(bool)
      })
      display_name = string
      report_query = object({
        compartment_depth = optional(number)
        date_range_name   = optional(string)
        filter            = optional(string)
        forecast = optional(object({
          forecast_type         = optional(string)
          time_forecast_ended   = string
          time_forecast_started = optional(string)
        }))
        granularity = string
        group_by    = optional(list(string))
        group_by_tag = optional(list(object({
          key       = optional(string)
          namespace = optional(string)
          value     = optional(string)
        })))
        is_aggregate_by_time = optional(bool)
        query_type           = optional(string)
        tenant_id            = string
        time_usage_ended     = optional(string)
        time_usage_started   = optional(string)
      })
      version = number
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

