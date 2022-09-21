module "iqn_pool" {
  source  = "scotttyso/pools-iqn/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "default IQN Pool"
  iqn_suffix_blocks = [
    {
      from   = "0"
      size   = 1000
      suffix = "ucs-host"
    }
  ]
  name         = "default"
  organization = "default"
}

