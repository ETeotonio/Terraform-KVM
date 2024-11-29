provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "vm_pool" {
  name = var.pool_name
  type = "dir"
  target {
    path = var.libvirt_disk_path
  }
}


resource "libvirt_volume" "volume_disk" {
  name   = "${var.pool_name}-disk"
  pool   = libvirt_pool.vm_pool.name
  size   = var.volume_size
}


resource "libvirt_domain" "vm_domain" {
  name   = var.vm_hostname
  memory = var.ram_size
  vcpu   = var.cpu_number

  network_interface {
    network_name   = "default"
    wait_for_lease = true
    hostname       = var.vm_hostname
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk { #! Main disk where the OS will be installed
    volume_id = libvirt_volume.volume_disk.id
  }

  disk {
    file = var.iso_path
  }
  boot_device {
    dev = [ "hd", "cdrom"]
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }

}