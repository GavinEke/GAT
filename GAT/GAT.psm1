#Requires -RunAsAdministrator

# Set PSScriptRoot
If (!($PSScriptRoot)) {
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

# Dot source the modules functions
$CFFunctions = Get-ChildItem -Path "$PSScriptRoot\Functions\*.ps1"
$CFFunctions | ForEach-Object {. $_.FullName}
Export-ModuleMember -Function $CFFunctions.BaseName
