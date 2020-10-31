@{
    AllNodes = @(
        @{
            NodeName                    = 'DC1';
            Role                        = 'SERVER';
            InterfaceAlias              = 'Ethernet';
            SecondaryInterfaceAlias     = 'Ethernet 2';
            AddressFamily               = 'IPv4';
            SwitchName                  = 'External','Default Switch';
            Media                       = 'WindowsTest';
            ProcessorCount              = 2;
            StartupMemory               = 4GB;
            PSDscAllowPlainTextPassword = $true;
            DomainName                  = 'test.com';
            IPAddress                   = '10.0.0.1';
            DnsServerAddress            = '127.0.0.1';
<#             Lability_DvdDrive           = @{
                ControllerNumber        = 0;
                ControllerLocation      = 1;
                Path                    = 'E:\ISOs\pfSense-CE-2.4.5-RELEASE-p1-amd64.iso';
            } #>
        };
    );
    NonNodeData = @{
        Lability = @{
            EnvironmentPrefix = 'LAB-';
            DSCResource = @(
                @{ Name = 'xComputerManagement'; }
                @{ Name = 'xSmbShare';}
                @{ Name = 'xNetworking';}
                @{ Name = 'xActiveDirectory';}
                @{ Name = 'xDnsServer';}
                @{ Name = 'xDhcpServer';}
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
