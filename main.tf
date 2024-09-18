

provider "vsphere" {

  user                 = var.username
  password             = var.password
  vsphere_server       = "192.168.124.12"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_host" "host" {
  name          = "192.168.124.15"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve datastore information on vsphere
data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "clustera"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "default" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.dc.id
}


# # Retrieve template information on vsphere
# data "vsphere_virtual_machine" "fgt76template" {
#   name          = "FGT76TEMPLATE"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }





