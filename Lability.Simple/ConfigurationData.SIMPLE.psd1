@{
    AllNodes = @(
        @{
            NodeName                    = 'CLIENT1';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            SwitchName                  = 'Default Switch','InternalTest';
            Media                       = 'arcolinux-v20.7.5';
            ProcessorCount              = 2;
            StartupMemory               = 4GB;
            PSDscAllowPlainTextPassword = $true;
            Lability_DvdDrive   = @{
                ControllerNumber   = 0;
                ControllerLocation = 1;
                Path = 'E:\ISOs\arcolinux-v20.7.5.iso';
            }
        };
    );
    NonNodeData = @{
        Lability = @{
            DSCResource = @(
                @{ Name = 'xComputerManagement';}
                @{ Name = 'xNetworking';}
            );
            Network = @(
                @{ Name = 'InternalTest'; Type = 'Internal' }
            );
            Media = @(
                @{
                    Id = 'arcolinux-v20.7.5';
                    Filename = 'Test';
                    Architecture = 'x64';
                    Uri = 'Test'; # file://E:\ISOs\arcolinux-v20.7.5.iso
                    #Checksum = '';
                    Description = 'Test';
                    MediaType = 'NULL';
                    OperatingSystem = 'Linux';
                }
            );
        };
    };
};