

## Local OVF/OVA Source
data "vsphere_ovf_vm_template" "ovfSwitch" {
  name              = " FortiSwitch-24VM.ovf"
  disk_provisioning = "thin"
  resource_pool_id  = data.vsphere_resource_pool.default.id
  datastore_id      = data.vsphere_datastore.datastore.id
  host_system_id    = data.vsphere_host.host.id
  local_ovf_path    = var.sw-ovf # ova faults
  ovf_network_map = {
    "VM Network" : data.vsphere_network.network.id
  }
}


## Deployment of FSW-01
resource "vsphere_virtual_machine" "FSW-01" {
  name                 = "FSW-01"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

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
    network_id   = data.vsphere_network.vSwLAG-A.id
    adapter_type = "vmxnet3"
  }

  # Port 6
  network_interface {
    network_id   = data.vsphere_network.vSwLAG-A.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    # client_device = true
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "_ISOs_/SW01.iso"
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}


## Deployment of FSW-02
resource "vsphere_virtual_machine" "FSW-02" {
  name                 = "FSW-02"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

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
    network_id   = data.vsphere_network.vSw12.id
    adapter_type = "vmxnet3"
  }

  # Port 4
  network_interface {
    network_id   = data.vsphere_network.vSwLAG-A.id
    adapter_type = "vmxnet3"
  }

  # Port 5
  network_interface {
    network_id   = data.vsphere_network.vSwLAG-B.id
    adapter_type = "vmxnet3"
  }

  # Port 6
  network_interface {
    network_id   = data.vsphere_network.vSwUpB.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    client_device = true
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}



## Deployment of FSW-03
resource "vsphere_virtual_machine" "FSW-03" {
  name                 = "FSW-03"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2 
  network_interface {
    network_id   = data.vsphere_network.vSwUpA.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw34.id
    adapter_type = "vmxnet3"
  }

  # Port 4
  network_interface {
    network_id   = data.vsphere_network.vSwPcA.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    client_device = true
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}

## Deployment of FSW-04
resource "vsphere_virtual_machine" "FSW-04" {
  name                 = "FSW-04"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2 
  network_interface {
    network_id   = data.vsphere_network.vSw34.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw45.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    client_device = true
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}

## Deployment of FSW-05
resource "vsphere_virtual_machine" "FSW-05" {
  name                 = "FSW-05"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2 
  network_interface {
    network_id   = data.vsphere_network.vSw45.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw56.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    client_device = true
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}


## Deployment of FSW-06
resource "vsphere_virtual_machine" "FSW-06" {
  name                 = "FSW-06"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  host_system_id       = data.vsphere_host.host.id
  resource_pool_id     = data.vsphere_resource_pool.default.id
  num_cpus             = data.vsphere_ovf_vm_template.ovfSwitch.num_cpus
  num_cores_per_socket = data.vsphere_ovf_vm_template.ovfSwitch.num_cores_per_socket
  memory               = data.vsphere_ovf_vm_template.ovfSwitch.memory
  guest_id             = data.vsphere_ovf_vm_template.ovfSwitch.guest_id
  # firmware             = data.vsphere_ovf_vm_template.ovfSwitch.firmware
  scsi_type = data.vsphere_ovf_vm_template.ovfSwitch.scsi_type

  # Port 1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  # Port 2 
  network_interface {
    network_id   = data.vsphere_network.vSwUpB.id
    adapter_type = "vmxnet3"
  }

  # Port 3
  network_interface {
    network_id   = data.vsphere_network.vSw56.id
    adapter_type = "vmxnet3"
  }

  # Port 4
  network_interface {
    network_id   = data.vsphere_network.vSwPcB.id
    adapter_type = "vmxnet3"
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = data.vsphere_ovf_vm_template.ovfSwitch.local_ovf_path
    disk_provisioning         = data.vsphere_ovf_vm_template.ovfSwitch.disk_provisioning
    ovf_network_map           = data.vsphere_ovf_vm_template.ovfSwitch.ovf_network_map
  }

  cdrom {
    client_device = true
  }


  lifecycle {
    ignore_changes = [
      vapp[0].properties,
    ]
  }
}