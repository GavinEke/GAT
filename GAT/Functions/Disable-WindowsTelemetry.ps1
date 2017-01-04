Function Disable-WindowsTelemetry {
    # Disable CEIP Tasks
    Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" | Disable-ScheduledTask
    # Only send security related telemetry [Enterprise] or basic [All other editions]
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0 -Force
}
