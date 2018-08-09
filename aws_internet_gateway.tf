/*
    INTERNET GATWAY FOR TERRAFORM PROJECT
*/
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  tags {
    Name = "Terraform Internet Gateway"
  }
}