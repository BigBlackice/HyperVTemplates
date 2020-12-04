$target = Write-Host "Enter remote hostname: "
$DomainName = Write-Host "Enter Domain Name: "
$NID = Write-Host "Enter Network ID (***.***.***.*/**): "
$zone = Write-Host "Enter Zone File address (***.***.***): "

Invoke-Command -ComputerName $target {
    Add-WindowsFeature -Name DNS -IncludeManagementTools
    if($? -eq $true)
    {
        Add-DnsServerPrimaryZone -Name $DomainName -ZoneFile ($DomainName + ".dns") -DynamicUpdate NonsecureAndSecure -NetworkID $NID
        Add-DnsServerPrimaryZone -NetworkID $NID -ZoneFile ($zone + "in-addr.arpa.dns")
        Add-DnsServerResourceRecordA -Name $target -ZoneName $DomainName -AllowUpdateAny -CreatePtr
    }
    else 
    {
        Write-Output "Failed to add DNS server feature"
    }
}
