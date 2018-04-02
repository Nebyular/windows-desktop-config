##
##   v0.1 Windows Setup Script
##   Jack Ford
##

#Requires -RunAsAdministrator

#Disable Features
#We're going to disable these unwanted/unsecure features
Write-Host Disabling Internet Explorer 11...
Disable-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 -norestart | Out-Null
Write-Host Done!
Write-Host Disabling Single Message Block v1 Protocol...
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -norestart | Out-Null
Write-Host Done!
Write-Host Disabling Single Message Block v1 Client...
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol-Client -norestart | Out-Null
Write-Host Done!
Write-Host Disabling Single Message Block v1...
Disable-WindowsOptionalFeature -Online -FeatureName SMB1protocol-Deprecation -norestart | Out-Null
Write-Host Done!
Write-Host Disabling Windows Media Player...
Disable-WindowsOptionalFeature -Online -FeatureName WindowsMediaPlayer -norestart | Out-Null
Write-Host Done!


#Disable Flash in Edge
Write-Host Disabling Flash in Edge...
$registryPath = "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Addons"
$Name = "FlashPlayerEnabled"
$value = "0"
If (!(Test-Path $registryPath))
{
New-Item -Path $registryPath -Force | Out-Null
}
New-ItemProperty -Path $registryPath -Name $Name -Value $value -PropertyType DWORD -Force | Out-Null
Write-Host Done!

#Enable Features
#We're enabling features we want i.e. WSL
Write-Host Enabling Windows Subsystem for Linux...
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -norestart | Out-Null
Write-Host Done!
Write-Host Enabling Ransomware Protection...
Set-MpPreference -EnableControlledFolderAccess Enabled
Write-Host Done!

#Takeown command in explorer context menu
Write-Host Implementing Take Ownership Context Menu Command...
regedit /s takeown.reg #this must be present in the same directory, may try to implement my own later using pure powershell
Write-Host Done!

#Shortcuts for startmenu
Write-Host Copying Files to Start Menu...
Copy-Item "ZeroSector" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ZeroSector" –Recurse | Out-Null
Write-Host Done!

Write-Host The system will now reboot. Press any key to continue...
Read-Host
shutdown /r /t 0

