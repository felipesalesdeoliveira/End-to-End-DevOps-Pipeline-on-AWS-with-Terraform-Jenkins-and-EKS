variable "name_prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type    = string
  default = null
}

variable "ssh_ingress_cidr" {
  type = string
}

variable "app_ingress_cidr" {
  type = string
}

variable "user_data_path" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
