<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Disk
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#> 
function Set-ExDiskSize
{
    
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String[]]
        $Disks,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        [int]
        $AllocationSizeGB,
        # By Default this will try to increase drive space.
        $Increase = $true
    )
    
    foreach($disk in $Disks)
    {
        if($Increase -eq $true)
        {
            try
            {
                Increase-Disk -Disk $disk -AllocationSizeGB $AllocationSizeGB
            }
            catch
            {
                $Error
            }
        }
        
        else
        {
            try
            {
                Decrease-Disk -Disk $disk -AllocationSizeGB $AllocationSizeGB
            }
            catch
            {
                $Error
            }
        }        
    }
}