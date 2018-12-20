if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Set-ExecutionPolicy Bypass -Scope Process

$computerName = Read-Host 'Enter New Computer Name'
Write-Host "Renaming current computer to: " $computerName
Rename-Computer -NewName $computerName

Write-Output "------------------------------------"
Write-Output "Removing UWP Rubbish..."
Write-Output "------------------------------------"
$uwpRubbishApps = @(
    "Microsoft.Messaging_4.1810.2922.0_x64__8wekyb3d8bbwe",
    "king.com.CandyCrushSaga_1.1400.5.0_x86__kgqvnymyfvs32",
    "Microsoft.BingNews_4.28.3242.0_x64__8wekyb3d8bbwe",
    "Microsoft.MicrosoftSolitaireCollection_4.1.5252.0_x86__8wekyb3d8bbwe",
    "Microsoft.People_10.1805.1361.0_x64__8wekyb3d8bbwe",
    "Microsoft.WindowsFeedbackHub_1.1805.2331.0_x64__8wekyb3d8bbwe",
    "Microsoft.YourPhone_0.0.12084.0_x64__8wekyb3d8bbwe")

foreach ($uwp in $uwpRubbishApps) {
    Remove-AppxPackage -Package $uwp
}

Write-Output "------------------------------------"
Write-Output "Installing IIS..."
Write-Output "------------------------------------"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication

Write-Output ""
Write-Output "------------------------------------"
Write-Output "Installing Chocolate for Windows..."
Write-Output "------------------------------------"
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Read-Host -Prompt "Press Enter to restart computer."
Restart-Computer