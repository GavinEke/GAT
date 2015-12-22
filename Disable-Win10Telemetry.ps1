# Stop and Disable Diagnostic Tracking Service
Stop-Service -Name DiagTrack
Set-Service -Name DiagTrack -StartupType Disabled
# Stop and Disable dmwappushservice Service
Stop-Service -Name dmwappushservice
Set-Service -Name dmwappushservice -StartupType Disabled
# Disable CEIP Tasks
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" | Disable-ScheduledTask
# Blank out AutoLogger
New-Item "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" -ItemType File -Force
# Don't search the web or display web results in Search
New-NetFirewallRule -DisplayName "Block Cortana Web Access" -Direction Outbound -Program "%windir%\systemapps\Microsoft.Windows.Cortana_cw5n1h2txyewy\SearchUI.exe" -Action Block
# Turn off OneDrive
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name DisableFileSyncNGSC -Value 1 -Force
# Turn off App ID
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0 -Force
# Turn off SmartScreen Filter
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost\EnableWebContentEvaluation" -Name Enabled -Value 0 -Force
# Turn off help Microsoft improve typing and writing
New-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Value 1 -Force
# Do not show feedback notifications
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name PeriodInNanoSeconds -Value 0 -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name NumberOfSIUFInPeriod -Value 0 -Force
# Turn off Wi-Fi Sense
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" -Name AutoConnectAllowedOEM -Value 0 -Force
# Opt out of MAPS
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Spynet" -Name SpyNetReporting -Value 0 -Force
# Don't send malware samples to Microsoft
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Spynet" -Name SubmitSamplesConsent -Value 2 -Force
# Don't send MRT telemetry
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\MRT" -Name DontReportInfectionInformation -Value 1 -Force
# Set any remaining telemetry to only send security related information
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0 -Force

### Features that can be removed but are not for functionality ###

# Remove Windows Media Player
#dism /online /Disable-Feature /FeatureName:WindowsMediaPlayer
# Turn off Windows Update
#New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name DoNotConnectToWindowsUpdateInternetLocations -Value 1 -Force
#New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name DisableWindowsUpdateAccess -Value 1 -Force
#New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" -Name AutoDownload -Value 5 -Force
# Don't download ActiveX out of date version list
#New-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\VersionManager" -Name DownloadVersionList -Value 0 -Force
# Remove certain apps from installing with new users
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.BingNews"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.BingWeather"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.BingFinance"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.BingSports"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "*.Twitter"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.XboxApp"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.Office.Sway"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.Office.OneNote"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.MicrosoftOfficeHub"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Like "Microsoft.SkypeApp"} | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName}
# Remove certain apps from current user
#Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
#Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
#Get-AppxPackage *.Twitter | Remove-AppxPackage
#Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
#Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
#Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
#Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
#Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
