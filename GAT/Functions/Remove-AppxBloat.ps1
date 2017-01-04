Function Remove-AppxBloat {
    [CmdletBinding()]
    Param(
        [ValidateSet("Whitelist","Blacklist")]
        [string]$Method = "Whitelist"
    )
    If ($Method -eq "Whitelist") {
        [regex]$Whitelist = "CheckPoint.VPN|f5.vpn.client|FileManager|JuniperNetworks.JunosPulseVpn|Microsoft.AAD.BrokerPlugin|Microsoft.AccountsControl|Microsoft.Advertising.Xaml|Microsoft.Appconnector|Microsoft.BioEnrollment|Microsoft.DesktopAppInstaller|Microsoft.LockApp|Microsoft.Media.PlayReadyClient|Microsoft.Messaging|Microsoft.MicrosoftEdge|Microsoft.MicrosoftStickyNotes|Microsoft.MoCamera|Microsoft.NET.Native.Framework|Microsoft.NET.Native.Runtime|Microsoft.OneConnect|Microsoft.PPIProjection|Microsoft.StorePurchaseApp|Microsoft.VCLibs|Microsoft.Windows.Apprep.ChxApp|Microsoft.Windows.AssignedAccessLockApp|Microsoft.Windows.CloudExperienceHost|Microsoft.Windows.ContentDeliveryManager|Microsoft.Windows.Cortana|Microsoft.Windows.ParentalControls|Microsoft.Windows.Photos|Microsoft.Windows.SecondaryTileExperience|Microsoft.Windows.SecureAssessmentBrowser|Microsoft.Windows.ShellExperienceHost|Microsoft.WindowsAlarms|Microsoft.WindowsCalculator|Microsoft.WindowsCamera|Microsoft.WindowsMaps|Microsoft.WindowsSoundRecorder|Microsoft.WindowsStore|Microsoft.WinJS|Microsoft.XboxGameCallableUI|Microsoft.XboxIdentityProvider|SonicWALL.MobileConnect|windows.devicesflow|windows.immersivecontrolpanel|Windows.MiracastView|Windows.PrintDialog|Windows.PurchaseDialog|winstore"
        Write-Verbose "Starting to remove provisioned packages"
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $Whitelist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose "Starting to remove packages from all users"
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $Whitelist} | Remove-AppxPackage | Out-Null
        Write-Output "Successfully completed removal of all AppX Packages not specified in the whitelist"
    } ElseIf ($Method -eq "Blacklist") {
        [regex]$Blacklist = "9E2F88E3.Twitter|ClearChannelRadioDigital.iHeartRadio|Flipboard.Flipboard|king.com.CandyCrushSaga|king.com.CandyCrushSodaSaga|Microsoft.3DBuilder|Microsoft.BingFinance|Microsoft.BingFoodAndDrink|Microsoft.BingHealthAndFitness|Microsoft.BingNews|Microsoft.BingSports|Microsoft.BingTranslator|Microsoft.BingTravel|Microsoft.BingWeather|Microsoft.CommsPhone|Microsoft.FreshPaint|Microsoft.Getstarted|Microsoft.MicrosoftJackpot|Microsoft.MicrosoftJigsaw|Microsoft.MicrosoftOfficeHub|Microsoft.MicrosoftSolitaireCollection|Microsoft.MicrosoftSudoku|Microsoft.MinecraftUWP|Microsoft.MovieMoments|Microsoft.Office.OneNote|Microsoft.Office.Sway|Microsoft.People|Microsoft.SkypeApp|Microsoft.SkypeWiFi|Microsoft.Studios.Wordament|Microsoft.Taptiles|microsoft.windowscommunicationsapps|Microsoft.WindowsFeedback|Microsoft.WindowsPhone|Microsoft.XboxApp|Microsoft.ZuneMusic|Microsoft.ZuneVideo|MicrosoftMahjong|ShazamEntertainmentLtd.Shazam|TheNewYorkTimes.NYTCrossword|Windows.ContactSupport"
        Write-Verbose "Starting to remove provisioned packages"
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Match $Blacklist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose "Starting to remove packages from all users"
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -Match $Blacklist} | Remove-AppxPackage | Out-Null
        Write-Output "Successfully completed removal of all AppX Packages specified in the blacklist"
    } Else {
        Write-Error "An error that should never happen has occured"
    }
}
