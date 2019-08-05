#--- Uninstall unnecessary applications that come with Windows out of the box ---
Write-Host "Uninstall some applications that come with Windows out of the box" -ForegroundColor "Yellow"

#Referenced to build script
# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1

# Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*photos*"}  | where-object {$_.name -notlike "*calc*"} | Write-Output

Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage
# Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*store*"} | where-object {$_.name -notlike "*photos*"}  | where-object {$_.name -notlike "*calc*"} | Remove-AppxPackage

foreach ($app in $applicationList) {
    removeApp $app
}
