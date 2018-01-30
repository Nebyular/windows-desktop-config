# windows-desktop-config
A small Powershell script for my Windows 10 Desktop

What does this script do?

1. Disables Windows Features:
    - All SMBv1 components (SMB1Protocol-Client, SMB1Protocol, SMB1Protocol-Deprecation)
    - Internet Explorer 11
    - Windows Media Player
2.  Disables Flash in Microsoft Edge via Registry (per GPO)
3. Enables the Windows Subsystem for Linux Windows Feature
4. Merges the TenForums Take Ownership Context Menu registry keys (https://www.tenforums.com/tutorials/3841-add-take-ownership-context-menu-windows-10-a.html)
5. Copies files over to the Start Menu Directory for my own useful shortcuts (modify for yourselves!)
6. Reboots upon any key prompt so the changes can take effect!

Keep in mind...

- This requires Powershell to run as Admin! You will recieve an error asking you to run Powershell under an Admin account if you do not do so.
- Please run this script within the same directory as the git structure including all supplementry files. Remotely running this or, running from another directory can cause issues i.e. Windows will instead attempt find files from %systemdrive%\%systemroot%\system32 and fail to find them.


You are welcome to modify everything to how you see fit to suit your own needs!
