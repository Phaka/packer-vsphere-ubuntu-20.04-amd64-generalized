locals {
  timestamp = formatdate("EEE, DD MMM YYYY hh:mm:ss ZZZ", timestamp())
  suffix = formatdate("YYYYMMDD'T'hhmm", timestamp())
  vm_name = "Ubuntu-20.04-amd64-${local.suffix}"
  iso_path = join("", [var.iso_path_prefix, var.iso_path])
  boot_commands = <<-EOT
    <f2><wait>
    <enter><wait>
    <f6><wait><esc><wait>
    <bs><bs><bs><bs>
    autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ 
    --- <enter>
    EOT
}