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
        [Hashtable]
        $Server
    )
    
}