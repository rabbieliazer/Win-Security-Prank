' Classic Windows Warning

Dim shell, command
Set shell = CreateObject("WScript.Shell")

command = "powershell -WindowStyle Hidden -command ""Add-Type -AssemblyName System.Windows.Forms; " & _
          "[System.Windows.Forms.MessageBox]::Show('A security breach has been detected. Take Action?', 'Windows Security Warning', 3, 16); " & _
          "[System.Windows.Forms.MessageBox]::Show('Just a joke!', 'Notice', 0, 64)"""

shell.Run command, 0, False
