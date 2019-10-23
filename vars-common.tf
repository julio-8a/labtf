

variable "region" {
    default = "us-east-1"
}

variable "aws_vpc" {
    default     = "vpc-dd499bbb" #VPC 065
    description = "AWS VPC id"
}

variable "testami" {
    default     = "ami-2757f631"
    description = "Free tier ami"
}

variable "instance_type" {
    default     = "t2.micro"
    description = "Test instance size"
}


variable "test_ssh_key" {
    default     = "bwce065"
    description = "Pingdir test ssh keys"
}

variable "test_subnet_tagname" {
    default     = "network"
    description = "default tag for VPC subnets"
}

variable "test_subnet_tag" {
    default     = "nat"
    description = "test subnet type"
}

# Declaring subnet ID explicitly here. At some point pull with aws_subnet
variable "test_subnet_id" {
    default = "subnet-ff0297a4"
    description = "subnet ID from test subnet in AWS"
}