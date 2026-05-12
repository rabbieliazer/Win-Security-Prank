# Win-Alert-Sim

A professional-grade collection of security alert simulations. This library uses VBScript and PowerShell to create convincing UI forms that mimic major antivirus providers and native Windows system alerts for educational demonstrations and harmless pranks.

## 🎨 Available Themes & Branding

| Brand | Visual Style | Status | UI Type |
| :---: | :--- | :---: | :--- |
| <img src="https://simpleicons.org/icons/microsoftdefender.svg" width="20" height="20"> | **Microsoft Defender** | `Active` | Custom Form (Blue/White) |
| <img src="https://simpleicons.org/icons/mcafee.svg" width="20" height="20"> | **McAfee** | `Active` | Custom Form (Red/White) |
| <img src="https://simpleicons.org/icons/avast.svg" width="20" height="20"> | **Avast** | `Active` | Custom Form (Purple/Orange) |
| <img src="https://simpleicons.org/icons/norton.svg" width="20" height="20"> | **Norton** | `Active` | Custom Form (Yellow/Black) |
| <img src="https://simpleicons.org/icons/windows.svg" width="20" height="20"> | **Windows Security** | `Active` | HTA Application |
| <img src="https://simpleicons.org/icons/windows.svg" width="20" height="20"> | **Windows System** | `Active` | Toast Notification |
| <img src="https://upload.wikimedia.org/wikipedia/commons/5/5f/Windows_logo_-_2012.svg" width="20" height="20"> | **Classic Windows** | `Active` | Native MessageBox |

## 🛠️ How It Works
These scripts utilize VBScript, PowerShell, and HTA (HTML Applications) to create realistic interfaces.
1. **Stealth**: VBScript wrappers execute commands silently without visible terminal windows.
2. **Topmost**: Windows are set to stay above all other applications.
3. **Interaction**: Every script includes an action button that triggers the reveal.
4. **The Reveal**: Regardless of the button clicked (including close), a final "Just a joke!" notice appears.

## 📂 Installation & Usage
1. Download the `.vbs` or `.hta` file of your choice from this repository.
2. Double-click the file to execute the simulation.
3. To terminate a script manually, end the `powershell.exe` process in **Task Manager**.

## ⚠️ Troubleshooting
* **SmartScreen**: Windows may block unrecognized `.vbs` files. Click **"More Info"** -> **"Run Anyway"**.
* **Focus Assist**: If `NotificationPrank.vbs` does not appear, ensure "Do Not Disturb" (Focus Assist) is turned off.
* **Heuristics**: Some security software may flag scripts that call PowerShell. These scripts are 100% harmless visual simulations.

## ⚖️ License
This project is licensed under a **Custom Non-Commercial License**.
* **Personal Use**: Allowed (Sharing with friends/family for pranks).
* **Commercial Use**: **STRICTLY PROHIBITED**. You may not sell these scripts or include them in paid packages without permission.

---
*Disclaimer: For educational and entertainment purposes only.*
