# Stop GWX Processes
Stop-Process -Name GWX, GWXUX -Force
# Disable GWX in Registry
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Gwx" -Name DisableGwx -Value 1 -Force
# Uninstall KB3035583
wusa /uninstall /kb:3035583 /quiet /norestart