# resource "time_sleep" "wait_200_seconds" {
#   create_duration = "200s"
# }



# output "FGT-01-ip" {
#   description = "all the registered ip address of the VM"
#   value       = vsphere_virtual_machine.FGT-01.*.guest_ip_addresses.1[0]

#   depends_on = [
#     time_sleep.wait_200_seconds,
#   ]
# }

# output "FGT-02-ip" {
#   description = "all the registered ip address of the VM"
#   value       = vsphere_virtual_machine.FGT-02.*.guest_ip_addresses.1[0]

#   depends_on = [
#     time_sleep.wait_200_seconds,
#   ]
# }
