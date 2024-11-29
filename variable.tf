variable "pool_name" {
  description = "Pool Name"
  type        = string
  default     = "default"
}

variable "ram_size" {
  description = "Amount of RAM in MB"
  type        = number
  default     = 512

}

variable "cpu_number" {
  description = "Number of CPUs"
  type        = number
  default     = 1

}

variable "libvirt_disk_path" {
  description = "Path to the LibVirt pool"
  type        = string
  default     = "/opt/kvm/pool1"
}

variable "iso_path" {
  description = "Path to the ISO file of the OS"
  type        = string
  default     = ""
}

variable "vm_hostname" {
  description = "Hostname for the VM to be created"
  type        = string
  default     = "terraform-kvm-ansible"
}

variable "ssh_username" {
  description = "User to be created on the new environment"
  type        = string
  default     = "cloud_user"
}

variable "ssh_private_key" {
  description = "the private key to use"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "libvirt_host" {
  description = "URI to the Libvirt host"
  type        = string
  default     = "localhost"
}

variable "libvirt_user" {
  description = "User allowed to connect to KVM"
  type        = string
  default     = "eliel"

}
variable "volume_size" {
  description = "Size of the main volume in bytes. Described in https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume#size-3"
  type = number
  default = 1
}