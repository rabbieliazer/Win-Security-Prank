Option Explicit
Dim shell, fso, tempFolder, htmlPath, outFile, response, htaPath, htaFile

Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
tempFolder = shell.ExpandEnvironmentStrings("%TEMP%")

' --- 1. THE INITIAL OFFICIAL ALERT ---
response = MsgBox("Windows Security has detected a high-risk Trojan on this PC." & vbCrLf & vbCrLf & _
           "Threat: Trojan:Win32/Agent.AES-Exploit" & vbCrLf & _
           "Action Recommended: Run Full Scan immediately.", _
           48 + 1, "Windows Security Center")

' If user clicks "Cancel" 
If response = 2 Then
    MsgBox "Just a joke! You have been pranked. Your PC is safe! :-)", 64, "Gotcha!"
    WScript.Quit
End If

' --- 2. THE SCANNING WINDOW (HTA) ---
htaPath = tempFolder & "\scan.hta"
Set htaFile = fso.CreateTextFile(htaPath, True)

htaFile.WriteLine "<html><head><meta http-equiv='x-ua-compatible' content='ie=edge'><title>Windows Security Scan</title>"
htaFile.WriteLine "<hta:application windowstate='normal' border='thin' maximizebutton='no' minimizebutton='no' sysmenu='no' scroll='no' singleinstance='yes'>"
htaFile.WriteLine "<style>body{font-family:'Segoe UI',sans-serif; background:#f0f0f0; margin:20px; overflow:hidden;}"
htaFile.WriteLine ".bar-bg{width:100%; background:#ddd; height:20px; border-radius:10px; overflow:hidden; margin-top:10px;}"
htaFile.WriteLine ".bar-fill{width:0%; background:#0078d4; height:100%; transition: width 0.2s ease-in-out;}"
htaFile.WriteLine "</style></head><body onload='move()'>"
htaFile.WriteLine "<h3>Scanning System Files...</h3>"
htaFile.WriteLine "<p id='status'>Initializing scan engine...</p>"
htaFile.WriteLine "<div class='bar-bg'><div id='fill' class='bar-fill'></div></div>"
htaFile.WriteLine "<script>function move(){var elem=document.getElementById('fill'); var p=0; "
htaFile.WriteLine "var id=setInterval(frame, 150); function frame(){if(p>=100){clearInterval(id); setTimeout(function(){window.close();},500);}"
htaFile.WriteLine "else{p++; elem.style.width=p+'%'; if(p%10==0){document.getElementById('status').innerText='Checking: C:\\Windows\\System32\\drivers\\' + (p*13) + '.sys';}}}}</script>"
htaFile.WriteLine "</body></html>"
htaFile.Close

' FIX: Prevent "Unable to wait for process" error
On Error Resume Next
shell.Run htaPath, 1, True 
On Error GoTo 0

If fso.FileExists(htaPath) Then fso.DeleteFile htaPath 

' --- 3. THE "TROJAN DETECTED" PROMPT ---
response = MsgBox("SCAN COMPLETE: Trojan.Win32.Generic Detected!" & vbCrLf & _
           "Status: Failed to quarantine." & vbCrLf & vbCrLf & _
           "Download 'Trojan Destroyer' to remove threat?", _
           16 + 4, "Critical Security Alert")

' --- 4. THE JOKE LOGIC ---
If response = 7 Then ' Clicked NO
    MsgBox "Just a joke! You have been pranked. Your PC is perfectly fine.", 64, "Gotcha!"
Else ' Clicked YES
    htmlPath = tempFolder & "\destroyer_tool.html"
    Set outFile = fso.CreateTextFile(htmlPath, True)
    
    outFile.WriteLine "<!DOCTYPE html><html><head><meta http-equiv='x-ua-compatible' content='ie=edge'><title>Trojan Destroyer v1.0</title>"
    outFile.WriteLine "<style>body{text-align:center; font-family:'Segoe UI', sans-serif; background:#1a1a1a; color:white; padding-top:100px;}"
    outFile.WriteLine ".card{background:#2d2d2d; padding:50px; border-radius:15px; display:inline-block; border: 2px solid #d9534f;}"
    outFile.WriteLine "button{padding:20px 40px; font-size:22px; background:#d9534f; color:white; border:none; border-radius:8px; cursor:pointer; font-weight:bold;}"
    outFile.WriteLine "</style></head><body>"
    outFile.WriteLine "<div class='card' id='ui'>"
    outFile.WriteLine "<h1>Trojan Destroyer</h1><p>Status: <span style='color:#d9534f;'>Infection Found</span></p>"
    outFile.WriteLine "<p>Click below to download the removal tool and restart your PC.</p>"
    outFile.WriteLine "<button onclick='prank()'>DOWNLOAD DESTROYER</button></div>"
    outFile.WriteLine "<div id='joke' style='display:none;'> <h1 style='font-size:70px;'>😂</h1>"
    outFile.WriteLine "<h1 style='color:#5cb85c;'>JUST A JOKE!</h1>"
    outFile.WriteLine "<h2 style='color:white;'>You have been pranked!</h2>"
    outFile.WriteLine "<img src='https://i.giphy.com/3o7TKVUn7iM8FMEU24.gif' width='350' style='border-radius:10px;'></div>"
    outFile.WriteLine "<script>function prank(){document.getElementById('ui').style.display='none'; document.getElementById('joke').style.display='block';}</script>"
    outFile.WriteLine "</body></html>"
    outFile.Close
    
    shell.Run "explorer.exe " & htmlPath
End If