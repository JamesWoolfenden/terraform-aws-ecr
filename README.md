# terraform-aws-ecr

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-ecr/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-ecr)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-ecr.svg)](https://github.com/JamesWoolfenden/terraform-aws-ecr/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-apigateway.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-apigateway/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-apigateway/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-apigateway&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-apigateway/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-apigateway&benchmark=INFRASTRUCTURE+SECURITY)

---
Terraform module to provision an AWS [`Elastic Container Registry`](https://aws.amazon.com/ecr/)

This registry is immutable, so you cannot push the "latest" container twice.

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

![alt text](./diagram/registry.png)

## Usage

Include this repository as a module in your existing Terraform code:

```terraform
module ecr {
  source           = "github.com/JamesWoolfenden/terraform-aws-ecr"
  version          = "v0.2.30"
  name             = var.name
  repositorypolicy = data.aws_iam_policy_document.allowlocals.json
}
```

### Logging-in to ECR

First get your account number with:

```shell
aws sts get-caller-identity
```

Then use that to login with:

*aws ecr get-login-password --region eu-west-2 | docker login  --username AWS  --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com*

```shell
aws ecr get-login-password --region eu-west-2 | docker login  --username AWS  --password-stdin 481212720429.dkr.ecr.eu-west-2.amazonaws.com
```

Now build your Dockerfile

```Dockerfile
FROM alpine:3.5
```

```shell
$docker build .
$docker images                               ✔ │ 4s │ 11:41:46 
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
<none>       <none>    bb8a493bc0a0   24 months ago   4MB
```

Then tag the image:

```shell
docker tag bb8a493bc0a0  481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform
```

WARNING:This used the "latest" tag up and as this repo is immutable you cannot use it twice.

```shell
docker push 481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform
docker push 481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform
Using default tag: latest
The push refers to repository [481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform]
f566c57e6f2d: Pushed
```

## Update Docker file

Add this to the Dockerfile:

```Dockerfile
RUN apk add --update py2-pip
```

Build it and get image - cce562ae9658

Tag it the same and try to push it:

```shell
docker tag cce562ae9658  481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform

docker push 481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform

The push refers to repository [481212720429.dkr.ecr.eu-west-2.amazonaws.com/node-terraform]
75867783c8d9: Pushed
f566c57e6f2d: Layer already exists
tag invalid: The image tag 'latest' already exists in the 'node-terraform' repository and cannot be overwritten because the repository is immutable.
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| image\_tag\_mutability | For sone strange reason this is optional behaviour. | `string` | `"IMMUTABLE"` | no |
| name | The name of the registry | `string` | n/a | yes |
| repositorypolicy | Pass this variable a Json Policy | `string` | n/a | yes |
| scan\_on\_push | Security Scan your new container before you add it to the registry | `bool` | `true` | no |

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

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-ecr&url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-ecr&url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-ecr
[share_email]: mailto:?subject=terraform-aws-ecr&body=https://github.com/jameswoolfenden/terraform-aws-ecr
