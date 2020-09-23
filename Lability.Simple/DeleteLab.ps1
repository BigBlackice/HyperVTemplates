#Requires -RunAsAdministrator 
$VMName = Read-Host -Prompt "Enter hostname of VM to delete"
Stop-VM -Name $VMName -TurnOff -Force
Remove-VM -Name $VMName -Force
Remove-Item -Path "${env:LabilityDifferencingVhdPath}\${VMName}*" -ErrorAction SilentlyContinue -Force