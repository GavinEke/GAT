# Stop GWX Processes
Stop-Process -Name GWX, GWXUX -Force
# Disable GWX in Registry
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Gwx" -Name DisableGwx -Value 1 -Force
# Disable OS Upgrade in Registry
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\WindowsUpdate" -Name DisableOSUpgrade -Value 1 -Force
