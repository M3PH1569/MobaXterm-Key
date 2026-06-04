<div align="center">
  <img src="./assets/m3ph_logo.png" alt="MobaXterm Keygen Logo" width="120" />
  <h1>MobaXterm Keygen</h1>
  <p><strong>Fast, and secure license generator and customizer.</strong></p>
  
  <p>
    <a href="#"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="License" /></a>
    <a href="#"><img src="https://img.shields.io/badge/Version-v3.0-green.svg?style=for-the-badge" alt="Version" /></a>
    <a href="#"><img src="https://img.shields.io/badge/Compatible-v20.X%20|%20v26.2%20|%20v26.3-orange?style=for-the-badge" alt="Compatibility" /></a>
  </p>
</div>

---

## Overview

A modern, user-friendly, and beautifully designed web tool for generating activation keys and customizing **MobaXterm**—the ultimate terminal emulator for Windows with an integrated X11 server, SSH client, and comprehensive network toolset.

All processes run **100% locally** in your browser, ensuring maximum privacy and security.

## Compatibility

- Official support tested extensively with MobaXterm versions **20.X, 26.2, and 26.3**.
- Compatible with both **Portable** and **Installer (Desktop)** editions.

## How to Use

### The Key Generator

1. **Setup your License**:
   - Choose your preferred MobaXterm Edition from the dropdown.
   - Enter your username (alphabetical characters only).
   - Input your current target version (e.g., `26.3`).
   - Define your desired number of users.
2. **Generate**: Click the big **"Generate License"** button to start downloading your `Custom.mxtpro` key.
3. **Deploy**: Drop this file inside your MobaXterm installation folder:
   ```text
   C:\Program Files (x86)\Mobatek\MobaXterm
   ```

### Advanced: Settings Merger

If you have personalized MobaXterm preferences (Customizer tweaks, logos, bash profiles):

1. Switch to the **Settings Merger** tab inside our web app.
2. **Export your settings**: Run `.\MobaXterm.exe -customizer` and select the option to export to `MobaXterm customization.custom`.
3. **Upload both files**:
   - The license key file (`Custom.mxtpro`).
   - The exported configuration file (`MobaXterm customization.custom`).
4. Click **Merge Files** to inject everything into a single, unified `Custom.mxtpro` file to deploy normally.

## Troubleshooting

<details>
<summary><strong>Activation isn't being recognized?</strong></summary>
Ensure you are running a supported version range (v20.X, 26.2, or 26.3). Also, make sure the file is strictly named `Custom.mxtpro` without any duplicates like `Custom (1).mxtpro`.
</details>

<details>
<summary><strong>File generation fails?</strong></summary>
Double check that your provided username only encompasses letters. Spaces and unique symbols are currently not supported by the underlying cryptography validation checks.
</details>

## Development & Building

### Prerequisites
- **Node.js** (v16 or higher)
- **npm** (comes with Node.js)
- **Git**

### Setup Development Environment

1. **Clone the repository**:
   ```bash
   git clone https://github.com/M3PH1569/MobaXterm-Key.git
   cd MobaXterm-Keygen
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Run development mode**:
   ```bash
   npm start
   ```
   This will launch the Electron app with live reload.

### Building Executable Files

The project uses **Electron** and **electron-builder** for desktop packaging:

#### Option 1: Build using script (Recommended)
```bash
.\build-installer.bat
```

#### Option 2: Build manually
```bash
npm run build
```

This generates two formats in the `dist/` folder:

| File | Type | Use Case |
|------|------|----------|
| `MobaXterm-KeyGen-Setup-3.0.0.exe` | Installer | Enterprise (registry entries, uninstaller) |
| `MobaXterm-KeyGen-3.0.0-portable.exe` | Portable | Quick deployment (no installation) |

### Firewall Exception (Optional)

If the application is blocked by Windows Firewall:

**Method 1 - Batch script** (Run as Administrator):
```bash
add-firewall-exception.bat
```

**Method 2 - PowerShell** (Run as Administrator):
```powershell
Add-NetFirewallRule -DisplayName "MobaXterm KeyGen" -Direction Inbound -Program "C:\Program Files\MobaXterm KeyGen\MobaXterm KeyGen.exe" -Action Allow
```

### Project Structure

```
.
├── index.html           # Main application entry
├── main.js             # Electron main process
├── preload.js          # Security isolation layer
├── package.json        # Project configuration & build settings
├── .gitignore          # Git ignore rules
├── css/                # Stylesheets
│   ├── style.css
│   ├── fire.css
│   └── pure-min.css
├── js/                 # JavaScript modules
│   ├── mobaXtermGenerater.js
│   ├── mergeZipFiles.js
│   └── ...
├── assets/             # Images & icons
│   └── m3ph_logo.ico
└── dist/               # Build output (generated)
    ├── MobaXterm-KeyGen-Setup-3.0.0.exe
    └── MobaXterm-KeyGen-3.0.0-portable.exe
```

### Build Configuration

Build settings are defined in [package.json](package.json):

```json
{
  "build": {
    "appId": "com.mobaxterm.keygen",
    "productName": "MobaXterm KeyGen",
    "win": {
      "target": ["nsis", "portable"]
    },
    "nsis": {
      "oneClick": false,
      "allowToChangeInstallationDirectory": true,
      "createDesktopShortcut": true,
      "createStartMenuShortcut": true
    }
  }
}
```

### Security Notes

- ✅ **Code Signed** - Executables are digitally signed to prevent tampering
- ✅ **Context Isolation** - Preload script provides security isolation
- ✅ **No Node Integration** - Renderer process cannot directly access Node.js APIs
- ✅ **Local Processing** - All operations run 100% on user's machine

## Technical & Security Details

This tool operates completely **Client-Side** leveraging `Vue.js` and pure DOM manipulations. **Not a single byte of your data or generated licenses travels to any backend server.**

> **Disclaimer:** This project is provided exclusively for educational concepts and reverse-engineering study cases. For commercial environments, please consider supporting the official developers by purchasing an enterprise license.

## 📝 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

<div align="center">
  <strong>Crafted with ☕ by M3PH1569</strong><br>
  <a href="https://github.com/M3PH1569/MobaXterm-Key">⭐ Star us on GitHub</a>
</div>
