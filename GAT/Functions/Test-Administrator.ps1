Function Test-Administrator {
	$AdminUserTest = [Security.Principal.WindowsIdentity]::GetCurrent();
	(New-Object Security.Principal.WindowsPrincipal $AdminUserTest).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
