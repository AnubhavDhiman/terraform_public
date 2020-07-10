resource "aws_key_pair" "demo-key-pair"{
	key_name = "demo-key-pair"
	public_key = "${file("keys/key-pair.pub")}"
}
