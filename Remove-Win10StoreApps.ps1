Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Match "Microsoft.BingNews|Microsoft.BingWeather|Microsoft.BingFinance|Microsoft.BingSports|Microsoft.XboxApp|Microsoft.Office.Sway|Microsoft.Office.OneNote|Microsoft.MicrosoftOfficeHub|Microsoft.SkypeApp"} | Remove-AppxProvisionedPackage -Online
Get-AppxPackage | Where-Object {$_.Name -Match "Microsoft.BingNews|Microsoft.BingWeather|Microsoft.BingFinance|Microsoft.BingSports|Microsoft.XboxApp|Microsoft.Office.Sway|Microsoft.Office.OneNote|Microsoft.MicrosoftOfficeHub|Microsoft.SkypeApp"} | Remove-AppxPackage

# DO NOT UNCOMMENT LINES BELOW - NEEDS MORE TESTING

# Test 1
#$RequiredPackages = "Microsoft.Appconnector|Microsoft.BingWeather|Microsoft.BioEnrollment|Microsoft.Windows.Photos|Microsoft.WindowsAlarms|Microsoft.WindowsCalculator|Microsoft.WindowsCamera|Microsoft.WindowsMaps|Microsoft.WindowsSoundRecorder|Microsoft.WindowsStore|Windows.ContactSupport|Microsoft.Windows.Cortana|Microsoft.MicrosoftEdge|Microsoft.WindowsFeedback|Microsoft.AAD.BrokerPlugin|Microsoft.Windows.CloudExperienceHost|Microsoft.Windows.ShellExperienceHost|windows.immersivecontrolpanel|Microsoft.AccountsControl|Microsoft.LockApp|Microsoft.Windows.AssignedAccessLockApp|Microsoft.Windows.ContentDeliveryManager|Microsoft.Windows.FeatureOnDemand.InsiderHub|Microsoft.Windows.ParentalControls|Microsoft.Windows.SecondaryTileExperience|Microsoft.XboxGameCallableUI|Microsoft.XboxIdentityProvider|Windows.MiracastView|Windows.PrintDialog|Windows.PurchaseDialog|windows.devicesflow"
#Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $RequiredPackages} | Remove-AppxProvisionedPackage -Online
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $RequiredPackages} | Remove-AppxPackage

# Restore if test goes bad
#Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}
