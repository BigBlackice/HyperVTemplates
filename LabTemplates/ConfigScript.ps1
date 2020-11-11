Configuration SimpleConfig {
    param (
        # Defining the credentials used for the Domain admin.
        [Parameter()] [ValidateNotNull()] [PSCredential] $Credential = (Get-Credential -Credential 'Administrator')
    )

    # Installing all the needed modules
    Install-Module xComputerManagement
    Install-Module xNetworking
    Install-Module xDnsServer
    Install-Module xDHCPServer
    Install-Module xSmbShare
    Install-Module xActiveDirectory
    

    # Importing all the needed modules
    Import-DscResource -Module PSDesiredStateConfiguration;
    Import-DscResource -Module xComputerManagement;
    Import-DscResource -Module xNetworking;
    Import-DscResource -Module xDnsServer;
    Import-DscResource -Module xDHCPServer;
    Import-DscResource -Module xSmbShare;
    Import-DscResource -Module xActiveDirectory;


    # Common configuration for all nodes
    node $AllNodes.Where({$_.Role -in 'CLIENT'}).NodeName {

        # Configure the DSC LocalConfigurationManager (LCM)
        # In general, Lability configs will use an LCM section like this
        # Details for configuring the LCM can be found at
        # <https://docs.microsoft.com/en-us/powershell/dsc/metaconfig>
        LocalConfigurationManager {
            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode    = 'ApplyOnly';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv4
        xFirewall 'FPS-ICMP4-ERQ-In' {
            Name        = 'FPS-ICMP4-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv4-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv6
        xFirewall 'FPS-ICMP6-ERQ-In' {
            Name        = 'FPS-ICMP6-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv6-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Set the VM's hostname
        xComputer 'Hostname' {
            Name = $node.NodeName;
        }

    }

    node $AllNodes.Where({$_.Role -in 'SERVER'}).NodeName {

        LocalConfigurationManager {
            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode    = 'ApplyOnly';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv4
        xFirewall 'FPS-ICMP4-ERQ-In' {
            Name        = 'FPS-ICMP4-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv4-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv6
        xFirewall 'FPS-ICMP6-ERQ-In' {
            Name        = 'FPS-ICMP6-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv6-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Set the VM's hostname
        xComputer 'Hostname' {
            Name = $node.NodeName;
        }

        ## Hack to fix DependsOn with hypens "bug" :(
            foreach ($feature in @(
                'RSAT',
                'AD-Domain-Services',
                'GPMC',
                'RSAT-AD-Tools',
                'DHCP',
                'DNS',
                'RSAT-DHCP',
                'RSAT-DNS-Server'
            )) {
            WindowsFeature $feature.Replace('-','') {

                Ensure               = 'Present';
                Name                 = $feature;
                IncludeAllSubFeature = $true;
            }
        }

        xADDomain 'ADDomain' {

            DomainName                    = $node.DomainName;
            SafemodeAdministratorPassword = $Credential;
            DomainAdministratorCredential = $Credential;
            DependsOn                     = '[WindowsFeature]ADDomainServices';
        }

        xDhcpServerAuthorization 'DhcpServerAuthorization' {

            Ensure    = 'Present';
            DependsOn = '[WindowsFeature]DHCP','[xADDomain]ADDomain';
        }

        xDhcpServerScope 'DhcpScope10_0_0_0' {

            ScopeID       = 'DhcpScope10_0_0_0ID'; # Added cuz VSCode was complaining, might not be needed.
            Name          = 'Corpnet';
            IPStartRange  = '10.0.0.100';
            IPEndRange    = '10.0.0.200';
            SubnetMask    = '255.255.255.0';
            LeaseDuration = '00:08:00';
            State         = 'Active';
            AddressFamily = 'IPv4';
            DependsOn     = '[WindowsFeature]DHCP';
        }

        xDhcpServerOption 'DhcpScope10_0_0_0_Option' {

            ScopeID            = '10.0.0.0';
            DnsDomain          = 'test.com';
            DnsServerIPAddress = '10.0.0.1';
            Router             = '10.0.0.1';
            AddressFamily      = 'IPv4';
            DependsOn          = '[xDhcpServerScope]DhcpScope10_0_0_0';
        }

        xADUser User1 {

            DomainName  = $node.DomainName;
            UserName    = 'User1';
            Description = 'Lability Test Lab user';
            Password    = $Credential;
            Ensure      = 'Present';
            DependsOn   = '[xADDomain]ADDomain';
        }

        xADGroup DomainAdmins {

            GroupName        = 'Domain Admins';
            MembersToInclude = 'User1';
            DependsOn        = '[xADUser]User1';
        }

        xADGroup EnterpriseAdmins {

            GroupName        = 'Enterprise Admins';
            GroupScope       = 'Universal';
            MembersToInclude = 'User1';
            DependsOn        = '[xADUser]User1';
        }

        xDnsServerPrimaryZone 'test_com' {

            Name      = 'test.com';
            DependsOn = '[WindowsFeature]DNS';
        }

        xDnsRecord 'DC01_test_com' {

            Name      = 'DC01';
            Target    = '10.0.0.1';
            Zone      = 'test.com';
            Type      = 'ARecord';
            DependsOn = '[xDnsServerPrimaryZone]test_com';
        }
    }


    
    node $AllNodes.Where({$_.Role -in 'ROUTER','FILESHARE'}).NodeName {
        LocalConfigurationManager {
            RebootNodeIfNeeded   = $true;
            AllowModuleOverwrite = $true;
            ConfigurationMode    = 'ApplyOnly';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv4
        xFirewall 'FPS-ICMP4-ERQ-In' {
            Name        = 'FPS-ICMP4-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv4-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Enable ICMP ECHO (aka ping) requests over IPv6
        xFirewall 'FPS-ICMP6-ERQ-In' {
            Name        = 'FPS-ICMP6-ERQ-In';
            DisplayName = 'File and Printer Sharing (Echo Request - ICMPv6-In)';
            Description = 'Echo request messages are sent as ping requests to other nodes.';
            Direction   = 'Inbound';
            Action      = 'Allow';
            Enabled     = 'True';
            Profile     = 'Any';
        }

        # Set the VM's hostname
        xComputer 'Hostname' {
            Name = $node.NodeName;
        }
        

    }

}