# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"

    }]
  })
}

# Attach basic execution policy to Lambda
resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles      = [aws_iam_role.lambda_role.name]
}

# Define Lambda using Docker image from ECR
resource "aws_lambda_function" "experiment_ai" {
  function_name = "my-lambda-function"
  package_type  = "Image" # For Docker based images
  image_uri     = "${aws_ecr_repository.experiment_ai.repository_url}:latest"
  role          = aws_iam_role.lambda_role.arn
}
