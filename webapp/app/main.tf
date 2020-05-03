data "aws_ami" "ubuntu" {
	most_recent = true
	filter {
        	name   = "name"
       		values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64*"]
	}
	filter {
		name   = "virtualization-type"
        	values = ["hvm"]
    }
	owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my-webserver" {
	ami           = data.aws_ami.ubuntu.id
	instance_type = "t2.micro"
	key_name = var.key_name
	subnet_id     = var.sn_web
	associate_public_ip_address = true
	
	vpc_security_group_ids = [
		var.sg_web,
  ]

    
	tags = {
		Name = "My-server"
		Site = "my-web-site"
    	}
}

