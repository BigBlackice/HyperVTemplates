@{
    AllNodes = @(
        @{
            ## oc plz no steal
            ## comment 2
            NodeName = "DC01";
            Lability_ProcessorCount =2;
            Lability_Media = "DC01disk01";

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