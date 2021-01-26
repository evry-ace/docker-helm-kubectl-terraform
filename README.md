# Helm kubctl terraform
Helm, kubectl and terraform docker image to build and deploy content to 
Azure and kubernetes using helm and terraform

# Push to Docker hub
Add tow secrets to github repo:
```
DOCKER_PASSWORD
DOCKER_USERNAME
```

## New version
Update with new versions on env vars:
```
HELM_VERSION: v2.0.0
KUBECTL_VERSION: v1.13.10
TERRAFORM_VERSION: 0.12.26
```
Set the new tag version:
```
tags: v2.0.0__v1.13.10__0.12.26
```