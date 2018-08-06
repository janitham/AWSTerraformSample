resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

#  route {
#    ipv6_cidr_block = "::/0"
#    egress_only_gateway_id = "${aws_egress_only_internet_gateway.foo.id}"
#  }

  tags {
    Name = "main"
  }
}