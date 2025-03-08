# Terraform Guide

### 1. Apply ECR

Run specifc ecr resource:

```
terraform apply -target=<resource>.<resource-name>
```

### 2. Build and Push Docker Imgage to ECR

Build docker image

```
docker build -t <image> .
```

Tag docker image

```
docker tag <image>:latest <aws-account-id>.dkr.ecr..amazonaws.com/<ecr-repo-name>:latest
```

Authenticate docker in aws

```
aws ecr get-login-password --region | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.<region>.amazonaws.com
```

```
docker push <aws-account-id>.dkr.ecr.<region>.amazonaws.com/<ecr-repo-name>:latest
```

### 3. Apply API Gateway > Lambda > ECR

Apply all terraform configuration

```
terraform apply
```
