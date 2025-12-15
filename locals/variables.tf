variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "component" {
    default = "mongodb"
}

variable "common_tags"{
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}

/* variable "final-name" {
    default = "${var.project}-${var.environment}-${var.component}" #cannot write varibale inside variable
} */

# ec2 name = cart
# ec2 name = roboshop-dev-cart