$target = Write-Host "Name of target machine"
Invoke-Command -ComputerName $target {
    add-windowsFeature -Name AD-Domain-Services -IncludeManagementTools
    if($? -eq $true) 
    {
    Write-Output "it installed"
    #$DomainName = Write-Host "Enter domain name"
    #looks like the install-addsforest will prmpt for the info it needs
    Install-ADDSForest #-DomainName $DomainName
    }
    else {
        Write-Output "failed to add feature, exiting"
        
    }
}
