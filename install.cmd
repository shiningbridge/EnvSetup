@echo off
@echo *======================================================================
@echo  Choco Auto Installer
@echo.
@echo  This script is for installing new dev machines for Edi Wang.
@echo  Feel free to modify it to fit your own requirements. 
@echo *======================================================================
@echo.
@echo 1/3 Installing normal people software...
@echo.
@echo ------------------------------------
@echo Installing 7-Zip...
@echo ------------------------------------
choco install 7zip.install -y

@echo.
@echo ------------------------------------
@echo Installing Microsoft Teams...
@echo ------------------------------------
choco install microsoft-teams.install -y

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
@echo Installing Beyond Compare...
@echo ------------------------------------
choco install beyondcompare -y

@echo.
@echo ------------------------------------
@echo Installing Node.js...
@echo ------------------------------------
choco install nodejs -y