resource "time_sleep" "wait_3_seconds" {
  create_duration = "3s"
}

resource "vsphere_host_virtual_switch" "Dummy" {
  name                   = "Dummy"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "Dummy" {
  name                = "Dummy"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.Dummy.name
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

## First Firewall

resource "vsphere_host_virtual_switch" "vSw11" {
  name                   = "vSw11"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw11" {
  name                = "vSw11"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw11.name
}

data "vsphere_network" "vSw11" {
  name          = "vSw11"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw11,
  ]
}


resource "vsphere_host_virtual_switch" "vSw12" {
  name                   = "vSw12"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw12" {
  name                = "vSw12"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw12.name
}

data "vsphere_network" "vSw12" {
  name          = "vSw12"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw12,
  ]
}


## Second Firewall

resource "vsphere_host_virtual_switch" "vSw21" {
  name                   = "vSw21"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw21" {
  name                = "vSw21"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw21.name
}

data "vsphere_network" "vSw21" {
  name          = "vSw21"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw21,
  ]
}


resource "vsphere_host_virtual_switch" "vSw22" {
  name                   = "vSw22"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw22" {
  name                = "vSw22"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw22.name
}

data "vsphere_network" "vSw22" {
  name          = "vSw22"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw22,
  ]
}


## MCLAG Core Switches

resource "vsphere_host_virtual_switch" "vSwLAG-A" {
  name                   = "vSwLAG-A"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwLAG-A" {
  name                = "vSwLAG-A"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwLAG-A.name
}

data "vsphere_network" "vSwLAG-A" {
  name          = "vSwLAG-A"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwLAG-A,
  ]
}

resource "vsphere_host_virtual_switch" "vSwLAG-B" {
  name                   = "vSwLAG-B"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwLAG-B" {
  name                = "vSwLAG-B"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwLAG-B.name
}

data "vsphere_network" "vSwLAG-B" {
  name          = "vSwLAG-B"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwLAG-B,
  ]
}

resource "vsphere_host_virtual_switch" "vSwUpA" {
  name                   = "vSwUpA"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwUpA" {
  name                = "vSwUpA"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwUpA.name
}

data "vsphere_network" "vSwUpA" {
  name          = "vSwUpA"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwUpA,
  ]
}

resource "vsphere_host_virtual_switch" "vSwUpB" {
  name                   = "vSwUpB"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwUpB" {
  name                = "vSwUpB"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwUpB.name
}

data "vsphere_network" "vSwUpB" {
  name          = "vSwUpB"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwUpB,
  ]
}

resource "vsphere_host_virtual_switch" "vSw34" {
  name                   = "vSw34"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw34" {
  name                = "vSw34"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw34.name
}

data "vsphere_network" "vSw34" {
  name          = "vSw34"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw34,
  ]
}

resource "vsphere_host_virtual_switch" "vSw45" {
  name                   = "vSw45"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw45" {
  name                = "vSw45"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw45.name
}

data "vsphere_network" "vSw45" {
  name          = "vSw45"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw45,
  ]
}

resource "vsphere_host_virtual_switch" "vSw56" {
  name                   = "vSw56"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSw56" {
  name                = "vSw56"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSw56.name
}

data "vsphere_network" "vSw56" {
  name          = "vSw56"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSw56,
  ]
}


resource "vsphere_host_virtual_switch" "vSwPcA" {
  name                   = "vSwPcA"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwPcA" {
  name                = "vSwPcA"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwPcA.name
}

data "vsphere_network" "vSwPcA" {
  name          = "vSwPcA"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwPcA,
  ]
}

resource "vsphere_host_virtual_switch" "vSwPcB" {
  name                   = "vSwPcB"
  host_system_id         = data.vsphere_host.host.id
  network_adapters       = []
  active_nics            = []
  mtu                    = 9000
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_port_group" "vSwPcB" {
  name                = "vSwPcB"
  vlan_id             = 4095
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwPcB.name
}

data "vsphere_network" "vSwPcB" {
  name          = "vSwPcB"
  datacenter_id = data.vsphere_datacenter.dc.id

  depends_on = [
    time_sleep.wait_3_seconds,
    vsphere_host_port_group.vSwPcB,
  ]
}
