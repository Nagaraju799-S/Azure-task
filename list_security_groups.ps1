Connect-AzAccount

$groups = Get-AzADGroup | Where-Object { $_.SecurityEnabled -eq $true } | Select-Object DisplayName, Id

$groups | Format-Table -AutoSize

$groups | Export-Csv -Path "security_groups.csv" -NoTypeInformation