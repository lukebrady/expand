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
function Set-ExDiskIncrease
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String]
        $Disk,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        [int]
        $AllocationSizeGB
    )
    
    $status = Check-Volume -Disk $Disk
    [double] $currentSize = $(Get-Volume -DriveLetter $Disk).Size
    [double] $remainingSize = $(Get-Volume -DriveLetter $Disk).SizeRemaining
    [double] $repartitionSize = ($AllocationSizeGB * 1GB)

    if($status -eq $true -and $remainingSize -gt $repartitionSize)
    {
        Resize-Partition -DriveLetter $Disk -Size $($currentSize + $repartitionSize)
        $postSize = ((Get-Volume -DriveLetter $Disk).Size / 1073741824)
        Write-Output "Volume $Disk is now $postSize GB."
    }
}