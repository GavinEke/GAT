# GAT
Gavin's Admin Toolkit

Scripts:

* `Disable-Win10Telemetry.ps1` - For Windows 10 - sets telemetry to only send security or basic information.
* `Enable-RDP.ps1` - For Windows 7+ - enables remote desktop and adds firewall exceptions.
* `Remove-GWX.ps1` - For Windows 7/8.1 - stops GWX program from trying to perform Windows 10 upgrade.
* `Remove-WinAppxBloat.ps1` - For Windows 8+ - removes all AppX packages not in the pre-defined RequiredPackages variable.

`Script1.ps1` is part of something I am working on, it won't work without the database setup so just ignore that.

`Remove-Win10StoreApps.ps1` & `Remove-Win8StoreApps.ps1` are both depreciated and should not be used anymore as they were super-seeded by `Remove-WinAppxBloat.ps1` which is improved and works on both Windows 8 and Windows 10 operating systems.
