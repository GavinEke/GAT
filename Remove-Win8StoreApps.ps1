# DEPRECATED: Replace with Remove-WinAppxBloat.ps1 - https://github.com/GavinEke/GAT/blob/master/Remove-WinAppxBloat.ps1
Get-AppxProvisionedPackage -online | Remove-AppxProvisionedPackage -online
Get-AppxPackage -AllUsers | Remove-AppxPackage
