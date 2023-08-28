resource "aws_dynamodb_table" "Person" {
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.key_name
  name         = "${var.table_name}_List"

  attribute {
    name = var.key_name
    type = "N"
  }
  tags = {
    Name = "${var.table_name}-Dynamo-DB-Table"
  }
}

resource "aws_dynamodb_table_item" "person" {
  depends_on = [aws_dynamodb_table.Person]
  table_name = aws_dynamodb_table.Person.name
  hash_key   = aws_dynamodb_table.Person.hash_key
  for_each   = var.item_element
  item       = <<ITEM
  {
    "PersonID": {"N": "${each.key}"},
  "FirstName": {"S": "${each.value.FirstName}"},
  "LastName": {"S": "${each.value.LastName}"}
}
  ITEM
}