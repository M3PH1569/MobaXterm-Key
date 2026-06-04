; NSIS Installer Script untuk MobaXterm KeyGen
; Dengan firewall exception dan admin privileges

!include "MUI2.nsh"
!include "x64.nsh"
!include "WinVer.nsh"

; Nama & versi aplikasi
Name "MobaXterm KeyGen v3.0.0"
OutFile "$PLUGINSDIR\MobaXterm-KeyGen-3.0.0-Setup.exe"
InstallDir "$PROGRAMFILES\MobaXterm KeyGen"

; Request admin privileges
RequestExecutionLevel admin

; UI Settings
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

; Install section
Section "Install"
    SetOverwrite try
    SetOutPath "$INSTDIR"
    
    ; Copy files
    File /r "${NSISDIR}\..\..\..\..\*.*"
    
    ; Create shortcuts
    CreateDirectory "$SMPROGRAMS\MobaXterm KeyGen"
    CreateShortCut "$SMPROGRAMS\MobaXterm KeyGen\MobaXterm KeyGen.lnk" "$INSTDIR\MobaXterm KeyGen.exe"
    CreateShortCut "$DESKTOP\MobaXterm KeyGen.lnk" "$INSTDIR\MobaXterm KeyGen.exe"
    CreateShortCut "$SMPROGRAMS\MobaXterm KeyGen\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
    
    ; Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    
    ; Add to Control Panel (Add/Remove Programs)
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen" "DisplayName" "MobaXterm KeyGen"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen" "UninstallString" "$INSTDIR\Uninstall.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen" "DisplayIcon" "$INSTDIR\MobaXterm KeyGen.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen" "DisplayVersion" "3.0.0"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen" "Publisher" "M3PH1569"
    
    ; Add firewall exception
    DetailPrint "Adding Firewall Exception..."
    nsExec::ExecToLog 'netsh advfirewall firewall add rule name="MobaXterm KeyGen" dir=in action=allow program="$INSTDIR\MobaXterm KeyGen.exe" enable=yes'
    nsExec::ExecToLog 'netsh advfirewall firewall add rule name="MobaXterm KeyGen (Outbound)" dir=out action=allow program="$INSTDIR\MobaXterm KeyGen.exe" enable=yes'
    
    DetailPrint "Installation Complete!"
SectionEnd

; Uninstall section
Section "Uninstall"
    ; Remove firewall rules
    DetailPrint "Removing Firewall Rules..."
    nsExec::ExecToLog 'netsh advfirewall firewall delete rule name="MobaXterm KeyGen"'
    nsExec::ExecToLog 'netsh advfirewall firewall delete rule name="MobaXterm KeyGen (Outbound)"'
    
    ; Remove shortcuts
    RMDir /r "$SMPROGRAMS\MobaXterm KeyGen"
    Delete "$DESKTOP\MobaXterm KeyGen.lnk"
    
    ; Remove app directory
    RMDir /r "$INSTDIR"
    
    ; Remove registry keys
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MobaXtermKeyGen"
    
    DetailPrint "Uninstall Complete!"
SectionEnd
