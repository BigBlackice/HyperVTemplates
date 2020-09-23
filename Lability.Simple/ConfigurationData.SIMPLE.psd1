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
            Lability_Media              = 'pfSense';
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
                    Id = "pfSense";
                    Filename = "pfSense.vhdx";
                    Description = "pfSense 64-bit AMD/Intel VHDX file";
                    Architecture = "x64";
                    MediaType = "VHD";
                    OperatingSystem = "Linux";
                    Uri = "file://H:\Lability\MasterVirtualHardDisks\pfSense.vhdx";
                }
            );
        };
    };
};