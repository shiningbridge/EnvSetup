if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# # -----------------------------------------------------------------------------
# $computerName = Read-Host 'Enter New Computer Name'
# Write-Host "Renaming this computer to: " $computerName  -ForegroundColor Yellow
# Rename-Computer -NewName $computerName
# # -----------------------------------------------------------------------------
Write-Host ""
Write-Host "Disable Sleep on AC Power..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Powercfg /Change monitor-timeout-ac 20
Powercfg /Change standby-timeout-ac 0
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
Write-Host ""
Write-Host "Do nothing when you close the lid" -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
powercfg /setacvalueindex scheme_current sub_buttons lidaction 0
powercfg /setdcvalueindex scheme_current sub_buttons lidaction 0
## Re-activate current scheme to make settings take effect immediately
powercfg /setactive scheme_current
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "Add 'This PC' Desktop Icon..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
$thisPCIconRegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$thisPCRegValname = "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" 
$item = Get-ItemProperty -Path $thisPCIconRegPath -Name $thisPCRegValname -ErrorAction SilentlyContinue 
if ($item) { 
    Set-ItemProperty  -Path $thisPCIconRegPath -name $thisPCRegValname -Value 0  
} 
else { 
    New-ItemProperty -Path $thisPCIconRegPath -Name $thisPCRegValname -Value 0 -PropertyType DWORD | Out-Null  
} 

# # To list all appx packages:
# # Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName
# Write-Host "Removing UWP Rubbish..." -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# $uwpRubbishApps = @(
#     "Microsoft.Messaging",
#     "king.com.CandyCrushSaga",
#     "Microsoft.BingNews",
#     "Microsoft.MicrosoftSolitaireCollection",
#     "Microsoft.People",
#     "Microsoft.WindowsFeedbackHub",
#     "Microsoft.YourPhone",
#     "Microsoft.MicrosoftOfficeHub",
#     "Fitbit.FitbitCoach",
#     "4DF9E0F8.Netflix",
#     "Microsoft.GetHelp")

# foreach ($uwp in $uwpRubbishApps) {
#     Get-AppxPackage -Name $uwp | Remove-AppxPackage
# }
# -----------------------------------------------------------------------------
# Write-Host ""
# Write-Host "Installing IIS..." -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45 -All
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
# Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
# # -----------------------------------------------------------------------------
# Write-Host ""
# Write-Host "Enable Windows 10 Developer Mode..." -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
# # -----------------------------------------------------------------------------
# Write-Host ""
# Write-Host "Enable Remote Desktop..." -ForegroundColor Green
# Write-Host "------------------------------------" -ForegroundColor Green
# Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\" -Name "fDenyTSConnections" -Value 0
# Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name "UserAuthentication" -Value 1
# Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

if (Check-Command -cmdname 'choco') {
    Write-Host "Choco is already installed, skip installation."
}
else {
    Write-Host ""
    Write-Host "Installing Chocolate for Windows..." -ForegroundColor Green
    Write-Host "------------------------------------" -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Host ""
Write-Host "Installing Applications..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
Write-Host "[WARN] Ma de in China: some software like Google Chrome require the true Internet first" -ForegroundColor Yellow

$Apps = @(
    ### FILES and editing
    "7zip.install",
    "mobaxterm",
    "totalcommander",
    "vscode",
    "typora",
    "beyondcompare",
    "notepadplusplus.install",
    "evernote",
    "autohotkey.portable",
    "winscp.install",
    "git",
    "github-desktop",
    "sourcetree",
    ### INTERNET
    "wget",
    # "wireshark",
    "filezilla",
    # "microsoft-edge",
    "googlechrome",
    ### MEDIA and Social
    # "microsoft-teams.install",
    "screenshotcaptor",
    "vlc",
    "ffmpeg",
    "irfanview",
    ### Web SDK
    "nodejs-lts",
    "dotnetcore-sdk",
    "openssl.light",
    # "azure-cli",
    ### SYS troubleshooting
    # "sysinternals",
    # "linqpad",
    # "fiddler",
    # "postman",
    "nuget.commandline",
    "powershell-core"
    )

foreach ($app in $Apps) {
    # choco install $app -y
    choco upgrade $app -y --source="'https://community.chocolatey.org/api/v2'"
}

Write-Host "------------------------------------" -ForegroundColor Green
Read-Host -Prompt "Setup is done, restart is needed, press [ENTER] to restart computer."
Restart-Computer
