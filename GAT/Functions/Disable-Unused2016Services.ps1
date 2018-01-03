<#
.SYNOPSIS

Disables services not required in Windows Server 2016.

.DESCRIPTION

Disables services not required to increase security of the system.

.PARAMETER ComputerName
Specifies a remote computer. Type the NetBIOS name, an Internet Protocol (IP) address, or a fully qualified domain name of a remote computer.

.PARAMETER XboxOnly
Specifies the to only disable the Xbox services.

.INPUTS

You can pipe objects to ComputerName by the property name.

.OUTPUTS

None. This command does not generate any output.

.EXAMPLE

PS C:\> Disable-Unused2016Services

This command with no parameters will disable all services that are not required in Windows Server 2016.

.EXAMPLE

PS C:\> Disable-Unused2016Services SVR01,SVR02,SVR03 -XboxOnly

This command with will remotely disable the 2 Xbox services on the computers named SVR01, SVR02 and SVR03.

.EXAMPLE

PS C:\> Get-ADComputer -Filter {OperatingSystem -Like "Windows Server*"} | Select-Object -ExpandProperty Name | Disable-Unused2016Services

Remotely disables unused services of computers piped in from AD.

.LINK

https://gist.github.com/GavinEke/abfc2a547aea74b9d74a2c0c598f3fd7
#>
Function Disable-Unused2016Services {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Alias('__SERVER')]
        [string[]]$ComputerName,

        [switch]$XboxOnly
    )

    Begin {
        $fullservices = @(
            'AxInstSV',
            'bthserv',
            'CDPUserSvc',
            'PimIndexMaintenanceSvc',
            'dmwappushservice',
            'MapsBroker',
            'lfsvc',
            'SharedAccess',
            'lltdsvc',
            'wlidsvc',
            'NgcSvc',
            'NgcCtnrSvc',
            'NcbService',
            'PhoneSvc',
            'PcaSvc',
            'QWAVE',
            'RmSvc',
            'SensorDataService',
            'SensrSvc',
            'SensorService',
            'ShellHWDetection',
            'ScDeviceEnum',
            'SSDPSRV',
            'WiaRpc',
            'OneSyncSvc',
            'TabletInputService',
            'upnphost',
            'UserDataSvc',
            'UnistoreSvc',
            'WalletService',
            'Audiosrv',
            'AudioEndpointBuilder',
            'FrameServer',
            'stisvc',
            'wisvc',
            'icssvc',
            'WpnService',
            'WpnUserService',
            'XblAuthManager',
            'XblGameSave'
        )
        $xboxservices = @(
            'XblAuthManager',
            'XblGameSave'
        )
        
        If ($XboxOnly) {
            Write-Verbose -Message "Selecting only xbox services"
            $services = $xboxservices
        } Else {
            Write-Verbose -Message "Selecting all services not required"
            $services = $fullservices
        }
    }

    Process {
        If ($PSBoundParameters.ContainsKey('ComputerName')) {
            ForEach ($service in $services) {
                Write-Verbose -Message "Disabling $service on $ComputerName"
                Set-Service -ComputerName $ComputerName -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
            }
            Write-Verbose -Message "Disabling Xbox tasks on $ComputerName"
            [void]$(Invoke-Command -ComputerName $ComputerName -ScriptBlock {Get-ScheduledTask -TaskPath "\Microsoft\XblGameSave\" | Disable-ScheduledTask})
        } Else {
            ForEach ($service in $services) {
                Write-Verbose -Message "Disabling $service on localhost"
                Set-Service -Name $service -StartupType Disabled
            }
            Write-Verbose -Message "Disabling Xbox tasks on localhost"
            [void]$(Get-ScheduledTask -TaskPath "\Microsoft\XblGameSave\" | Disable-ScheduledTask)
        }
    }

    End {}
}
