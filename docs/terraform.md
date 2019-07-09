## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common_tags | Implements the common tags scheme | map | - | yes |
| depends_on | This is a way to make a module depends on, which isnt built in. | list | `<list>` | no |
| name | The name of the registry | string | - | yes |
| region | The region to create your registry in. | string | - | yes |
| repositorypolicy | Pass this variable a Json Policy | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr_arn | The Amazon resource name for the repository |
| ecr_host | The host where the registry/containers are |
| ecr_repo_name | The name of the repository |
| ecr_repository_url | The URL of your new registry |

