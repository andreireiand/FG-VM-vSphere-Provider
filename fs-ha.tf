resource "vsphere_host_virtual_switch" "vSwHA" {
  name                   = "vSwHA"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

## HA Link A

resource "vsphere_host_port_group" "vSwHA-A" {
  name                = "vSwHA-A"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwHA.name
}

data "vsphere_network" "vSwHA-A" {
  name          = "vSwHA-A"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwHA-A,
  ]
}

## HA Link B

resource "vsphere_host_port_group" "vSwHA-B" {
  name                = "vSwHA-B"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwHA.name
}

data "vsphere_network" "vSwHA-B" {
  name          = "vSwHA-B"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwHA-B,
  ]
}
