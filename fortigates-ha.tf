

## Local OVF/OVA Source
data "vsphere_ovf_vm_template" "ovfFW" {
  name              = " FortiGate-VM64.ovf"
  disk_provisioning = "thin"
  resource_pool_id  = data.vsphere_resource_pool.default.id
  datastore_id      = data.vsphere_datastore.datastore.id
  host_system_id    = data.vsphere_host.host.id
  local_ovf_path    = var.fg-ovf # ova faults
  ovf_network_map = {
    "VM Network" : data.vsphere_network.network.id
  }
}


## Deployment of FGT-01
resource "vsphere_virtual_machine" "FGT-01" {
  name                 = "FGT-01"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfFW.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfFW.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfFW.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfFW.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfFW.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfFW.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2
  network_interface {
    network_id   = data.vsphere_network.vSw11.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw12.id
    adapter_type = "vmxnet3"
  }

  # Port 4
  network_interface {
    network_id   = data.vsphere_network.vSwHA-A.id
    adapter_type = "vmxnet3"
  }

  # Port 5
  network_interface {
    network_id   = data.vsphere_network.vSwHA-B.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfFW.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfFW.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfFW.ovf_network_map
  }

  cdrom {
    # client_device = true
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "_ISOs_/FG01.iso"
  }

  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}


## Deployment of FGT-02
resource "vsphere_virtual_machine" "FGT-02" {
  name                 = "FGT-02"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfFW.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfFW.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfFW.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfFW.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfFW.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfFW.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2
  network_interface {
    network_id   = data.vsphere_network.vSw21.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw22.id
    adapter_type = "vmxnet3"
  }

  # Port 4
  network_interface {
    network_id   = data.vsphere_network.vSwHA-A.id
    adapter_type = "vmxnet3"
  }

  # Port 5
  network_interface {
    network_id   = data.vsphere_network.vSwHA-B.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfFW.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfFW.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfFW.ovf_network_map
  }

  cdrom {
    # client_device = true
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "_ISOs_/FG02.iso"
  }

  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}