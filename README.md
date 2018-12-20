# Edi Windows 10 Developer Environment Setup

The script is not complete yet, it may be very very buggy and blow up your computer sky high.

## 01-Prepare-Windows.ps1

Run this script first. It will do the following operations:

- Set a New Computer Name
- Remove a few pre-installed UWP applications
  - Messaging
  - CandyCrush
  - Bing News
  - Solitaire
  - People
  - Feedback Hub
  - Your Phone
  - My Office
  - FitbitCoach
  - Netflix
- Remove "Microsoft Edge" desktop shortcut icon
- Enable Developer Mode (for UWP Development)
- Enable Remote Desktop
- Install IIS
  - ASP.NET 4.7
  - Dynamic and Static Compression
  - Basic Authentication
  - Windows Authentication
  - Server Side Includes
  - WebSockets
- Install Chocolate for Windows
- Restart Windows

## 02-Install-Software.cmd

Run this to use choco to install common development tools:

// TODO