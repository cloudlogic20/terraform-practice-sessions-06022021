module "ec2module" {
  source        = "../../modules/ec2"
  instance_type = "t2.xlarge"
}

module "iammodule" {
  source   = "../../modules/iam"
  username = "dummyuser"
}