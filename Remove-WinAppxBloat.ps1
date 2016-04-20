#Requires -RunAsAdministrator
#Requires -Version 3
$RequiredPackages = "Microsoft.Appconnector|Microsoft.BingWeather|Microsoft.BioEnrollment|Microsoft.Windows.Photos|Microsoft.WindowsAlarms|Microsoft.WindowsCalculator|Microsoft.WindowsCamera|Microsoft.WindowsMaps|Microsoft.WindowsSoundRecorder|Microsoft.WindowsStore|Windows.ContactSupport|Microsoft.Windows.Cortana|Microsoft.MicrosoftEdge|Microsoft.WindowsFeedback|Microsoft.AAD.BrokerPlugin|Microsoft.Windows.CloudExperienceHost|Microsoft.Windows.ShellExperienceHost|windows.immersivecontrolpanel|Microsoft.AccountsControl|Microsoft.LockApp|Microsoft.Windows.AssignedAccessLockApp|Microsoft.Windows.ContentDeliveryManager|Microsoft.Windows.FeatureOnDemand.InsiderHub|Microsoft.Windows.ParentalControls|Microsoft.Windows.SecondaryTileExperience|Microsoft.XboxGameCallableUI|Microsoft.XboxIdentityProvider|Windows.MiracastView|Windows.PrintDialog|Windows.PurchaseDialog|windows.devicesflow|Microsoft.NET.Native.Framework|Microsoft.NET.Native.Runtime|Microsoft.VCLibs|CheckPoint.VPN|f5.vpn.client|FileManager|JuniperNetworks.JunosPulseVpn|Microsoft.MoCamera|SonicWALL.MobileConnect|winstore|Microsoft.WinJS"
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $RequiredPackages} | Remove-AppxProvisionedPackage -Online
Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $RequiredPackages} | Remove-AppxPackage

# Restore
#Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}
