# Hyper-V Templates
### Lability deployment templates for Hyper-V

## General
NodeName                = The name of the VM.  
Lability_ProcessorCount = number of cores.  
Lability_Media          = Media used for installation, can be defined in NonNodeData.  

## Disk
Generation              = "VHD/VHDX".  
Type                    = "Fixed/Dynamic".    
MaximumSizeBytes        = The maximum size of the disk; can be written as **GB.  


## Media 
Id                      = The unique identifier for the media, what you will specify in the node declaration.  
Filename                = The name of the file to use.  
Architecture            = 'x64/x86'  
Uri                     = The path and filename of the file to use; not necessary if one of the evaluation medias are used.  
Checksum                = To check integrity of the ISO, usually left empty ''.  
Description             = A description of the media.  
MediaType               = 'ISO/VHD/VHDX/WIM/NULL'  
ImageName               = The index number of the WIM image within the ISO.  
OperatingSystem         = 'Windows/Linux' Specifies if Hyper-V or powershell can manage the installation and filesystem on the VM.  
CustomData              = Custom attributes you can set on the media.  
* PartitionStyle        = 'MBR/GPT(?)'  
* VmGeneration          = 1/2  



## Modules:
* xComputerManagement: https://github.com/PowerShell/xComputerManagement
* xNetworking:         https://github.com/PowerShell/xNetworking
* xActiveDirectory:    https://github.com/PowerShell/xActiveDirectory
* xSmbShare:           https://github.com/PowerShell/xSmbShare
* xDhcpServer:         https://github.com/PowerShell/xDhcpServer
* xDnsServer:          https://github.com/PowerShell/xDnsServer