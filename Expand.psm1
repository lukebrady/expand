<#
    Expand is a simple way to automate and manage
    the resizing of disk partitions.

    Written By: Luke Brady

    Questions or Comments? Email me <luke.brady@ung.edu>
    University of North Georgia 2018
#>

. $PSScriptRoot\Functions\ConvertTo-ExHashTable.ps1
. $PSScriptRoot\Functions\Get-ExDiskQuota.ps1
. $PSScriptRoot\Functions\New-ExReport.ps1
. $PSScriptRoot\Functions\Set-ExDiskIncrease.ps1
. $PSScriptRoot\Functions\Set-ExDiskDecrease.ps1
. $PSScriptRoot\Functions\Set-ExDiskSize.ps1
. $PSScriptRoot\Functions\Test-ExVolume.ps1