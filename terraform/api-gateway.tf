# Create an HTTP API Gateway
resource "aws_apigatewayv2_api" "experiment_ai_api" {
  name          = "my-http-api"
  protocol_type = "HTTP"
}

# Create API Gateway Integration with Lambda
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.experiment_ai_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.experiment_ai.invoke_arn
  payload_format_version = "2.0"
}

# Create a route to the Lambda function
resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.experiment_ai_api.id
  route_key = "POST /lambda" # Requests to /lambda go to the Lambda function
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Create a stage to deploy the API
resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.experiment_ai_api.id
  name        = "dev"
  auto_deploy = true
}

# Grant API Gateway permission to invoke the Lambda function
resource "aws_lambda_permission" "apigw_lambda" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.experiment_ai.arn
  principal     = "apigateway.amazonaws.com"
  # The source ARN must match the API Gateway execution ARN
  source_arn = "${aws_apigatewayv2_api.experiment_ai_api.execution_arn}/*/*"
}
