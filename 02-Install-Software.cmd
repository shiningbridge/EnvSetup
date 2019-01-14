@echo off
@echo *=====================================================================================
@echo  Choco Auto Installer
@echo.
@echo  This script is for setup new dev machine for Edi Wang.
@echo  Feel free to modify it to fit your own requirements. 
@echo *=====================================================================================
@echo.
@echo **Ma de in China: some software like Google Chrome require the true Internet first**
@echo.

:start
ECHO What kind of person are you?
ECHO ----------------------------
ECHO 1. Normal People
ECHO 2. Programmer
ECHO ----------------------------
set choice=
set /p choice=Enter the choice number:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto normalpeople
if '%choice%'=='2' goto programmer
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:normalpeople
@echo ---------------------------------------------
@echo Installing 7-Zip, Google Chrome, PotPlayer...
@echo ---------------------------------------------
choco install 7zip.install -y
choco install googlechrome -y
choco install potplayer -y
goto end

:programmer
@echo ---------------------------------------------
@echo Installing 7-Zip, Google Chrome, PotPlayer...
@echo ---------------------------------------------
choco install 7zip.install -y
choco install googlechrome -y
choco install potplayer -y

@echo.
@echo ------------------------------------
@echo Installing Microsoft Teams...
@echo ------------------------------------
choco install microsoft-teams.install -y

@echo.
@echo ------------------------------------
@echo Installing Lightshot...
@echo ------------------------------------
choco install lightshot.install -y

@echo.
@echo ------------------------------------
@echo Installing SysInternals...
@echo ------------------------------------
choco install sysinternals -y

@echo.
@echo ------------------------------------
@echo Installing FileZilla...
@echo ------------------------------------
choco install filezilla -y

@echo.
@echo ------------------------------------
@echo Installing TeamViewer...
@echo ------------------------------------
choco install teamviewer -y

@echo ------------------------------------
@echo Installing NotePad++...
@echo ------------------------------------
choco install notepadplusplus.install -y

@echo.
@echo ------------------------------------
@echo Installing Visual Studio Code...
@echo ------------------------------------
choco install vscode -y
choco install vscode-csharp -y
choco install vscode-icons -y
choco install vscode-mssql -y
choco install vscode-powershell -y

@echo.
@echo ------------------------------------
@echo Installing DotPeek...
@echo ------------------------------------
choco install dotpeek -y

@echo.
@echo ------------------------------------
@echo Installing LINQPad...
@echo ------------------------------------
choco install linqpad -y

@echo.
@echo ------------------------------------
@echo Installing Fiddler...
@echo ------------------------------------
choco install fiddler -y

@echo.
@echo ------------------------------------
@echo Installing Git + GitHub Desktop...
@echo ------------------------------------
choco install git -y
choco install github-desktop -y

@echo.
@echo ---------------------------------------------
@echo Installing FFMpeg, CURL, WGet, OpenSSL...
@echo ---------------------------------------------
choco install ffmpeg -y
choco install curl -y
choco install wget -y
choco install openssl.light -y

@echo.
@echo ------------------------------------
@echo Installing Beyond Compare...
@echo ------------------------------------
choco install beyondcompare -y

@echo.
@echo ------------------------------------
@echo Installing Node.js...
@echo ------------------------------------
choco install nodejs -y
goto end

:end
ECHO ---------------------------------------------
ECHO Install finished, press any key to exit.
pause