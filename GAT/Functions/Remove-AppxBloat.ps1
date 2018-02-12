Function Remove-AppxBloat {
    [CmdletBinding()]
    Param(
        [ValidateSet('Whitelist','Blacklist')]
        [string]$Method = 'Whitelist'
    )
    If ($Method -eq 'Whitelist') {
        [regex]$Whitelist = "1527c705-839a-4832-9118-54d4Bd6a0c89|c5e2524a-ea46-4f67-841f-6a9465d9d515|F46D4000-FD22-4DB4-AC8E-4E1DDDE828FE|CheckPoint.VPN|CortanaListenUIApp|DesktopLearning|DesktopView|E2A4F912-2574-4A75-9BB0-0D023378592B|EnvironmentsApp|f5.vpn.client|FileManager|HoloCamera|HoloItemPlayerApp|HoloShell|InputApp|JuniperNetworks.JunosPulseVpn|Microsoft.AAD.BrokerPlugin|Microsoft.AccountsControl|Microsoft.Advertising.Xaml|Microsoft.Appconnector|Microsoft.BioEnrollment|Microsoft.CredDialogHost|Microsoft.DesktopAppInstaller|Microsoft.ECApp|Microsoft.HEVCVideoExtension|Microsoft.LockApp|Microsoft.Media.PlayReadyClient|Microsoft.Messaging|Microsoft.MicrosoftEdge|Microsoft.MicrosoftStickyNotes|Microsoft.MoCamera|Microsoft.MSPaint|Microsoft.NET.Native.Framework|Microsoft.NET.Native.Runtime|Microsoft.OneConnect|Microsoft.PPIProjection|Microsoft.Services.Store.Engagement|Microsoft.Services.Store.Engagement|Microsoft.StorePurchaseApp|Microsoft.VCLibs|Microsoft.Wallet|Microsoft.Windows.Apprep.ChxApp|Microsoft.Windows.AssignedAccessLockApp|Microsoft.Windows.CloudExperienceHost|Microsoft.Windows.ContentDeliveryManager|Microsoft.Windows.Cortana|Microsoft.Windows.HolographicFirstRun|Microsoft.Windows.ModalSharePickerHost|Microsoft.Windows.OOBENetworkCaptivePortal|Microsoft.Windows.OOBENetworkConnectionFlow|Microsoft.Windows.ParentalControls|Microsoft.Windows.PeopleExperienceHost|Microsoft.Windows.Photos|Microsoft.Windows.PinningConfirmationDialog|Microsoft.Windows.SecondaryTileExperience|Microsoft.Windows.SecureAssessmentBrowser|Microsoft.Windows.ShellExperienceHost|Microsoft.WindowsAlarms|Microsoft.WindowsCalculator|Microsoft.WindowsCamera|Microsoft.WindowsMaps|Microsoft.Windows.SecHealthUI|Microsoft.WindowsSoundRecorder|Microsoft.Windows.WindowPicker|Microsoft.WindowsStore|Microsoft.WinJS|Microsoft.XboxGameCallableUI|Microsoft.XboxGameOverlay|Microsoft.XboxIdentityProvider|Microsoft.XboxSpeechToTextOverlay|SonicWALL.MobileConnect|Windows.ContactSupport|windows.devicesflow|windows.immersivecontrolpanel|Windows.MiracastView|Windows.PrintDialog|Windows.PurchaseDialog|winstore"
        Write-Verbose 'Starting to remove provisioned packages'
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $Whitelist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose 'Starting to remove packages from all users'
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $Whitelist} | Remove-AppxPackage | Out-Null
        Write-Output 'Successfully completed removal of all AppX Packages not specified in the whitelist'
    } ElseIf ($Method -eq 'Blacklist') {
        [regex]$Blacklist = "9E2F88E3.Twitter|A278AB0D.MarchofEmpires|ClearChannelRadioDigital.iHeartRadio|Facebook.Facebook|Flipboard.Flipboard|king.com.CandyCrushSaga|king.com.CandyCrushSodaSaga|Microsoft.3DBuilder|Microsoft.BingFinance|Microsoft.BingFoodAndDrink|Microsoft.BingHealthAndFitness|Microsoft.BingNews|Microsoft.BingSports|Microsoft.BingTranslator|Microsoft.BingTravel|Microsoft.BingWeather|Microsoft.CommsPhone|Microsoft.FreshPaint|Microsoft.GetHelp|Microsoft.Getstarted|Microsoft.Microsoft3DViewer|Microsoft.MicrosoftJackpot|Microsoft.MicrosoftJigsaw|Microsoft.MicrosoftOfficeHub|Microsoft.MicrosoftSolitaireCollection|Microsoft.MicrosoftSudoku|Microsoft.MinecraftUWP|Microsoft.MovieMoments|Microsoft.Office.OneNote|Microsoft.Office.Sway|Microsoft.People|Microsoft.Print3D|Microsoft.SkypeApp|Microsoft.SkypeWiFi|Microsoft.Studios.Wordament|Microsoft.Taptiles|microsoft.windowscommunicationsapps|Microsoft.WindowsFeedback|Microsoft.WindowsFeedbackHub|Microsoft.WindowsPhone|Microsoft.Xbox.TCUI|Microsoft.XboxApp|Microsoft.ZuneMusic|Microsoft.ZuneVideo|MicrosoftMahjong|ShazamEntertainmentLtd.Shazam|TheNewYorkTimes.NYTCrossword"
        Write-Verbose 'Starting to remove provisioned packages'
        Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -Match $Blacklist} | Remove-AppxProvisionedPackage -Online | Out-Null
        Write-Verbose 'Starting to remove packages from all users'
        Get-AppxPackage -AllUsers | Where-Object {$_.Name -Match $Blacklist} | Remove-AppxPackage | Out-Null
        Write-Output 'Successfully completed removal of all AppX Packages specified in the blacklist'
    } Else {
        Write-Error 'An error that should never happen has occured'
    }
}
