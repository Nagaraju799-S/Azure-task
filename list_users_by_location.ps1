Connect-AzAccount

$users = Get-AzADUser | Select-Object DisplayName, UserPrincipalName, City, Country

$users | Format-Table -AutoSize

$users | Export-Csv -Path "users_by_location.csv" -NoTypeInformation