terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}

data "sops_file" "proxmox_secrets" {
  source_file = "./proxmox_secrets.yaml"
}

provider "proxmox" {
  pm_api_url          = data.sops_file.proxmox_secrets.data["proxmox_api_url"]
  pm_api_token_id     = data.sops_file.proxmox_secrets.data["proxmox_api_token_id"]
  pm_api_token_secret = data.sops_file.proxmox_secrets.data["proxmox_api_token_secret"]
}

resource "proxmox_vm_qemu" "your-vm" {
  # VM General Settings
  target_node = "test"
  #vmid = "100"
  name = "vm-name"
  desc = "Description"

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings
  clone = "your-clone"

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores   = 1
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = 1024

  # VM Network Settings
  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # (Optional) IP Address and Gateway
  # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"

  # (Optional) Default User
  # ciuser = "your-username"

  # (Optional) Add your SSH KEY
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF
}
