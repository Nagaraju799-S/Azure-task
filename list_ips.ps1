
Connect-AzAccount

$subscriptionId = "f127a1a4-ee57-4959-992d-9bddbf4f5d69"
Set-AzContext -SubscriptionId $subscriptionId

$results = @()
$publicIps = Get-AzPublicIpAddress

foreach ($publicIp in $publicIps) {
    # $publicIp.IpAddress null
    if ($publicIp.IpAddress) {
        $publicIpAddress = $publicIp.IpAddress
    } else {
        $publicIpAddress = "N/A"
    }

    $results += [PSCustomObject]@{
        Name        = $publicIp.Name
        ResourceGroupName = $publicIp.ResourceGroupName
        IpAddress   = $publicIpAddress
    }
}

$results | Format-Table -AutoSize

$results | Export-Csv -Path "C:\Users\nagar\public_ips.csv" -NoTypeInformation

Write-Output "Public IPs list saved to C:\Users\nagar\public_ips.csv"