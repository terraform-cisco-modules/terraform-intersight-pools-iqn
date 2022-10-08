module "main" {
  source           = "../.."
  assignment_order = "sequential"
  description      = "${var.name} IQN Pool."
  iqn_blocks = [
    {
      from   = "0"
      size   = 1000
      suffix = "ucs-host"
    }
  ]
  name         = var.name
  organization = "terratest"
  prefix       = "iqn.1984-12.com.cisco"
}
