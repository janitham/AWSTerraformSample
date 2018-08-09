/*
  Private Subnet
*/
resource "aws_subnet" "terraform_private_subnet" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "${var.private_subnet_availability_zone}"

  tags {
    Name = "${var.private_subnet_tag}"
  }
}