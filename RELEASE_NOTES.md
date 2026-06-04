# MobaXterm KeyGen v3.0.0 - Release Notes

## Major Release: Desktop Application Launch

**Release Date:** June 4, 2026

---

## What's New

### 🖥️ Desktop Application (Electron)
- **Native Windows Application** - Packaged as `.exe` installer and portable executable
- **No Browser Required** - Run the application directly without opening a browser
- **Professional Installer** - NSIS installer with clean uninstall and Windows integration
- **Code Signed** - Digitally signed to prevent Windows SmartScreen warnings
- **Firewall Friendly** - Built-in firewall exception support to avoid blocking

### Two Distribution Formats
1. **Installer** (`MobaXterm-KeyGen-Setup-3.0.0.exe`) - ~104 MB
   - Professional NSIS wizard installer
   - Registry entries for Add/Remove Programs
   - Desktop & Start Menu shortcuts
   - Clean uninstall support
   
2. **Portable** (`MobaXterm-KeyGen-3.0.0-portable.exe`) - ~104 MB
   - No installation required
   - Run from USB or any location
   - Perfect for quick deployment

### Enhanced Security
- **Context Isolation** - Secure renderer process isolation
- **Code Signing** - Windows digital signature for trusted execution
- **Local Processing** - 100% client-side, no data leaves your machine
- **Preload Scripts** - Limited API exposure to prevent security vulnerabilities

### Developer Experience
- **Easy Build Process** - Simple `npm run build` or `build-installer.bat`
- **Automated Packaging** - electron-builder handles all complexity
- **Development Mode** - `npm start` for quick testing and debugging
- **Configuration Files** - Updated `package.json` with optimized build settings

---

## Changes Summary

### Added
- ✅ Electron framework integration for desktop deployment
- ✅ NSIS installer configuration with professional UI
- ✅ Portable executable build target
- ✅ `.gitignore` file with proper exclusions
- ✅ Build scripts (`build-installer.bat`, `build.bat`)
- ✅ Firewall exception management scripts (batch & PowerShell)
- ✅ Comprehensive build documentation in README
- ✅ Security isolation with preload scripts

### Improved
- 📈 Better project structure and organization
- 📈 Enhanced documentation with development guide
- 📈 Professional Windows integration and branding

---

## Installation & Usage

### For Users

**Option 1: Using Installer**
```bash
MobaXterm-KeyGen-Setup-3.0.0.exe
```
- Run installer
- Follow wizard prompts
- Application installed in Program Files
- Accessible via Start Menu and Desktop shortcut

**Option 2: Using Portable**
```bash
MobaXterm-KeyGen-3.0.0-portable.exe
```
- No installation needed
- Run directly from USB or any location
- Ideal for quick testing

### For Developers

```bash
# Setup
git clone https://github.com/M3PH1569/MobaXterm-Key.git
cd MobaXterm-Keygen
npm install

# Development
npm start

# Build
npm run build
```

---

## Firewall Configuration

### Automatic (Built-in)
- Application is code-signed → Windows trusts it more
- Installer requests admin privileges for better integration

### Manual (If Still Blocked)

**Batch Script** (Run as Administrator):
```bash
add-firewall-exception.bat
```

**PowerShell** (Run as Administrator):
```powershell
Add-NetFirewallRule -DisplayName "MobaXterm KeyGen" -Direction Inbound -Program "C:\Program Files\MobaXterm KeyGen\MobaXterm KeyGen.exe" -Action Allow
```

---

## Technical Details

### Build Output
```
dist/
├── MobaXterm-KeyGen-Setup-3.0.0.exe          (104 MB - Installer)
├── MobaXterm-KeyGen-3.0.0-portable.exe       (104 MB - Portable)
├── MobaXterm-KeyGen-Setup-3.0.0.exe.blockmap (Update metadata)
└── win-unpacked/                              (Build artifacts)
```

### System Requirements
- **OS:** Windows 10 / Windows 11 (x64)
- **RAM:** 256 MB minimum
- **Disk Space:** 200 MB
- **Permissions:** Admin privileges for installer

### Technologies Used
- **Electron** v42.3.3 - Desktop framework
- **electron-builder** v26.8.1 - Packaging tool
- **NSIS** v3.0.4.1 - Installer generator
- **Vue.js** v2.6.12 - UI framework

---

## Known Issues

None reported at this time.

---

## Migration Guide

### From Web Version (v2.x) to Desktop (v3.0.0)

**No breaking changes!** All previous functionality is preserved:
- ✅ Key generation works identically
- ✅ Settings merger functionality intact
- ✅ File formats unchanged (`.mxtpro`, `.custom`)
- ✅ UI/UX remains the same

**Simply switch from:**
- ❌ Browser-based: `https://moba-xterm-keygen.vercel.app/`
- ✅ Desktop app: `MobaXterm-KeyGen-Setup-3.0.0.exe`

---

## Downloads

| Format | File | Size | Download |
|--------|------|------|----------|
| **Installer** | MobaXterm-KeyGen-Setup-3.0.0.exe | 104 MB | [GitHub Releases](https://github.com/M3PH1569/MobaXterm-Key/releases) |
| **Portable** | MobaXterm-KeyGen-3.0.0-portable.exe | 104 MB | [GitHub Releases](https://github.com/M3PH1569/MobaXterm-Key/releases) |

---

## Additional Resources

- **Documentation:** See [README.md](README.md)
- **Bug Reports:** [GitHub Issues](https://github.com/M3PH1569/MobaXterm-Key/issues)
- **Feature Requests:** [GitHub Discussions](https://github.com/M3PH1569/MobaXterm-Key/discussions)

---

## Credits & Support

- **Author:** M3PH1569
- **Framework:** Electron
- **Packaging:** electron-builder
- **License:** MIT

**Help us grow!** ⭐ Star the repository on GitHub

---

## 📄 Full Changelog

### Version 3.0.0 (June 4, 2026)
- Initial Electron desktop release
- NSIS installer packaging
- Portable executable format
- Code signing integration
- Enhanced security with context isolation
- Comprehensive build documentation
- Firewall exception support

### Version 2.x (Previous)
- Web-based application
- Browser deployment

---

**Questions or Issues?** Please open an issue on [GitHub](https://github.com/M3PH1569/MobaXterm-Key/issues).

Happy generating! 🚀
