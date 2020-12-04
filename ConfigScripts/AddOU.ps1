$target = Write-Host "Enter name of DC: "
$OUname = Write-Host "Enter OU name: "
$OUpath = Write-Host "Enter path/DN: "
if($OUpath -eq "root")
{
    Write-Host "domain name? " | ´
    $OUpath = "DC=" + $OUpath + ",DC=local"
}
Invoke-Command -ComputerName $target 
{
    New-ADOrganizationalUnit -Name $OUname -Path $OUpath
}