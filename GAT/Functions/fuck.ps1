Function fuck {
	$cmd = (Get-History ((Get-History).Count))[0].CommandLine
	Write-Output "Running $cmd in $PWD"
	sudo powershell -NoExit -Command "pushd $PWD; $cmd"
}
