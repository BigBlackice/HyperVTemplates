@{
    AllNodes = @(
        @{
            ## oc plz no steal
            NodeName                    = "DC01";
            Role                        = 'SERVER';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_ProcessorCount     = 2;
            Lability_StartupMemory      = 2GB;
            Lability_Media              = "en_windows_server_2019_09";
            
            Lability_HardDiskDrive = @(
            @{
                Generation = "VHDX";
                Type = "Dynamic"
                MaximumSizeBytes = 80GB;
            }
            );
        }
        @{
            NodeName                    = 'PFSENSE1';
            Role                        = 'ROUTER';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'pfSense-2.4.5-amd64';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 2GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_HardDiskDrive = @(
                @{
                    Generation = "VHDX";
                    Type = "Dynamic"
                    MaximumSizeBytes = 10GB;
                }
                );
        }
        @{
            NodeName                    = 'CLIENT1';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'Windows10en-us.iso';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_HardDiskDrive = @(
                @{
                    Generation = "VHDX";
                    Type = "Dynamic"
                    MaximumSizeBytes = 50GB;
                }
                );
        
        }
        @{
            NodeName                    = 'FREENAS1';
            Role                        = 'FILESHARE';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'FreeNAS-11.3';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_HardDiskDrive = @(
                @{
                    Generation = "VHDX";
                    Type = "Dynamic"
                    MaximumSizeBytes = 50GB;
                }
                );

        }
        @{
            NodeName                    = 'CLIENT2';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'Windows10en-us.iso';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_HardDiskDrive = @(
                @{
                    Generation = "VHDX";
                    Type = "Dynamic"
                    MaximumSizeBytes = 50GB;
                }
                );
        }
    );
    NoneNodeData = @{
        Lability = @{
            DSCResource = @(
                @{ Name = 'xComputerManagement';}
                @{ Name = 'xNetworking';}
            );
            Media = @(
                @{
                    Id = 'pfSense-2.4.5-amd64';
                    Filename = 'pfSense-CE-2.4.5-RELEASE-p1-amd64.iso';
                    Architecture = 'x64';
                    Uri = 'file://C:\Lability\ISOs\pfSense-CE-2.4.5-RELEASE-amd64.iso';
                    Checksum = '';
                    Description = 'pfSense 64-bit AMD/Intel';
                    MediaType = 'ISO';
                    ImageName = 'pfSense 64-bit';
                    OperatingSystem = 'Linux';
                }
                @{
                    Id = 'FreeNAS-11.3';
                    Filename = 'FreeNAS-11.3-U4.1.iso';
                    Architecture = 'x64';
                    Uri = 'file://C:\Lability\ISOs\FreeNAS-11.3-U4.1.iso';
                    Checksum = '';
                    Description = 'FreeNAS amd/intel';
                    MediaType = 'ISO';
                    ImageName = 'freenas 64-bit';
                    OperatingSystem = 'Linux';

                }
            );
            
        };
    };
};