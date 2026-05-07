# Win-Alert-Sim

A streamlined simulation tool that mimics a high-priority Windows Security Warning. This project demonstrates how to leverage VBScript and PowerShell to interact with native Windows UI elements (`System.Windows.Forms`) without leaving a permanent footprint on the system.

## 🚀 Features
*   **Native Windows UI**: Uses standard system dialog boxes, icons, and sounds for 100% authenticity.
*   **Stealth Execution**: Runs in a hidden background process via `WScript.Shell`.
*   **Interactive Logic**: Includes a "Take Action" prompt with native **Yes/No** buttons.
*   **Universal Reveal**: Triggers the "Just a joke!" punchline regardless of which button the user clicks (Yes, No, or Close).
*   **Zero-Dependency**: No installation required; runs on any modern Windows environment (7, 10, 11).

## 🛠️ How It Works
1. **Launch**: The script initiates a "Critical" system dialog box using the `System.Windows.Forms` library.
2. **The Interface**: The user is presented with a "Windows Security Warning" containing three options: **Yes**, **No**, and **Cancel**.
3. **The "Close" Logic**: 
   - Clicking the **"X"** in the top-right corner acts as a "Cancel" trigger.
   - Because the script uses sequential command execution, any interaction (Yes, No, Cancel, or Close) will automatically dismiss the first window and trigger the second "Notice" dialog.
4. **The Reveal**: A final "Notice" box appears with the "Just a joke!" message, using the standard blue Information icon.

## 📂 Installation & Usage
1.  **Download**: Copy the `Warning.vbs` file from this repository.
2.  **Execute**: Double-click the file to launch the simulation.
3.  **Interact**: Click either button to dismiss the alert and see the reveal.

## ⚠️ Troubleshooting

### "Windows protected your PC" (SmartScreen)
Because this is a `.vbs` script downloaded from the web, Windows may flag it as unrecognized.
*   **Solution**: Click **"More info"** and then select **"Run anyway"**.

### File opens in Notepad
If the script opens as a text file instead of running:
*   **Solution**: Right-click `Warning.vbs`, select **"Open with..."**, and choose **"Microsoft ® Windows Based Script Host"**.

### Antivirus False Positives
Some security software flags scripts that call PowerShell as a "heuristic" threat. 
*   **Note**: This script is entirely harmless. It does not access files, modify the registry, or connect to the internet. You may need to add a temporary exclusion to run it.

### Manual Termination
To kill the script while it is waiting for input:
1.  Open **Task Manager** (`Ctrl + Shift + Esc`).
2.  Locate **Windows PowerShell**.
3.  Right-click and select **End Task**.

## ⚖️ License
This project is licensed under the **MIT License**.

## 📢 Disclaimer
This project is for **educational and entertainment purposes only**. Do not use this script to cause distress or on systems where you do not have explicit permission. we are not responsible for any misuse of this software.
