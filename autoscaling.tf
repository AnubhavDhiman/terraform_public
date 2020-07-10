resource "aws_launch_configuration" "app-LC"{
	name_prefix = "app-LC"
	image_id = "ami-0306fcc1873726bba"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.demo-key-pair.key_name}"
	security_groups = ["${aws_security_group.demo-SG.id}"]
}

resource "aws_autoscaling_group" "app-ASG"{
	name = "app-ASG"
	vpc_zone_identifier = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
	launch_configuration = "${aws_launch_configuration.app-LC.id}"
	min_size = "2"
	max_size = "2"
	health_check_grace_period = "180"
	health_check_type = "ELB"
	force_delete = "true"
	load_balancers = ["${aws_elb.app-ELB.id}"]
	tag{
		key = "Name"
		value = "app-instance"
		propagate_at_launch = "true"
	}
}
