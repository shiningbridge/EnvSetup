@echo off
@echo *=====================================================================================
@echo  Choco Auto Installer
@echo.
@echo  This script is for setup new dev machine for Edi Wang.
@echo  Feel free to modify it to fit your own requirements. 
@echo *=====================================================================================
@echo.
@echo [WARNING] Ma de in China: some software like Google Chrome require the true Internet first
@echo.
@echo 1/3 Installing normal people software...
@echo.
@echo ------------------------------------
@echo Installing 7-Zip...
@echo ------------------------------------
choco install 7zip.install -y

@echo.
@echo ------------------------------------
@echo Installing Google Chrome...
@echo ------------------------------------
choco install googlechrome -y

@echo.
@echo ------------------------------------
@echo Installing PotPlayer...
@echo ------------------------------------
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
@echo 2/3 Installing IT pro software...
choco install sysinternals -y
choco install filezilla -y
choco install teamviewer -y

@echo 3/3 Installing developer software...
@echo.
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
@echo ------------------------------------
@echo Installing FFMpeg...
@echo ------------------------------------
choco install ffmpeg -y

@echo.
@echo ------------------------------------
@echo Installing CURL...
@echo ------------------------------------
choco install curl -y

@echo.
@echo ------------------------------------
@echo Installing wget...
@echo ------------------------------------
choco install wget -y

@echo.
@echo ------------------------------------
@echo Installing OpenSSL...
@echo ------------------------------------
choco install openssl.light -y

@echo.
@echo ------------------------------------
@echo Installing Beyond Compare...
@echo ------------------------------------
choco install beyondcompare -y

REM @echo.
REM @echo ------------------------------------
REM @echo Installing Node.js...
REM @echo ------------------------------------
REM choco install nodejs -y