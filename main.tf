#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight IQN Pool Resource
# GUI Location: Pools > Create Pool
#____________________________________________________________

resource "intersight_iqnpool_pool" "iqn" {
  assignment_order = var.assignment_order
  description      = var.description != "" ? var.description : "${var.name} IQN Pool."
  name             = var.name
  prefix           = var.prefix
  dynamic "iqn_suffix_blocks" {
    for_each = { for v in var.iqn_blocks : v.from => v }
    content {
      from   = iqn_suffix_blocks.value.from
      size   = iqn_suffix_blocks.value.size
      suffix = iqn_suffix_blocks.value.suffix
      to     = iqn_suffix_blocks.value.to
    }
  }
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
