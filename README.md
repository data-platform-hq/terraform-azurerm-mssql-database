# Azure Microsoft SQL Database Terraform module
Terraform module for creation Azure Microsoft SQL Database

# TODO - Update README

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_mssql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | Map of objects to configure MSSQL Database | <pre>map(object({<br/>    collation                   = optional(string, "SQL_Latin1_General_CP1_CI_AS")<br/>    sku                         = optional(string, "GP_S_Gen5_1")<br/>    max_size_gb                 = optional(string, "20")<br/>    min_capacity                = optional(string, "0.5")<br/>    auto_pause_delay_in_minutes = optional(number, 60)<br/>    create_mode                 = optional(string, "Default")<br/>    creation_source_database_id = optional(string, null)<br/>    storage_account_type        = optional(string, "ZRS")<br/>  }))</pre> | `{}` | no |
| <a name="input_default_retention_days"></a> [default\_retention\_days](#input\_default\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs. | `number` | `3` | no |
| <a name="input_destination_type"></a> [destination\_type](#input\_destination\_type) | Log analytics destination type | `string` | `"Dedicated"` | no |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Boolean flag to enabled diagnostic settings for databases | `bool` | `false` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID | `string` | `""` | no |
| <a name="input_server_fqdn"></a> [server\_fqdn](#input\_server\_fqdn) | FQDN of Azure SQL Server | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Id of SQL server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_database_secrets"></a> [mssql\_database\_secrets](#output\_mssql\_database\_secrets) | Map of Database Name to JDBC Connection String |
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | Id of Database |
| <a name="output_sql_database_max_size"></a> [sql\_database\_max\_size](#output\_sql\_database\_max\_size) | Database max size in GB of the Azure SQL Database created. |
| <a name="output_sql_database_names"></a> [sql\_database\_names](#output\_sql\_database\_names) | Database name of the Azure SQL Database created. |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | Id of SQL server |
| <a name="output_storage_account_type"></a> [storage\_account\_type](#output\_storage\_account\_type) | Storage Account Type |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-mssql-database/blob/main/LICENSE)
