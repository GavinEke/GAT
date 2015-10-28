# Allow Remote Desktop in Firewall
Set-NetFirewallRule -DisplayGroup “Remote Desktop” –Enabled True
# Enable Remote Desktop in Registry
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name UserAuthentication -Value 0 -Force
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name fDenyTSConnections -Value 0 -Force