if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# To list all appx packages:
# Get-AppxPackage | Format-Table -Property Name,Version,PackageFullName
Write-Host "------------------------------------" -ForegroundColor Green
Write-Host "Removing UWP Rubbish..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
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