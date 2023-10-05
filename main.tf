module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
    subnet = module.vpc.public_subnet1
    security_group = module.sg.security_group_id
}

module "eks" {
  source = "./modules/eks"
  vpc = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet1
  subnet_id2 = module.vpc.public_subnet_az1
}