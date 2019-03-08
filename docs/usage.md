## Information

A terraform module to create a container registry (ECR - Elastic Container Registry) in AWS
There are two policies attached, a life-cycle policy which details how to look after the containers and a permission policy which has a default allow allusers in the account.
I use this to store the customised containers I use in Codebuild and for storing containers for Fargate.

