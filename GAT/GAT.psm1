# Set PSScriptRoot
If (!($PSScriptRoot)) {
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

# Dot source the modules functions
$GATFunctions = Get-ChildItem -Path "$PSScriptRoot\Functions\*.ps1"
$GATFunctions | ForEach-Object {. $_.FullName}
Export-ModuleMember -Function $GATFunctions.BaseName
