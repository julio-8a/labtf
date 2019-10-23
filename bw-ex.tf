## Define resources

provider "aws" {
    profile = "default"
    region  = var.region
}


resource "aws_security_group" "bw_test_instance_sg" {
  name        = "bw-test-instance-sg"
  description = "BW tf test instance Security Group"
  vpc_id      = var.aws_vpc
}

data "aws_subnet_ids" "vpc_subnets" {
    vpc_id = var.aws_vpc
    tags = {
        network = var.test_subnet_tag
    }
}

## Define instances
resource "aws_instance" "bw_test" {
    ami                    = var.testami
    instance_type          = var.instance_type
    key_name               = var.test_ssh_key
    count                  = "1"
    vpc_security_group_ids = [aws_security_group.bw_test_instance_sg.id]
    subnet_id              = var.test_subnet_id
    #subnet_id              = tolist(data.aws_subnet_ids.vpc_subnets.ids)[count.index]

    tags = {
        Name = "bw_test_instance"
    }
}



output "instance_ip" {
    value       = "aws_instance.bw_test.private_ips"
    description = "Private IP for test instance"
}

/*
resource "aws_instance" "master" {
  ami           = "${data.aws_ami.pingdir_ami.id}"
  instance_type = "${var.pingdir_instance_type[var.env]}"
  key_name = "${var.pingdir_ssh_key[var.env]}"
  vpc_security_group_ids = ["${aws_security_group.pingdir_instance_sg.id}"]
  subnet_id = "${data.aws_subnet_ids.pingdir_subnets.ids[0]}"
  iam_instance_profile = "pingdirectory${var.instance_profile_suffix[var.env]}"
*/
