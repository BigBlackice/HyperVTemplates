[CmdletBinding()] Param(
    [string] $ConfigurationData = (Join-Path -Path $PSScriptRoot -ChildPath ConfigurationData.SIMPLE.psd1),
    [string] $ConfigureScript = (Join-Path -Path $PSScriptRoot -ChildPath Configure.SIMPLE.ps1),
    [string] $DscConfigName = "SimpleDelete",
    [switch] $IgnorePendingReboot
)

$ErrorActionPreference = "Stop"

Import-Module -Name Lability

. $ConfigureScript
& $DscConfigName -ConfigurationData $ConfigurationData -OutputPath $env:LabilityConfigurationPath -Verbose
Start-LabConfiguration -ConfigurationData $ConfigurationData -Path $env:LabilityConfigurationPath -Verbose -IgnorePendingReboot:$IgnorePendingReboot
Start-Lab -ConfigurationData $ConfigurationData -Verbose