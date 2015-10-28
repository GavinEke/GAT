# Run PowerShell as Administrator
# Windows 8/8.1 only
# DO NOT RUN ON WINDOWS 10
Get-AppxProvisionedPackage -online | Remove-AppxProvisionedPackage -online
Get-AppxPackage -AllUsers | Remove-AppxPackage