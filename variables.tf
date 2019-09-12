variable "newvariable" {
  type = "string"
  default = "thisisvalue"
}

variable "maptype" {
  type = "map"
  default = {
    subnet1 = "subnet1"
    subnet2 = "subnet2"
  }
}