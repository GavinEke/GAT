Function Get-ProfileBanner {
    <#
    .NAME
        Get-Get-ProfileBanner
    .SYNOPSIS
        Displays system information to a host.
    .DESCRIPTION
        The Get-Get-ProfileBanner cmdlet is a system information tool written in PowerShell. 
    .EXAMPLE
    #>

    If ([version]$PSVersionTable.PSVersion -ge [version]'5.1.0.0') {
        $ComputerInfo = Get-ComputerInfo
            Write-Host -Object ("##########################") -ForegroundColor Cyan
            Write-Host -Object ("#ppppp   \ppppppppppppppp#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    $(Get-Date)") -ForegroundColor Green
            Write-Host -Object ("#ooooo.    oooooooooooooo#") -ForegroundColor Cyan
            Write-Host -Object ("#wwwwwww-   wwwwwwwwwwwww#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    User: ") -NoNewline
            Write-Host -Object ("$($env:USERNAME)") -ForegroundColor Yellow
            Write-Host -Object ("#eeeeeeee\   .eeeeeeeeeee#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    Hostname: ") -NoNewline
            Write-Host -Object ("$($env:COMPUTERNAME)") -ForegroundColor Yellow
            Write-Host -Object ("#rrrrrrrrr.    ;rrrrrrrrr#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    Logon Domain: ") -NoNewline
            Write-Host -Object ("$($env:USERDOMAIN)") -ForegroundColor Yellow
            Write-Host -Object ("#sssssssssss    sssssssss#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    Boot Time: ") -NoNewline
            Write-Host -Object ("$($ComputerInfo.OsLastBootUpTime)") -ForegroundColor Yellow
            Write-Host -Object ("#hhhhhhhhh/    /hhhhhhhhh#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    OS: ") -NoNewline
            Write-Host -Object ("$($ComputerInfo.WindowsProductName)") -ForegroundColor Yellow
            Write-Host -Object ("#eeeeeee;    eeeeeeeeeeee#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    TimeZone: ") -NoNewline
            Write-Host -Object ("$($ComputerInfo.TimeZone)") -ForegroundColor Yellow
            Write-Host -Object ("#lllll.    ;lllllllllllll#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    Shell: ") -NoNewline
            Write-Host -Object ("Powershell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)") -ForegroundColor Yellow
            Write-Host -Object ("#lllll   .lll       lllll#") -NoNewline -ForegroundColor Cyan
            Write-Host -Object ("    Memory: ") -NoNewline
            Write-Host -Object ("$([math]::round($ComputerInfo.OsFreePhysicalMemory / 1MB, 2))GB/$($ComputerInfo.CsPhyicallyInstalledMemory / 1MB)GB") -ForegroundColor Yellow
            Write-Host -Object ("##########################") -ForegroundColor Cyan
            Write-Host -Object ("")
    } Else {
        Write-Warning "This function requires PowerShell 5.1 or higher to provide all information"
    }
}
