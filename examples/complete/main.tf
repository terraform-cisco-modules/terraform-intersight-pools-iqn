module "iqn_pool" {
  source  = "terraform-cisco-modules/pools-iqn/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "default IQN Pool."
  iqn_blocks = [
    {
      from   = "0"
      size   = 1000
      suffix = "ucs-host"
    }
  ]
  name         = "default"
  organization = "default"
  prefix       = "iqn.1984-12.com.cisco"
}

