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
function Test-ExVolume
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
        $Disk
    )

    $volume = Get-Volume -DriveLetter $Disk
    $remaining = $volume.SizeRemaining
    $status = $null

    if($remaining -lt 5GB)
    {
        $status = $true
        Create-Report -CurrentStatusOfDisk $status -reportRec "luke.brady@ung.edu"
    }

    else
    {
        $status = $false
    }

    return $status
}