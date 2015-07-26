function Get-OSInfo {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$ComputerName
	)
    Process {
        foreach ($computer in $ComputerName) {
            try {
                $os = Get-WmiObject -ErrorAction Stop -ComputerName $computer -Class Win32_OperatingSystem
                $cs = Get-WmiObject -ComputerName $computer -Class Win32_ComputerSystem
                $bios = Get-WmiObject -ComputerName $computer -Class Win32_BIOS
                $proc = Get-WmiObject -ComputerName $computer -Class Win32_Processor | Select -first 1

                $properties = @{'ComputerName'=$os.csname;
                                'OSVersion'=$os.version;
                                'OSBuild'=$os.buildnumber;
                                'SPVersion'=$os.servicepackmajorversion;
                                'OSArchitecture'=$os.osarchitecture;
                                'Mfgr'=$cs.manufacturer;
                                'Model'=$cs.model;
                                'BIOSSerial'=$bios.serialnumber;
                                'ProcArchitecture'="$($proc.addresswidth)-bit"}

                $obj = New-Object -TypeName PSObject -Property $properties
                return $obj
            } catch {
                Write-Error "Error in Get-OSInfo Function"
            } 
        } #foreach computer
    } #process
} #function

function Connect-Database {
    param(
        [string]$dataSource = "CLIENT10\SQLEXPRESS",
        [string]$database = "PowerShell"
	)
	Process {
		$connectionString = "Data Source=$dataSource; " +
							"Integrated Security=SSPI; " +
							"Initial Catalog=$database"
		
		$sqlConnection = new-object system.data.SqlClient.SQLConnection
		$sqlConnection.ConnectionString = $connectionString
		
		return $sqlConnection
	} #process
} #function

Function Insert-IntoDatabase {
    param(
        $sqlCommand,
        $query
	)
	Process {
		$sqlCommand.CommandText = $query
		
		try{
			$sqlCommand.ExecutenOnQuery() | Out-Null
		}
		catch {
			$_.Exception
		}
	} #process
} #function

$sqlConnection = Connect-Database
$sqlConnection.Open() # open database connection
$sqlCommand = $sqlConnection.CreateCommand()

$obj = Get-OSInfo

$query = "INSERT INTO Table_2 (ComputerName,OSVersion,OSBuild,SPVersion,OSArchitecture,Mfgr,Model,BIOSSerial,ProcArchitecture) VALUES ('$($obj.ComputerName)','$($obj.OSVersion)','$($obj.OSBuild)','$($obj.SPVersion)','$($obj.OSArchitecture)','$($obj.Mfgr)','$($obj.Model)','$($obj.BIOSSerial)','$($obj.ProcArchitecture)')"
Insert-IntoDatabase $sqlCommand $query

$sqlConnection.Close() # close database connection
