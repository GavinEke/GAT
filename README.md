# GAT
Gavin's Admin Toolkit

Scripts

* `Disable-Win10Telemetry.ps1` - For Windows 10 - sets a number of Microsoft programs to not send feedback.
* `Enable-RDP.ps1` - For Windows 7+ - enables remote desktop and adds firewall exceptions.
* `Remove-GWX.ps1` - For Windows 7/8.1 - removes Get Windows 10 program.
* `Remove-WinAppxBloat.ps1` - For Windows 8+ - removes all AppX packages not in the RequiredPrograms variable.

`Script1.ps1` is part of something I am working on, it won't work without the database setup so just ignore that.

`Remove-Win10StoreApps.ps1` & `Remove-Win8StoreApps.ps1` are both depreciated and should not be used anymore as they were super-seeded by `Remove-WinAppxBloat.ps1` which is improved and works on both operating systems.
