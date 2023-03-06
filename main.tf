
module "subnet-module" {
  source        = "github.com/DinaSol/2-Tier-Subnets-Module.git"
  vpc           = var.vpc
  
}

module "web-module" {
  source        = "github.com/DinaSol/2-Tier-Web-Module.git"
  vpc           = var.vpc
  
  web-ami       = var.web-ami 
  instance_type = var.instance_type
  tag-name      = var.tag-name
  web-sg-name   = var.web-sg-name
  
  web-sub-id    = module.subnet-module.pub-subnet-op
}

module "rds-module" {
  source            = "github.com/DinaSol/2-Tier-RDS-Module.git"
  vpc               = var.vpc

  db-name  = var.db-name
  db-username       = var.db-username
  db-password       = var.db-password

  depends_on        = [module.subnet-module]
  rds-sub-id-1      = module.subnet-module.priv-subnet-op-1
  rds-sub-id-2      = module.subnet-module.priv-subnet-op-2

}

