Function sudo {
	If ($args[0] -eq '!!') {
		fuck
	} Else {
		$file, [string]$arguments = $args
		$psi = New-Object System.Diagnostics.ProcessStartInfo $file
		$psi.Arguments = $arguments
		$psi.Verb = "runas"
		$psi.WorkingDirectory = Get-Location
		[System.Diagnostics.Process]::Start($psi)
	}
}
