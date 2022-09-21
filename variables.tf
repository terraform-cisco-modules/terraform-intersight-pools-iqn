terraform {
  experiments = [module_variable_optional_attrs]
}

#____________________________________________________________
#
# IQN Pool Variables Section.
#____________________________________________________________

variable "assignment_order" {
  default     = "default"
  description = <<-EOT
  Assignment order decides the order in which the next identifier is allocated.
    * sequential - Identifiers are assigned in a sequential order.
    * default - Assignment order is decided by the system.
  EOT
  type        = string
}

variable "description" {
  default     = ""
  description = "Description for the IQN Pool."
  type        = string
}

variable "iqn_blocks" {
  default     = []
  description = <<-EOT
  List of IQN Pool Parameters to Assign to the IQN Pool.
    * from - Staring IQN Address.  An Exmaple is 0.
    * size - Size of the IQN Pool.  An Exmaple is 1000.
    * suffix - Suffix to assign to the IQN Pool.  An Exmaple is "ucs-host".
    * to - Ending IQN Address.  An Exmaple is 1000.
    * IMPORTANT NOTE: You can only Specify `size` or `to` on initial creation.  This is a limitation of the API.
  EOT
  type = list(object(
    {
      from   = string
      size   = optional(number)
      suffix = string
      to     = optional(string)
    }
  ))
}

variable "name" {
  default     = "default"
  description = "Name for the IQN Pool."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "prefix" {
  default     = ""
  description = "The prefix for IQN blocks created for this pool."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
