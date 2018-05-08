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

function Get-ExDiskQuota 
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([Hashtable])]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        [String]
        $Server,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        [String]
        $Drive,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        [String]
        $Quota
    )
    
    Write-Host "$Server has a $Drive drive with a quota of $Quota GB."
}