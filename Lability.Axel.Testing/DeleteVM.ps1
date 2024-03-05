#Requires -RunAsAdministrator 

param(
    [Parameter(Mandatory = $true)]
    [string] $VMName,
    [string] $VMLocation = "C:\vm\"
)

Stop-VM -Name $VMName -TurnOff -Force -ErrorAction SilentlyContinue
Remove-VM -Name $VMName -Force
Remove-Item -Path "${VMLocation}\${VMName}" -ErrorAction SilentlyContinue -Force