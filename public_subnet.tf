/*
  Public Subnet
*/
resource "aws_subnet" "terraform_public_subnet" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.public_subnet_availability_zone}"

  tags {
    Name = "${var.public_subnet_tag}"
  }
}