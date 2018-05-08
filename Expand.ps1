<#
    Expand
    Written by Luke Brady, 2018
    University of North Georgia
#>

# Import the Expand module that will be used in the Expand executable.
Import-Module $PSScriptRoot\Expand
# Import vSphere PowerCLI for use within script.
if ( !(Get-Module -Name VMware.VimAutomation.Core -ErrorAction SilentlyContinue) ) {
    . "C:\Program Files (x86)\VMware\Infrastructure\vSphere PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"
}
<#
    Read-ExConfiguration reads in the Expand JSON config file
    and converts it into an object that can be used throughout
    the execution of the program.
#>
function Read-ExConfiguration {
    [CmdletBinding()]
    [OutputType([hashtable])]
    Param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [String]
        $Path
    )
    Process {
        # Read in the JSON configuration file supplied to the function.
        $confHash = Get-Content -Raw -Path $Path | ConvertFrom-Json | Convertto-ExHashTable
    }
    End {
        # Return the config hashtable.
        return $confHash
    }
}

function Get-Credentials {
    Param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [String]
        $Path
    )
    Process {
        # Read in the JSON configuration file supplied to the function.
        $credHash = Get-Content -Raw -Path $Path | ConvertFrom-Json | Convertto-ExHashTable
        $secpasswd = ConvertTo-SecureString $credHash.Password -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential ($credHash.Username, $secpasswd)
    }
    End {
        # Return the config hashtable.
        return $cred
    }    
}

$config = Read-ExConfiguration -Path $PSScriptRoot\Configuration\expand.config.json
$cred = Get-Credentials -Path $PSScriptRoot\Configuration\credential.json
$keys = $config.Keys
# $confArr = @()
foreach($key in $keys) {
    $driveKeys = $config.$key.Keys 
    foreach($drive in $driveKeys) {
        Get-ExDiskQuota -Server $key -Drive $drive -Quota $config.$key.$drive.quota   
    }
}