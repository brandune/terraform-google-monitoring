# Manage Monitoring scope for projects

Manage the monitoring scope for projects

## Dependancies

- Each project needs to have the label **monitor**
  - Recognized values
    - true  (monitor project)
    - false (do not monitor project)
    - scope (the monitoring project)

## Required google permissions


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_monitored_project.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_monitored_project) | resource |
| [google_organization.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |
| [google_projects.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization domain name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metrics_scope_project"></a> [metrics\_scope\_project](#output\_metrics\_scope\_project) | Metrics scope project ID |
| <a name="output_metrics_scoped_projects"></a> [metrics\_scoped\_projects](#output\_metrics\_scoped\_projects) | Metrics scoped projects. All projects that metrics are being collected from |
| <a name="output_monitored_projects"></a> [monitored\_projects](#output\_monitored\_projects) | Monitored projects - Full data for debugging |
| <a name="output_projects"></a> [projects](#output\_projects) | GCP project settings before any changes |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
