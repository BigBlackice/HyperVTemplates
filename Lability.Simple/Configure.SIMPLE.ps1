Configuration SimpleConfig {
    param ()

    Import-DscResource -Module PSDesiredStateConfiguration

    Import-DscResource -Module xComputerManagement -ModuleVersion 4.1.0.0
    Import-DscResource -Module xNetworking -ModuleVersion 5.7.0.0

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

}