
Connect-AzAccount

$subscriptionId = "f127a1a4-ee57-4959-992d-9bddbf4f5d69"
Set-AzContext -SubscriptionId $subscriptionId

$vms = Get-AzVM -Status | Where-Object { $_.PowerState -eq "VM running" } | Select-Object Name, ResourceGroupName, Location, PowerState

$vms | Format-Table -AutoSize

$vms | Export-Csv -Path "C:\Users\nagar\active_vms.csv" -NoTypeInformation

Write-Output "Active VMs list saved to C:\Users\nagar\active_vms.csv"