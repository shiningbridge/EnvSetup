$computerName = Read-Host 'Enter new Computer Name'
Write-Host "Renaming current computer to: " $computerName
Rename-Computer -NewName $computerName

Write-Output "------------------------------------"
Write-Output "Installing IIS..."
Write-Output "------------------------------------"
Dism /Online /Enable-Feature /FeatureName:IIS-DefaultDocument /All /NoRestart
Dism /Online /Enable-Feature /FeatureName:IIS-ASPNET45 /All /NoRestart
Dism /Online /Enable-Feature /FeatureName:IIS-ServerSideIncludes /All /NoRestart
Dism /Online /Enable-Feature /FeatureName:IIS-BasicAuthentication /All /NoRestart
Dism /Online /Enable-Feature /FeatureName:IIS-ApplicationInit /All /NoRestart
Dism /Online /Enable-Feature /FeatureName:IIS-HttpCompressionStatic /All /NoRestart

Write-Output ""
Write-Output "------------------------------------"
Write-Output "Installing Chocolate for Windows..."
Write-Output "------------------------------------"
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Read-Host -Prompt "Press Enter to restart computer."
Restart-Computer