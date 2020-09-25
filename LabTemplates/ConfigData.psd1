@{
    AllNodes = @(
      @{
            ## oc plz no steal
            NodeName                    = 'DC01';
            Role                        = 'SERVER';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_ProcessorCount     = 2;
            Lability_StartupMemory      = 2GB;
            Lability_Media              = 'windows_server';
            Lability_SwitchName = 'Internal';
            Lability_HardDiskDrive = @(
            @{
                Generation = 'VHDX';
                Type = 'Dynamic'
                MaximumSizeBytes = 80GB;
            }
            );
        }
        @{
            NodeName                    = 'PFSENSE1';
            Role                        = 'ROUTER';
            InterfaceAlias              = 'Ethernet';
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'pfSense-2.4.5-amd64';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 2GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_SwitchName = 'Default Switch',  'Internal';
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
            Lability_Media              = 'Windows10en-us';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_SwitchName = 'Internal';
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
            Lability_SwitchName = 'Internal';
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
            Lability_Media              = 'Windows10en-us';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_SwitchName = 'Default Switch';
            Lability_HardDiskDrive = @(
                @{
                    Generation = "VHDX";
                    Type = "Dynamic"
                    MaximumSizeBytes = 60GB;
                }
                );
        }
    );
    NonNodeData = @{
        Lability = @{
            EnvironmentPrefix = 'LAB-';
            DSCResource = @(
                @{ Name = 'xComputerManagement';}
                @{ Name = 'xNetworking';}
            );
            Network = @(
                @{ Name = 'Internal'; Type = 'Internal'; }
            );
            Media = @(
                @{
                    Id = 'windows_server';
                    Filename = 'en_windows_server_2019_09.iso';
                    Architecture = 'x64';
                    Uri = 'file://D:\Lability\ISOs\en_windows_server_2019_09.iso';
                    Checksum = '';
                    Description = 'w2019 64bit server';
                    MediaType = 'ISO';
                    ImageName = '2';
                    OperatingSystem = 'Windows';
                }
                @{
                    Id = 'Windows10en-us';
                    Filename = 'Windows10en-us.iso';
                    Architecture = 'x64';
                    Uri = 'file://D:\Lability\ISOs\Windows10en-us.iso';
                    Checksum = '';
                    Description = 'w10 amd/intel';
                    MediaType = 'ISO';
                    ImageName = '2';
                    OperatingSystem = 'Windows';

                }
            );
        };
    };
};