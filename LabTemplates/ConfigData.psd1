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
            )
        }
    );
    NoneNodeData = @{
        Lability = @{
            DSCResource = @(
                @{ Name = 'xComputerManagement'; RequiredVersion = '4.1.0.0'; }
                @{ Name = 'xNetworking'; RequiredVersion = '5.7.0.0'; }
            );
        };
    };
};