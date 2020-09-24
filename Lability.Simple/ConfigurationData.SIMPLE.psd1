@{
    AllNodes = @(
        @{
            NodeName                    = 'CLIENT1';
            Role                        = 'CLIENT';
            InterfaceAlias              = 'Ethernet';
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            Lability_SwitchName         = 'Default Switch','InternalTest';
            Lability_Media              = 'WIN10_x64_Enterprise_EN_Eval';
            Lability_ProcessorCount     = 2;
            Lability_StartupMemory      = 4GB;
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
        };
    };
};