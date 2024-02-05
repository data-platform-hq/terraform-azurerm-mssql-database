variable "server_id" {
  type        = string
  description = "Id of SQL server"
}

variable "server_fqdn" {
  type        = string
  description = "FQDN of Azure SQL Server"
}

variable "tags" {
  type        = map(string)
  description = "tags for resources"
  default     = {}
}

variable "default_retention_days" {
  type        = number
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
  default     = 3
}

variable "databases" {
  type = map(object({
    collation                   = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    sku                         = optional(string, "GP_S_Gen5_1")
    max_size_gb                 = optional(string, "20")
    min_capacity                = optional(string, "0.5")
    auto_pause_delay_in_minutes = optional(number, 60)
    create_mode                 = optional(string, "Default")
    creation_source_database_id = optional(string, null)
    storage_account_type        = optional(string, "ZRS")
  }))
  description = "Map of objects to configure MSSQL Database"
  default     = {}
}

variable "enable_diagnostic_setting" {
  type        = bool
  description = "Boolean flag to enabled diagnostic settings for databases"
  default     = false
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace ID"
  default     = ""
}

variable "destination_type" {
  type        = string
  default     = "Dedicated"
  description = "Log analytics destination type"
}
