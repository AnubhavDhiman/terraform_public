resource "aws_instance" "jenkins-instance"{
	ami = "ami-003b12a9a1ee83922"
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.subnet-1.id}"
	vpc_security_group_ids = ["${aws_security_group.demo-SG.id}"]
	key_name = "${aws_key_pair.demo-key-pair.key_name}"
	tags = {
		Name = "jenkins-instance"
		Purpose = "jenkins"
	}
}

resource "aws_instance" "sonarqube-instance"{
	ami = "ami-003b12a9a1ee83922"
	instance_type = "t2.small"
	subnet_id = "${aws_subnet.subnet-1.id}"
	vpc_security_group_ids = ["${aws_security_group.demo-SG.id}"]
	key_name = "${aws_key_pair.demo-key-pair.key_name}"
	tags = {
		Name = "sonarqube-instance"
		Purpose = "sonarqube"
	}
}

resource "aws_instance" "awx-instance"{
	ami = "ami-003b12a9a1ee83922"
	instance_type = "t2.medium"
	subnet_id = "${aws_subnet.subnet-1.id}"
	vpc_security_group_ids = ["${aws_security_group.demo-SG.id}"]
	key_name = "${aws_key_pair.demo-key-pair.key_name}"
	tags = {
		Name = "awx-instance"
		Purpose = "awx"
	}
}

resource "aws_instance" "nexus-instance"{
	ami = "ami-003b12a9a1ee83922"
	instance_type = "t2.medium"
	subnet_id = "${aws_subnet.subnet-1.id}"
	vpc_security_group_ids = ["${aws_security_group.demo-SG.id}"]
	key_name = "${aws_key_pair.demo-key-pair.key_name}"
	tags = {
		Name = "nexus-instance"
		Purpose = "nexus"
	}
}

output "jenkins-instance-public-ip"{
	value = "${aws_instance.jenkins-instance.public_ip}"
}

output "sonarqube-instance-public-ip"{
	value = "${aws_instance.sonarqube-instance.public_ip}"
}

output "awx-instance-public-ip"{
	value = "${aws_instance.awx-instance.public_ip}"
}

output "nexus-instance-public-ip"{
	value = "${aws_instance.nexus-instance.public_ip}"
}
