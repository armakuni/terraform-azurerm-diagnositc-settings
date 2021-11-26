variable "name" {
  description = "Name of the Diagnostic Setting"
  type        = string
}

variable "resource_id" {
  description = "ID of the resource to add Diagnostic monitoring to"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace to send logs and metrics to"
  type = string
}

variable "use_resource_specific_table" {
  description = "Set the Diagnostic setting to use the Dedicated Log Analytics table (Limited Support)"
  type        = bool
  default     = false
}