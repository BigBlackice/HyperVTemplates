[CmdletBinding()] Param(
    [SecureString] $AdminPassword = (Read-Host -AsSecureString -Prompt "Admin password"),
    [string] $ConfigurationData = (Join-Path -Path $PSScriptRoot -ChildPath ConfigData.psd1),
    [string] $ConfigureScript = (Join-Path -Path $PSScriptRoot -ChildPath ConfigScript.ps1),
    [string] $DscConfigName = "TemplateConfig",
    [switch] $IgnorePendingReboot
)

$ErrorActionPreference = "Stop"

Import-Module -Name Lability

. $ConfigureScript
& $DscConfigName -ConfigurationData $ConfigurationData -OutputPath $env:LabilityConfigurationPath -Verbose
Start-LabConfiguration -ConfigurationData $ConfigurationData -Path $env:LabilityConfigurationPath -Verbose -Password $AdminPassword -IgnorePendingReboot:$IgnorePendingReboot
Start-Lab -ConfigurationData $ConfigurationData -Verbose
Set-VMDvdDrive -vmname  "PFSENSE1" -Path "C:\Lability\ISOs\pfSense-CE-2.4.5-RELEASE-amd64.iso";