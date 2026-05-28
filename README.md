# 🛠️ Lazy-Mode PC Setup Script (`InstallIt!`)

Look, setting up a new PC or reinstalling your apps is a chore. This PowerShell script automates the entire process using Windows Package Manager (`winget`), so you can go touch grass while your computer does the heavy lifting. 

It also comes with a built-in attitude adjustment, free of charge.

---

## ✨ Features

* **Lazy-Mode Automation:** Pass it a list of apps, and it installs them silently.
* **Smart Fallback:** If standard `winget` fails to find or install an app, it automatically attempts to pull it from the **Microsoft Store (`msstore`)**.
* **Zero Interruption:** Bypasses source and package agreements automatically (`--accept-source-agreements --accept-package-agreements`).
* **Emotional Damage:** Insults your OS if it's outdated and refuses to congratulate you when finished.

---

## 📋 Prerequisites

Before you run this, make sure you actually meet the bare minimum requirements:
1. **Windows 10 (1709 or later) or Windows 11**
2. **Winget Installed** (If you don't have it, update your App Installer from the MS Store. Don't make the script yell at you.)
3. **PowerShell** running with Administrator privileges.

---

## ⚙️ Configuration

The script is currently an empty shell because it doesn't know what you want. You need to tell it what apps to install.

1. Open the script in a text editor.
2. Find the `$Apps` array (around line 10).
3. Add your desired Winget IDs inside the `@(...)` block. 

> 💡 **Tip:** Find app IDs by opening a terminal and typing: `winget search "your app name"`

### Example Configuration:
```powershell
$Apps = @(
    "Discord.Discord"
    "Google.Chrome"
    "Git.Git"
    "7zip.7zip"
    "Spotify.Spotify"
)
```

## 🚀 How to run

Because Windows is paranoid about scripts, you'll need to bypass the execution policy to run this.

1. Open Powershell as Administrator
2. Run the following command to allow the script to execute in your current session
```Powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```
3. Dot-source the script to load the function into your terminal.
```Powershell
. .\path\to\the\script.ps
```

## ⚠️ Troubleshooting 

* **"Winget isn't found..."** -> Your OS is either ancien, or your environment varibles are messed up. Install App Installe rfrom the MS store.
* **"Both standard Winget and MS Store Failed..."** -> The App ID you provided is either trash or the package is broken. Fix the ID yourself, just like the script told you to!!
* **"cannot be loaded because running scripts is disabled on this system"** -> You skipped step 2 in the run instructions! Windows blocks custom scripts by default to protect you from yourself. Run `Set-ExecutionPolicy Bypass -Scope Process -Force` first. If it *still* says disabled, your work or school IT administrator probably locked it down via Group Policy, and you're stuck doing it manually.
