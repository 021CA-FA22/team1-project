variable "dbadmin_users" {
  type = list(any)
  default = [ "dbadmin1", "dbadmin2" ]
}

variable "monitor_users" {
  type = list(any)
  default = [ "monitoruser1", "monitoruser2", "monitoruser3", "monitoruser4" ]
}

variable "sysadmin_users" {
  type = list(any)
  default = [ "sysadmin1", "sysadmin2" ]
}