if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Set-ExecutionPolicy Bypass -Scope Process

$computerName = Read-Host 'Enter New Computer Name' -ForegroundColor Yellow
Write-Host "Renaming current computer to: " $computerName
Rename-Computer -NewName $computerName

# To list all appx packages:
# Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Removing UWP Rubbish..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
$uwpRubbishApps = @(
    "Microsoft.Messaging_4.1810.2922.0_x64__8wekyb3d8bbwe",
    "king.com.CandyCrushSaga_1.1400.5.0_x86__kgqvnymyfvs32",
    "Microsoft.BingNews_4.28.3242.0_x64__8wekyb3d8bbwe",
    "Microsoft.MicrosoftSolitaireCollection_4.1.5252.0_x86__8wekyb3d8bbwe",
    "Microsoft.People_10.1805.1361.0_x64__8wekyb3d8bbwe",
    "Microsoft.WindowsFeedbackHub_1.1805.2331.0_x64__8wekyb3d8bbwe",
    "Microsoft.YourPhone_0.0.12084.0_x64__8wekyb3d8bbwe",
    "Microsoft.MicrosoftOfficeHub_17.10314.31700.1000_x64__8wekyb3d8bbwe",
    "Fitbit.FitbitCoach_4.4.133.0_x64__6mqt6hf9g46tw",
    "4DF9E0F8.Netflix_6.89.355.0_x64__mcm4njqhnhss8")

foreach ($uwp in $uwpRubbishApps) {
    Remove-AppxPackage -Package $uwp
}

Write-Output ""
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Removing Edge Desktop Icon..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
$edgeLink = $env:USERPROFILE + "\Desktop\Microsoft Edge.lnk"
Remove-Item $edgeLink

Write-Output ""
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Installing IIS..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
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
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Enable Windows 10 Developer Mode..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

Write-Output ""
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Enable Remote Desktop..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\" -Name "fDenyTSConnections" -Value 0
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name "UserAuthentication" -Value 1
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Output ""
Write-Output "------------------------------------" -ForegroundColor Green
Write-Output "Installing Chocolate for Windows..." -ForegroundColor Green
Write-Output "------------------------------------" -ForegroundColor Green
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Read-Host -Prompt "Configuration is done, restart is needed, press [ENTER] to restart computer."  -ForegroundColor Yellow -BackgroundColor Red
Restart-Computer