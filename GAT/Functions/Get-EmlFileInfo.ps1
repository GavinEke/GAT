Function Get-EmlFileInfo {
    Param (
        [Parameter(Mandatory=$True,HelpMessage = 'Mandatory. Path to the eml file.')]
        [ValidateScript({
            If (-Not ($_ | Test-Path) ) {
                Throw 'File does not exist'
            }

            If (-Not ($_ | Test-Path -PathType Leaf) ) {
                Throw 'Must be a file. Folder paths are not allowed.'
            }

            If ($_ -notmatch '(\.eml)') {
                Throw 'The file specified must be of type eml'
            }

            Return $True
        })]
        [System.IO.FileInfo]$EmlFileName
    )

    Begin {}

    Process {
        $AdoDbStream = New-Object -ComObject ADODB.Stream
        $AdoDbStream.Open()
        $AdoDbStream.LoadFromFile($EmlFileName)
        $CdoMessage = New-Object -ComObject CDO.Message
        $CdoMessage.DataSource.OpenObject($AdoDbStream,'_Stream')

        Return $CdoMessage
    }

    End {}
}
