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
        }
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
                    Uri = 'Test';
                    #Checksum = ''; file://E:\ISOs\arcolinux-v20.7.5.iso
                    Description = 'Test';
                    MediaType = 'NULL';
                    OperatingSystem = 'Linux';
                }
            );
        };
    };
};