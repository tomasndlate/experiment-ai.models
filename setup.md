# Setup the the project

**notebooks** - contain the model's training jupyter notebooks

**src** - python files that contain the aws lambda function code

**terraform** - IaC for aws lambda, and aws api gateway

## Notebooks

Go to [setup notebooks](https://github.com/tomasndlate/experiment-ai.models/blob/main/notebooks/setup.md)

## Src

Go to [setup src (lambda function)](https://github.com/tomasndlate/experiment-ai.models/blob/main/src/setup.md)

## Dockerize model to docker image

1. Build Docker image

- docker build -t <docker-image-name> .

2. Run locally and test lambda function

- docker run -p 8080:8080 --name <container-name> <docker-image-name>

- http://localhost:8080/2015-03-31/functions/function/invocations
