' Security Alert Simulation
' Developed by Tosh Developers

Dim shell, command
Set shell = CreateObject("WScript.Shell")

' Logic: 
' 3 = Yes/No/Cancel buttons
' 16 = Critical Error Icon
' The semicolon ensures the second box triggers after any interaction with the first.
command = "powershell -WindowStyle Hidden -command ""Add-Type -AssemblyName System.Windows.Forms; " & _
          "[System.Windows.Forms.MessageBox]::Show('A security breach has been detected. Take Action?', 'Windows Security Warning', 3, 16); " & _
          "[System.Windows.Forms.MessageBox]::Show('Just a joke!', 'Notice', 0, 64)"""

shell.Run command, 0, False
