variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "Roboshop Ami"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}