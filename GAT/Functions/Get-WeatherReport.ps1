Function Get-WeatherReport {
    [Cmdletbinding()]
    Param(
        [Parameter(HelpMessage = 'Enter name of the City to get weather report')]
        [string]$City # Not Required
    )

    Begin {
        If ($psISE) {
            Write-Warning -Message 'This function does not display correctly in Windows PowerShell ISE, please use the console or VSCode'
        }
    }

    Process {
        ForEach ($Item in $City) {
            Try {
                $Response = Invoke-RestMethod "wttr.in/$City" -UserAgent curl
                $Weather = $Response -split "`n"
                If ($Weather) {
                    $Weather[0..6]
                }
            } Catch {
                $_.Exception.Message
            }
        }
    }

    End {}
}
