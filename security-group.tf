resource "aws_security_group" "demo-SG"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	name = "demo-SG"
	description = "demo-SG"
	egress{
		from_port = "0"
		to_port = "0"
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress{
		from_port = "80"
		to_port = "80"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32"]
	}
	ingress{
		from_port = "22"
		to_port = "22"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32"]
	}
	ingress{
		from_port = "8080"
		to_port = "8080"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32","10.0.0.0/16"]
	}
	ingress{
		from_port = "8081"
		to_port = "8081"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32"]
	}
	ingress{
		from_port = "9000"
		to_port = "9000"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32"]
	}
	tags = {
		Name = "demo-SG"
	}
}

resource "aws_security_group" "elb-SG"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	name = "elb-SG"
	description = "elb-SG"
	egress{
		from_port = "0"
		to_port = "0"
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress{
		from_port = "8080"
		to_port = "8080"
		protocol = "tcp"
		cidr_blocks = ["203.192.210.141/32"]
	}
	tags = {
		Name = "elb-SG"
	}
}
