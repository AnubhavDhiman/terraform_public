resource "aws_elb" "app-ELB"{
	name = "app-ELB"
	subnets = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
	security_groups = ["${aws_security_group.elb-SG.id}"]
	listener{
		instance_port = "8080"
		instance_protocol = "http"
		lb_port = "8080"
		lb_protocol = "http"
	}
	health_check{
		healthy_threshold = "2"
		unhealthy_threshold = "2"
		timeout = "10"
		target = "HTTP:8080/"
		interval = "30"
	}
	tags = {
		Name = "app-ELB"
	}
}
