
Connect-AzAccount

$subscriptions = Get-AzSubscription | Select-Object Name, Id, TenantId

$subscriptions | Format-Table -AutoSize

$subscriptions | Export-Csv -Path "subscriptions.csv" -NoTypeInformation