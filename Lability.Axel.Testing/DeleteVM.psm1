#Requires -RunAsAdministrator 
function Remove-VmAndFiles {
    param(
        [Parameter(Mandatory = $true)]
        [string] $VMName,
        [string] $VMLocation = "C:\vm\"
    )

    Stop-VM -Name $VMName -TurnOff -Force -ErrorAction SilentlyContinue
    Remove-VM -Name $VMName -Force
    Remove-Item -Path "${VMLocation}\${VMName}" -Recurse -ErrorAction SilentlyContinue -Force
}
