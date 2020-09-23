@{
    AllNodes = @(
        @{
            NodeName                    = 'CLIENT1';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            AddressFamily               = 'IPv4';
            Lability_Media              = 'WIN10_x64_Enterprise_EN_Eval';
            Lability_ProcessorCount     = 2;
            Lability_StartupMemory      = 4GB;
            PSDscAllowPlainTextPassword = $true;
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
        }
    );
    NonNodeData = @{
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
                    Uri = 'file://E:\ISOs\pfSense-CE-2.4.5-RELEASE-p1-amd64.iso';
                    Checksum = '';
                    Description = 'pfSense 64-bit AMD/Intel';
                    MediaType = 'ISO';
                    ImageName = 'pfSense 64-bit';
                    OperatingSystem = 'Linux';
                }
            );
        };
    };
};