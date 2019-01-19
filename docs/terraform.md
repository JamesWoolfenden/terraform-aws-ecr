## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| depends_on | This is a way to make a module depends on, which isnt built in. | list | `<list>` | no |
| name | The name of the registry | string | - | yes |
| region | The region to create your registry in. | string | - | yes |
| repositorypolicy | Pass this variable a Json Policy | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr_arn | - |
| ecr_host | - |
| ecr_repo_name | - |
| ecr_repository_url | - |

