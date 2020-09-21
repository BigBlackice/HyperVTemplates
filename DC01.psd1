@{
    AllNodes = @(
        @{
            ## oc plz no steal
            NodeName = "DC01";
            Lability_ProcessorCount =2;
            Lability_Media = "en_windows_server_2019_09";
            
            Lability_HardDiskDrive = @(
             
            @{
                Generation = "VHDX";
                Type = "Dynamic"
                MaximumSizeBytes = 80GB;
            }
            )
        }
    )
}