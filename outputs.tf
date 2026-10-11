output "metering_computation_queries_id" {
  description = "Map of id values across all metering_computation_queries, keyed the same as var.metering_computation_queries except keys with no id are omitted"
  value       = { for k, v in oci_metering_computation_query.metering_computation_queries : k => v.id if v.id != null && length(v.id) > 0 }
}
output "metering_computation_queries_compartment_id" {
  description = "Map of compartment_id values across all metering_computation_queries, keyed the same as var.metering_computation_queries except keys with no compartment_id are omitted"
  value       = { for k, v in oci_metering_computation_query.metering_computation_queries : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "metering_computation_queries_query_definition" {
  description = "Map of query_definition values across all metering_computation_queries, keyed the same as var.metering_computation_queries except keys with no query_definition are omitted"
  value       = { for k, v in oci_metering_computation_query.metering_computation_queries : k => one(v.query_definition) if v.query_definition != null && length(v.query_definition) > 0 }
}

