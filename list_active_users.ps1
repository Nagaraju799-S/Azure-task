
Write-Output "Connecting to Azure..."
Connect-AzAccount
Write-Output "Current context:"
$context = Get-AzContext
$context | Format-List

Write-Output "Setting subscription..."
Set-AzContext -SubscriptionId "f127a1a4-ee57-4959-992d-9bddbf4f5d69"

Write-Output "Fetching all users..."
$users = Get-AzADUser | Select-Object DisplayName, UserPrincipalName, AccountEnabled

if ($users) {
    Write-Output "Found users, displaying data:"
    $users | Format-Table -AutoSize
    $users | Export-Csv -Path "active_users.csv" -NoTypeInformation
    Write-Output "Data successfully saved to active_users.csv"
} else {
    Write-Output "No users found or error occurred."
}