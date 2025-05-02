
Connect-AzAccount

$vms = Get-AzVM | Select-Object Name, ResourceGroupName, Location, @{Name="OS";Expression={$_.StorageProfile.OsDisk.OsType}}

$vms | Format-Table -AutoSize

$vms | Export-Csv -Path "vms_by_os.csv" -NoTypeInformation