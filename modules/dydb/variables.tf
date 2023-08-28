variable "key_name" {
  type    = string
  default = "PersonID"
}

variable "table_name" {
  type    = string
  default = "Persons"
}

variable "item_element" {
  type = map(object({
    LastName : string
    FirstName : string
  }))
  default = {
    1 = {
      LastName : "Smith"
      FirstName : "Fred"
    }
    2 = {
      LastName : "Jones"
      FirstName : "Mary"
    }
    3 = {
      LastName : "Stephen"
      FirstName : "Howard"
    }
  }
}