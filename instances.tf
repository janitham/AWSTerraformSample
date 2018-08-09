/*
  INSTANCES OF TERRAFORM PROJECT
*/
resource "aws_instance" "linux-web-server-1" {

  ami = "${lookup(var.amis, var.aws_region)}"
  availability_zone = "${var.public_subnet_availability_zone}"
  instance_type = "t2.micro"
  key_name = "${var.aws_key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.web.id}"]
  subnet_id = "${aws_subnet.terraform_public_subnet.id}"
  associate_public_ip_address = true
  source_dest_check = false

  tags {
    Name = "Linux Web Server 1"
  }
}
