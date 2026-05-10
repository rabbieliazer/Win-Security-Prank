' Windows Notification Prank

Dim shell, command
Set shell = CreateObject("WScript.Shell")

command = "powershell -WindowStyle Hidden -command ""Add-Type -AssemblyName System.Windows.Forms; " & _
          "[reflection.assembly]::loadwithpartialname('System.Windows.Forms'); " & _
          "$n = New-Object System.Windows.Forms.NotifyIcon; " & _
          "$n.Icon = [System.Drawing.SystemIcons]::Error; " & _
          "$n.Visible = $true; " & _
          "$n.ShowBalloonTip(5000, 'Windows Security', 'Unauthorized login attempt detected. Action required.', [System.Windows.Forms.ToolTipIcon]::Error); " & _
          "Start-Sleep -Seconds 5; " & _
          "[System.Windows.Forms.MessageBox]::Show('Just a joke!', 'Notice', 0, 64)"""

shell.Run command, 0, False
