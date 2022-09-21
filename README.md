<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Pools - IQN
Manages Intersight IQN Pools

Location in GUI:
`Pools` » `Create Pool` » `IQN`

## Example

### main.tf
```hcl
module "iqn_pool" {
  source  = "scotttyso/pools-iqn/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "default IQN Pool"
  iqn_suffix_blocks = [
    {
      from   = "0"
      size   = 1000
      suffix = "ucs-host"
    }
  ]
  name         = "default"
  organization = "default"
}

```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### Environment Variables

Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_assignment_order"></a> [assignment\_order](#input\_assignment\_order) | Assignment order decides the order in which the next identifier is allocated.<br>  * sequential - Identifiers are assigned in a sequential order.<br>  * default - Assignment order is decided by the system. | `string` | `"default"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the IQN Pool. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for IQN blocks created for this pool. | `string` | `""` | no |
| <a name="input_iqn_blocks"></a> [iqn\_blocks](#input\_iqn\_blocks) | List of IQN Pool Parameters to Assign to the IQN Pool.<br>  * from - Staring IQN Address.  An Exmaple is 0.<br>  * size - Size of the IQN Pool.  An Exmaple is 1000.<br>  * suffix - Suffix to assign to the IQN Pool.  An Exmaple is "ucs-host".<br>  * to - Ending IQN Address.  An Exmaple is 1000.<br>  * IMPORTANT NOTE: You can only Specify `size` or `to` on initial creation.  This is a limitation of the API. | <pre>list(object(<br>    {<br>      from   = string<br>      size   = optional(number)<br>      suffix = string<br>      to     = optional(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IQN Pool. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | IQN Pool Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_iqnpool_pool.iqn_pool](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iqnpool_pool) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->