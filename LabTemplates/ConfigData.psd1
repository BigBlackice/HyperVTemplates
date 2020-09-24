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
            Lability_SwitchName = 'Internal';
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
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'pfSense-2.4.5-amd64';
            #Lability_ProcessorCount     = 1;
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
            Lability_Media              = 'Windows10en-us.iso';
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
            #Lability_Media              = 'FreeNAS-11.3';
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
            Lability_Media              = 'Windows10en-us.iso';
            Lability_ProcessorCount     = 1;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_SwitchName = 'Default Switch';
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
            Network = @(
                @{ Name = 'Internal'; Type = 'Internal'; }
            );
            Media = @(
                @{
                    Id = 'en_windows_server_2019_09';
                    Filename = 'en_windows_server_2019_09.iso';
                    Architecture = 'x64';
                    Uri = 'file://C:\Lability\ISOs\en_windows_server_2019_09.iso';
                    Checksum = '';
                    Description = 'w2019 64bit server';
                    MediaType = 'ISO';
                    OperatingSystem = 'Windows';
                }
                @{
                    Id = 'Windows10en-us.iso';
                    Filename = 'Windows10en-us.iso.iso';
                    Architecture = 'x64';
                    Uri = 'file://C:\Lability\ISOs\Windows10en-us.iso.iso';
                    Checksum = '';
                    Description = 'w10 amd/intel';
                    MediaType = 'ISO';
                    ImageName = 'w10 64bit';
                    OperatingSystem = 'Windows';

                };
            );
        };
    };
};