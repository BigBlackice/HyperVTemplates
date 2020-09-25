@{
    AllNodes = @(
        @{
            NodeName                    = 'CLIENT1';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            SwitchName                  = 'Default Switch','InternalTest';
            Media                       = 'arcolinux';
            ProcessorCount              = 2;
            StartupMemory               = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_DvdDrive           = @{
                ControllerNumber        = 0;
                ControllerLocation      = 1;
                Path                    = 'E:\ISOs\pfSense-CE-2.4.5-RELEASE-p1-amd64.iso';
            }
        };
    );
    NonNodeData = @{
        Lability = @{
            EnvironmentPrefix = 'LAB-';
            DSCResource = @(
                @{ Name = 'xComputerManagement';}
                @{ Name = 'xNetworking';}
            );
            Network = @(
                @{ Name = 'InternalTest'; Type = 'Internal' }
            );
            Media = @(
                @{
                    Id = 'arcolinux';
                    Filename = 'Test';
                    Architecture = 'x64';
                    Uri = 'Test'; # file://E:\ISOs\arcolinux-v20.7.5.iso
                    #Checksum = '';
                    Description = 'Test';
                    MediaType = 'NULL';
                    OperatingSystem = 'Linux';
                    CustomData = @{
                        PartitionStyle = 'MBR';
		                VmGeneration = 1;
                    }
                }
                @{
                    Id = 'WindowsTest';
                    Filename = 'en_windows_server_2019_x64_dvd_3c2cf1202.iso';
                    Architecture = 'x64';
                    Uri = 'file://E:\ISOs\en_windows_server_2019_x64_dvd_3c2cf1202.iso';
                    Checksum = '';
                    Description = 'Test';
                    MediaType = 'ISO';
                    ImageName = '2';
                    OperatingSystem = 'Windows';
                }
            );
        };
    };
};