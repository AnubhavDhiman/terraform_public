resource "aws_vpc" "demo-vpc"{
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	tags = {
		Name = "demo-vpc"
	}
}

resource "aws_subnet" "subnet-1"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "ap-south-1a"
	tags = {
		Name = "subnet-1"
	}
}

resource "aws_subnet" "subnet-2"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	cidr_block = "10.0.2.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "ap-south-1b"
	tags = {
		Name = "subnet-2"
	}
}

resource "aws_internet_gateway" "demo-IGW"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	tags = {
		Name = "demo-IGW"
	}
}

resource "aws_route_table" "demo-RT"{
	vpc_id = "${aws_vpc.demo-vpc.id}"
	route{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.demo-IGW.id}"
	}
	tags = {
		Name = "demo-RT"
	}
}

resource "aws_route_table_association" "demo-RT-association-1"{
	subnet_id = "${aws_subnet.subnet-1.id}"
	route_table_id = "${aws_route_table.demo-RT.id}"
}

resource "aws_route_table_association" "demo-RT-association-2"{
	subnet_id = "${aws_subnet.subnet-2.id}"
	route_table_id = "${aws_route_table.demo-RT.id}"
}
