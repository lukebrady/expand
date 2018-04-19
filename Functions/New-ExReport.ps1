<#
.SYNOPSIS
Generates a report of current disk allocation based on quota.

.DESCRIPTION
Long description

.PARAMETER Disk
The disk(s) that will be tested and reported on.

.EXAMPLE
New-ExReport -Disk C

.NOTES
General notes
#> 
function New-ExReport
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        [String[]]
        $Disk,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        $CurrentStatusOfDisk = $false,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$false)]
        [String[]]
        $Recipients
    )

    if($CurrentStatusOfDisk -ne $true)
    {
        $currentDiskSize = "$(((Get-Volume -DriveLetter $Disk).Size) / 1073741824) GB"
        $currentDiskSizeRemaining = "$(((Get-Volume -DriveLetter $Disk).SizeRemaining) / 1073741824) GB"
        # Generate the HTML report.
        $report  = "<h3>Disk Status for $(env:COMPUTERNAME)</h3>"
        $report += "<p>Disk Total : $currentDiskSize</p>"
        $report += "<p>Disk Space Remaining : $currentDiskSizeRemaining</p></br>"
        $report += "<p>Disk Status is good!</p>"
        
        Send-MailMessage -To $reportRec -Body $report -From "expand@ung.edu" -Subject "Test HTML Report."`
                         -SmtpServer "smtp.ung.edu" -BodyAsHtml:$true -Encoding "utf-8"
    }
    
    
    else
    {
        $currentDiskSize = "$(((Get-Volume -DriveLetter $Disk).Size) / 1073741824) GB"
        $currentDiskSizeRemaining = "$(((Get-Volume -DriveLetter $Disk).SizeRemaining) / 1073741824) GB"
        # Generate the HTML report.
        $report  = "<h3>Disk Status for $(env:COMPUTERNAME)</h3>"
        $report += "<p>Disk Total : $currentDiskSize</p>"
        $report += "<p>Disk Space Remaining : $currentDiskSizeRemaining</p></br>"
        $report += "<p>Disk Status is good!</p>"
        
        Send-MailMessage -To $reportRec -Body $report -From "expand@ung.edu" -Subject "Test HTML Report."`
                         -SmtpServer "smtp.ung.edu" -BodyAsHtml:$true -Encoding "utf-8"
    }   
}