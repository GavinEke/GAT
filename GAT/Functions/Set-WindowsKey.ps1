Function Set-WindowsKey {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,ParameterSetName='Key')]
        [ValidateLength(29,29)]
        [String]$Key,

        [Parameter(Mandatory=$True,ParameterSetName='KMS')]
        [Switch]$KMS,

        [Parameter(Mandatory=$True,ParameterSetName='OEM')]
        [Switch]$OEM,

        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Alias('__SERVER')]
        [String[]]$ComputerName
    )

    Begin {}

    Process {
        If ($PSBoundParameters.ContainsKey('ComputerName')) {
            ForEach ($Item in $ComputerName) {
                $SoftwareLicensingService = Get-CimInstance -ComputerName $Item -Class SoftwareLicensingService

                If ($KMS) {
                    $OSversion = Get-CimInstance -ComputerName $Item -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption

                    Switch ($OSversion) {
	                    'Windows Server 2016 Datacenter'                   {$Key = 'CB7KF-BWN84-R7R2Y-793K2-8XDDG'; break}
	                    'Windows Server 2016 Standard'                     {$Key = 'WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY'; break}
	                    'Windows Server 2016 Essentials'                   {$Key = 'JCKRF-N37P4-C2D82-9YXRT-4M63B'; break}
	                    'Windows 10 Professional'                          {$Key = 'W269N-WFGWX-YVC9B-4J6C9-T83GX'; break}
	                    'Windows 10 Professional N'                        {$Key = 'MH37W-N47XK-V7XM9-C7227-GCQG9'; break}
	                    'Windows 10 Enterprise'                            {$Key = 'NPPR9-FWDCX-D2C8J-H872K-2YT43'; break}
	                    'Windows 10 Enterprise N'                          {$Key = 'DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4'; break}
	                    'Windows 10 Education'                             {$Key = 'NW6C2-QMPVW-D7KKK-3GKT6-VCFB2'; break}
	                    'Windows 10 Education N'                           {$Key = '2WH4N-8QGBV-H22JP-CT43Q-MDWWJ'; break}
	                    'Windows 10 Enterprise 2015 LTSB'                  {$Key = 'WNMTR-4C88C-JK8YV-HQ7T2-76DF9'; break}
	                    'Windows 10 Enterprise 2015 LTSB N'                {$Key = '2F77B-TNFGY-69QQF-B8YKP-D69TJ'; break}
	                    'Windows 10 Enterprise 2016 LTSB'                  {$Key = 'DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ'; break}
	                    'Windows 10 Enterprise 2016 LTSB N'                {$Key = 'QFFDN-GRT3P-VKWWX-X7T3R-8B639'; break}
	                    'Windows 8.1 Professional'                         {$Key = 'GCRJD-8NW9H-F2CDX-CCM8D-9D6T9'; break}
	                    'Windows 8.1 Professional N'                       {$Key = 'HMCNV-VVBFX-7HMBH-CTY9B-B4FXY'; break}
	                    'Windows 8.1 Enterprise'                           {$Key = 'MHF9N-XY6XB-WVXMC-BTDCT-MKKG7'; break}
	                    'Windows 8.1 Enterprise N'                         {$Key = 'TT4HM-HN7YT-62K67-RGRQJ-JFFXW'; break}
	                    'Windows Server 2012 R2 Server Standard'           {$Key = 'D2N9P-3P6X9-2R39C-7RTCD-MDVJX'; break}
	                    'Windows Server 2012 R2 Datacenter'                {$Key = 'W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9'; break}
	                    'Windows Server 2012 R2 Essentials'                {$Key = 'KNC87-3J2TX-XB4WP-VCPJV-M4FWM'; break}
	                    'Windows 8 Professional'                           {$Key = 'NG4HW-VH26C-733KW-K6F98-J8CK4'; break}
	                    'Windows 8 Professional N'                         {$Key = 'XCVCF-2NXM9-723PB-MHCB7-2RYQQ'; break}
	                    'Windows 8 Enterprise'                             {$Key = '32JNW-9KQ84-P47T8-D8GGY-CWCK7'; break}
	                    'Windows 8 Enterprise N'                           {$Key = 'JMNMF-RHW7P-DMY6X-RF3DR-X2BQT'; break}
	                    'Windows Server 2012'                              {$Key = 'BN3D2-R7TKB-3YPBD-8DRP2-27GG4'; break}
	                    'Windows Server 2012 N'                            {$Key = '8N2M2-HWPGY-7PGT9-HGDD8-GVGGY'; break}
	                    'Windows Server 2012 Single Language'              {$Key = '2WN2H-YGCQR-KFX6K-CD6TF-84YXQ'; break}
	                    'Windows Server 2012 Country Specific'             {$Key = '4K36P-JN4VD-GDC6V-KDT89-DYFKP'; break}
	                    'Windows Server 2012 Server Standard'              {$Key = 'XC9B7-NBPP2-83J2H-RHMBY-92BT4'; break}
	                    'Windows Server 2012 MultiPoint Standard'          {$Key = 'HM7DN-YVMH3-46JC3-XYTG7-CYQJJ'; break}
	                    'Windows Server 2012 MultiPoint Premium'           {$Key = 'XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G'; break}
	                    'Windows Server 2012 Datacenter'                   {$Key = '48HP8-DN98B-MYWDG-T2DCC-8W83P'; break}
	                    'Windows 7 Professional'                           {$Key = 'FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4'; break}
	                    'Windows 7 Professional N'                         {$Key = 'MRPKT-YTG23-K7D7T-X2JMM-QY7MG'; break}
	                    'Windows 7 Professional E'                         {$Key = 'W82YF-2Q76Y-63HXB-FGJG9-GF7QX'; break}
	                    'Windows 7 Enterprise'                             {$Key = '33PXH-7Y6KF-2VJC9-XBBR8-HVTHH'; break}
	                    'Windows 7 Enterprise N'                           {$Key = 'YDRBP-3D83W-TY26F-D46B2-XCKRJ'; break}
	                    'Windows 7 Enterprise E'                           {$Key = 'C29WB-22CC8-VJ326-GHFJW-H9DH4'; break}
	                    'Windows Server 2008 R2 Web'                       {$Key = '6TPJF-RBVHG-WBW2R-86QPH-6RTM4'; break}
	                    'Windows Server 2008 R2 HPC edition'               {$Key = 'TT8MH-CG224-D3D7Q-498W2-9QCTX'; break}
	                    'Windows Server 2008 R2 Standard'                  {$Key = 'YC6KT-GKW9T-YTKYR-T4X34-R7VHC'; break}
	                    'Windows Server 2008 R2 Enterprise'                {$Key = '489J6-VHDMP-X63PK-3K798-CPX3Y'; break}
	                    'Windows Server 2008 R2 Datacenter'                {$Key = '74YFP-3QFB3-KQT8W-PMXWJ-7M648'; break}
	                    'Windows Server 2008 R2 for Itanium-based Systems' {$Key = 'GT63C-RJFQ3-4GMB6-BRFB9-CB83V'; break}
	                    'Windows Vista Business'                           {$Key = 'YFKBB-PQJJV-G996G-VWGXY-2V3X8'; break}
	                    'Windows Vista Business N'                         {$Key = 'HMBQG-8H2RH-C77VX-27R82-VMQBT'; break}
	                    'Windows Vista Enterprise'                         {$Key = 'VKK3X-68KWM-X2YGT-QR4M6-4BWMV'; break}
	                    'Windows Vista Enterprise N'                       {$Key = 'VTC42-BM838-43QHV-84HX6-XJXKV'; break}
	                    'Windows Web Server 2008'                          {$Key = 'WYR28-R7TFJ-3X2YQ-YCY4H-M249D'; break}
	                    'Windows Server 2008 Standard'                     {$Key = 'TM24T-X9RMF-VWXK6-X8JC9-BFGM2'; break}
	                    'Windows Server 2008 Standard without Hyper-V'     {$Key = 'W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ'; break}
	                    'Windows Server 2008 Enterprise'                   {$Key = 'YQGMW-MPWTJ-34KDK-48M3W-X4Q6V'; break}
	                    'Windows Server 2008 Enterprise without Hyper-V'   {$Key = '39BXF-X8Q23-P2WWT-38T2F-G3FPG'; break}
	                    'Windows Server 2008 HPC'                          {$Key = 'RCTX3-KWVHP-BR6TB-RB6DM-6X7HP'; break}
	                    'Windows Server 2008 Datacenter'                   {$Key = '7M67G-PC374-GR742-YH8V4-TCBY3'; break}
	                    'Windows Server 2008 Datacenter without Hyper-V'   {$Key = '22XQ2-VRXRG-P8D42-K34TD-G3QQC'; break}
	                    'Windows Server 2008 for Itanium-Based Systems'    {$Key = '4DWFP-JF3DJ-B7DTH-78FJB-PDRHK'; break}
                    }

                } ElseIf ($PSCmdlet.ParameterSetName -eq "OEM") {
                    $Key = $SoftwareLicensingService | Select-Object -ExpandProperty OA3xOriginalProductKey
                }

                $SoftwareLicensingService | Invoke-CimMethod -ComputerName $Item -MethodName "InstallProductKey($Key)"
                $SoftwareLicensingService | Invoke-CimMethod -ComputerName $Item -MethodName "RefreshLicenseStatus()"
            }
        } Else {
            $SoftwareLicensingService = Get-CimInstance -Class SoftwareLicensingService

            If ($KMS) {
                $OSversion = Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption

                Switch ($OSversion) {
	                'Windows Server 2016 Datacenter'                   {$Key = 'CB7KF-BWN84-R7R2Y-793K2-8XDDG'; break}
	                'Windows Server 2016 Standard'                     {$Key = 'WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY'; break}
	                'Windows Server 2016 Essentials'                   {$Key = 'JCKRF-N37P4-C2D82-9YXRT-4M63B'; break}
	                'Windows 10 Professional'                          {$Key = 'W269N-WFGWX-YVC9B-4J6C9-T83GX'; break}
	                'Windows 10 Professional N'                        {$Key = 'MH37W-N47XK-V7XM9-C7227-GCQG9'; break}
	                'Windows 10 Enterprise'                            {$Key = 'NPPR9-FWDCX-D2C8J-H872K-2YT43'; break}
	                'Windows 10 Enterprise N'                          {$Key = 'DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4'; break}
	                'Windows 10 Education'                             {$Key = 'NW6C2-QMPVW-D7KKK-3GKT6-VCFB2'; break}
	                'Windows 10 Education N'                           {$Key = '2WH4N-8QGBV-H22JP-CT43Q-MDWWJ'; break}
	                'Windows 10 Enterprise 2015 LTSB'                  {$Key = 'WNMTR-4C88C-JK8YV-HQ7T2-76DF9'; break}
	                'Windows 10 Enterprise 2015 LTSB N'                {$Key = '2F77B-TNFGY-69QQF-B8YKP-D69TJ'; break}
	                'Windows 10 Enterprise 2016 LTSB'                  {$Key = 'DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ'; break}
	                'Windows 10 Enterprise 2016 LTSB N'                {$Key = 'QFFDN-GRT3P-VKWWX-X7T3R-8B639'; break}
	                'Windows 8.1 Professional'                         {$Key = 'GCRJD-8NW9H-F2CDX-CCM8D-9D6T9'; break}
	                'Windows 8.1 Professional N'                       {$Key = 'HMCNV-VVBFX-7HMBH-CTY9B-B4FXY'; break}
	                'Windows 8.1 Enterprise'                           {$Key = 'MHF9N-XY6XB-WVXMC-BTDCT-MKKG7'; break}
	                'Windows 8.1 Enterprise N'                         {$Key = 'TT4HM-HN7YT-62K67-RGRQJ-JFFXW'; break}
	                'Windows Server 2012 R2 Server Standard'           {$Key = 'D2N9P-3P6X9-2R39C-7RTCD-MDVJX'; break}
	                'Windows Server 2012 R2 Datacenter'                {$Key = 'W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9'; break}
	                'Windows Server 2012 R2 Essentials'                {$Key = 'KNC87-3J2TX-XB4WP-VCPJV-M4FWM'; break}
	                'Windows 8 Professional'                           {$Key = 'NG4HW-VH26C-733KW-K6F98-J8CK4'; break}
	                'Windows 8 Professional N'                         {$Key = 'XCVCF-2NXM9-723PB-MHCB7-2RYQQ'; break}
	                'Windows 8 Enterprise'                             {$Key = '32JNW-9KQ84-P47T8-D8GGY-CWCK7'; break}
	                'Windows 8 Enterprise N'                           {$Key = 'JMNMF-RHW7P-DMY6X-RF3DR-X2BQT'; break}
	                'Windows Server 2012'                              {$Key = 'BN3D2-R7TKB-3YPBD-8DRP2-27GG4'; break}
	                'Windows Server 2012 N'                            {$Key = '8N2M2-HWPGY-7PGT9-HGDD8-GVGGY'; break}
	                'Windows Server 2012 Single Language'              {$Key = '2WN2H-YGCQR-KFX6K-CD6TF-84YXQ'; break}
	                'Windows Server 2012 Country Specific'             {$Key = '4K36P-JN4VD-GDC6V-KDT89-DYFKP'; break}
	                'Windows Server 2012 Server Standard'              {$Key = 'XC9B7-NBPP2-83J2H-RHMBY-92BT4'; break}
	                'Windows Server 2012 MultiPoint Standard'          {$Key = 'HM7DN-YVMH3-46JC3-XYTG7-CYQJJ'; break}
	                'Windows Server 2012 MultiPoint Premium'           {$Key = 'XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G'; break}
	                'Windows Server 2012 Datacenter'                   {$Key = '48HP8-DN98B-MYWDG-T2DCC-8W83P'; break}
	                'Windows 7 Professional'                           {$Key = 'FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4'; break}
	                'Windows 7 Professional N'                         {$Key = 'MRPKT-YTG23-K7D7T-X2JMM-QY7MG'; break}
	                'Windows 7 Professional E'                         {$Key = 'W82YF-2Q76Y-63HXB-FGJG9-GF7QX'; break}
	                'Windows 7 Enterprise'                             {$Key = '33PXH-7Y6KF-2VJC9-XBBR8-HVTHH'; break}
	                'Windows 7 Enterprise N'                           {$Key = 'YDRBP-3D83W-TY26F-D46B2-XCKRJ'; break}
	                'Windows 7 Enterprise E'                           {$Key = 'C29WB-22CC8-VJ326-GHFJW-H9DH4'; break}
	                'Windows Server 2008 R2 Web'                       {$Key = '6TPJF-RBVHG-WBW2R-86QPH-6RTM4'; break}
	                'Windows Server 2008 R2 HPC edition'               {$Key = 'TT8MH-CG224-D3D7Q-498W2-9QCTX'; break}
	                'Windows Server 2008 R2 Standard'                  {$Key = 'YC6KT-GKW9T-YTKYR-T4X34-R7VHC'; break}
	                'Windows Server 2008 R2 Enterprise'                {$Key = '489J6-VHDMP-X63PK-3K798-CPX3Y'; break}
	                'Windows Server 2008 R2 Datacenter'                {$Key = '74YFP-3QFB3-KQT8W-PMXWJ-7M648'; break}
	                'Windows Server 2008 R2 for Itanium-based Systems' {$Key = 'GT63C-RJFQ3-4GMB6-BRFB9-CB83V'; break}
	                'Windows Vista Business'                           {$Key = 'YFKBB-PQJJV-G996G-VWGXY-2V3X8'; break}
	                'Windows Vista Business N'                         {$Key = 'HMBQG-8H2RH-C77VX-27R82-VMQBT'; break}
	                'Windows Vista Enterprise'                         {$Key = 'VKK3X-68KWM-X2YGT-QR4M6-4BWMV'; break}
	                'Windows Vista Enterprise N'                       {$Key = 'VTC42-BM838-43QHV-84HX6-XJXKV'; break}
	                'Windows Web Server 2008'                          {$Key = 'WYR28-R7TFJ-3X2YQ-YCY4H-M249D'; break}
	                'Windows Server 2008 Standard'                     {$Key = 'TM24T-X9RMF-VWXK6-X8JC9-BFGM2'; break}
	                'Windows Server 2008 Standard without Hyper-V'     {$Key = 'W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ'; break}
	                'Windows Server 2008 Enterprise'                   {$Key = 'YQGMW-MPWTJ-34KDK-48M3W-X4Q6V'; break}
	                'Windows Server 2008 Enterprise without Hyper-V'   {$Key = '39BXF-X8Q23-P2WWT-38T2F-G3FPG'; break}
	                'Windows Server 2008 HPC'                          {$Key = 'RCTX3-KWVHP-BR6TB-RB6DM-6X7HP'; break}
	                'Windows Server 2008 Datacenter'                   {$Key = '7M67G-PC374-GR742-YH8V4-TCBY3'; break}
	                'Windows Server 2008 Datacenter without Hyper-V'   {$Key = '22XQ2-VRXRG-P8D42-K34TD-G3QQC'; break}
	                'Windows Server 2008 for Itanium-Based Systems'    {$Key = '4DWFP-JF3DJ-B7DTH-78FJB-PDRHK'; break}
                }

            } ElseIf ($PSCmdlet.ParameterSetName -eq "OEM") {
                $Key = $SoftwareLicensingService | Select-Object -ExpandProperty OA3xOriginalProductKey
            }

            $SoftwareLicensingService | Invoke-CimMethod -MethodName InstallProductKey -Arguments @{ ProductKey = $Key }
            $SoftwareLicensingService | Invoke-CimMethod -MethodName RefreshLicenseStatus
        }
    }

    End {}
}
