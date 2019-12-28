[![Slalom][logo]](https://slalom.com)

# terraform-aws-ecr [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-aws-ecr.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-ecr) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-ecr.svg)](https://github.com/JamesWoolfenden/terraform-aws-ecr/releases/latest)

Terraform module to provision an AWS [`Elastic Container Registry`](https://aws.amazon.com/ecr/).

---
It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```terraform
module ecr {
  source           = "github.com/JamesWoolfenden/terraform-aws-ecr"
  version          = "0.2.21"
  name             = var.name
  repositorypolicy = data.aws_iam_policy_document.allowlocals.json
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common\_tags | Implements the common tags scheme | map | n/a | yes |
| image\_tag\_mutability |  | string | `"IMMUTABLE"` | no |
| name | The name of the registry | string | n/a | yes |
| repositorypolicy | Pass this variable a Json Policy | string | n/a | yes |
| scan\_on\_push |  | bool | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| ecr | The full details of the repo |
| ecr\_arn | The Amazon resource name for the repository |
| ecr\_repo\_name | The name of the repository |
| ecr\_repository\_url | The URL of your new registry |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Information

A terraform module to create a container registry (ECR - Elastic Container Registry) in AWS.
There are two policies attached, a life-cycle policy which details how to look after the containers and a permission policy which has a default allow allusers in the account.
I use this to store the customised containers I use in Codebuild and for storing containers for Fargate.

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-ecr/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-ecr/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage] |

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-ecr&url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-ecr&url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_email]: mailto:?subject=terraform-aws-ecr&body=https://github.com/jameswoolfenden/terraform-aws-ecr
