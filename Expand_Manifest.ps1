<#
    Expand Manifest generates a new manifest for the expand module.
    This will allow the expand module to be used by other scripts or by itself.
#>
$manifest = @{
    Path              = '.\expand.psd1'
    RootModule        = 'expand.psm1' 
    Author            = 'Luke Brady'
    Company           = "University of North Georgia"
}
New-ModuleManifest @manifest