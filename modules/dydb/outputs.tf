#Prints out the value of the DynamoDB table ID
output "table_id" {
  value       = aws_dynamodb_table.Person.id
  description = "DynamoDB table ID"
}

#Prints out the value of the DynamoDB table ARN
output "table_arn" {
  value       = aws_dynamodb_table.Person.arn
  description = "DynamoDB table ARN"
}
