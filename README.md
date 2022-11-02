# Azure Microsoft SQL Database Terraform module
Terraform module for creation Azure Microsoft SQL Database

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.23.0 |

## Providers

| Name                                                          | Version |
| ------------------------------------------------------------- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                          | Type     |
| ----------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_mssql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |

## Inputs

| Name                                                                                                                                                | Description                                                                                                        | Type               | Default                      | Required |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------ | ---------------------------- | :------: |
| <a name="input_project"></a> [project](#input\_project) | Project name / | `string`  | n/a  | yes | 
| <a name="input_env"></a> [env](#input\_env) | Environment name / | `string`  | n/a  | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location / | `string`  | n/a  | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Id of SQL server / | `string`  | n/a  | yes | 
| <a name="input_server_fqdn"></a> [server\_fqdn](#input\_server\_fqdn) | FQDN of Azure SQL Server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for resources | `map(string)` | {} | no |
| <a name="input_default_collation"></a> [default\_collation](#input\_default\_collation) | Specifies the collation of the database | `string` | SQL_Latin1_General_CP1_CI_AS | no |
| <a name="input_default_sku"></a> [default\_sku](#input\_default\_sku) | Specifies the SKU of the database | `string` | GP_S_Gen5_1 | no |
| <a name="input_default_max_size"></a> [default\_max_size](#input\_default\_max\_size) | The max size of the database in gigabytes | `string` | 20 | no |
| <a name="input_default_min_capacity"></a> [default\_min\_capacity](#input\_default\_min\_capacity) | The min size of the database in gigabytes | `string` | 0.5 | no |
| <a name="input_default_autopause_delay"></a> [default\_autopause\_delay](#input\_default\_autopause\_delay) | Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled | `string` | 60 | no |
| <a name="input_default_retention_days"></a> [default\_retention\_days](#input\_default\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs | `string` | 3 | no |
| <a name="input_default_create_mode"></a> [default\_create\_mode](#input\_default\_create\_mode) | Type of create mode selected in database config object | `string` | Default | no |
| <a name="input_default_creation_source_database_id"></a> [default\_creation\_source\_database\_id](#input\_default\_creation\_source\_database\_id) | This variable is used in case 'create_mode'='Copy' | `string` | null | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specifies the storage account type used to store backups for this database | `string` | ZRS | no |
| <a name="input_databases"></a> [databases](#input\_databases) | "Map of databases | `map(map(string))` | {} | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID | `string` | n/a | no |
| <a name="input_log_category_list"></a> [log\_category\_list](#input\_log\_category\_list) | Categoty list log | `list(any)` | <pre>[<br> "QueryStoreRuntimeStatistics", <br> "QueryStoreWaitStatistics", <br> "QueryStoreWaitStatistics", <br> "Errors", <br> "DatabaseWaitStatistics", <br> "Timeouts", <br> "Blocks", <br> "Deadlocks" <br>]</pre> | no |
| <a name="input_category_list_metrics"></a> [category\_list\_metrics](#input\_category\_list\_metrics) | Categoty list metrics | `list(any)` | <pre>[<br> "Basic", <br> "WorkloadManagement" <br>]</pre> | no |
| <a name="input_log_retention_days"></a> [log\_retention_days](#input\_log\_retention\_days) | Retention log policy days | `number` | 0 | no |
| <a name="input_metric_retention_days"></a> [metric\_retention\_days](#input\_metric\_retention\_days) | Retention metric policy days | `number` | 0 | no |
| <a name="input_destination_type"></a> [destination\_type](#input\_destination\_type) | Log analytics destination type | `string` | Dedicated | no |

## Outputs

| Name                                                                                                       | Description                                               |
| ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| <a name="output_mssql_database_secrets"></a> [mssql\_database\_secrets](#output\_mssql\_database\_secrets) | Map of Database Name to JDBC Connection String            |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id)                            | Id of SQL server                                          |
| <a name="output_sql_database_names"></a> [sql\_database\_names](#output\_sql\_database\_names)             | Database name of the Azure SQL Database created           |
| <a name="output_sql_database_max_size"></a> [sql\_database\_max\_size](#output\_sql\_database\_max\_size)  | Database max size in GB of the Azure SQL Database created |
| <a name="output_storage_account_type"></a> [storage\_account\_type](#output\_storage\_account\_type)       | Storage Account Type                                      |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-mssql-database/blob/main/LICENSE)
