Function Save-Screenshot {
    [Cmdletbinding()]
    Param(
        # Specify the directory to create the files in.
        # The files names are a combination of the display name and a timestamp
        [ValidateScript({Test-Path -Path "$_" -PathType 'Container'})]
        [Alias("Path")]
        [string]$Directory = ".",

        #The lower the number specified, the higher the compression and therefore the lower the quality of the image. Zero would give you the lowest quality image and 100 the highest.
        [ValidateRange(0,100)]
        [int]$Quality = 100,

        # By default, only the PRIMARY display is captured
        [Switch]$AllScreens
    )

    Begin {
        Set-StrictMode -Version 2
        Add-Type -AssemblyName System.Windows.Forms
    }

    Process {
        If ($AllScreens) {
            $Capture = [System.Windows.Forms.Screen]::AllScreens 
        } Else {
            $Capture = [System.Windows.Forms.Screen]::PrimaryScreen
        }

        ForEach ($Item in $Capture) {
            $FileName = '{0}-{1}.jpg' -f (Join-Path (Resolve-Path $Directory) ($Item.DeviceName -split "\\")[3]), (Get-Date).ToString('yyyyMMdd_HHmmss')
            $Bitmap = New-Object System.Drawing.Bitmap($Item.Bounds.Width, $Item.Bounds.Height)
            $Image = [System.Drawing.Graphics]::FromImage($Bitmap)
            $Image.CopyFromScreen($Item.Bounds.Location, (New-Object System.Drawing.Point(0,0)), $Item.Bounds.Size)
            $Image.Dispose()
            $EncoderParam = [System.Drawing.Imaging.Encoder]::Quality
            $EncoderParamSet = New-Object System.Drawing.Imaging.EncoderParameters(1) 
            $EncoderParamSet.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($EncoderParam, $Quality) 
            $JPGCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object {$_.MimeType -eq 'image/jpeg'}
            $Bitmap.Save($FileName, $JPGCodec, $EncoderParamSet)
            $FileSize = [INT]((Get-Childitem $FileName).Length / 1KB)
            Write-Verbose -Message "Display [$($Item.DeviceName)] ScreenCapture saved to File [$FileName] Size [$FileSize] KB"
        }
    }

    End {}
}
