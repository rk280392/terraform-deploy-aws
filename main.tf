variable "profile" {}
variable "region" {}
variable "key_name" {
	default = "deploy-aws"
}

module "core_infra" {
	source = "./infra"
#	profile = var.profile
	region = var.region
}

module "webapp" {
	source = "./webapp"
	region = var.region
	profile = var.profile
	key_name = var.key_name

sg_web = module.core_infra.sg_web
sn_web = module.core_infra.sn_pub1

}
