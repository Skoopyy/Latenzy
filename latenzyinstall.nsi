# define name of installer
OutFile "installer.exe"
 
# define installation directory
InstallDir $DESKTOP
 
# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel user
 
# start default section
Section
 
    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR
 
    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
 
    # create a shortcut named "Latenzy" in the start menu programs directory
    # point the Latenzy at the program uninstaller
    CreateShortcut "$SMPROGRAMS\Latenzy.lnk" "$INSTDIR\uninstall.exe"
SectionEnd
 
# uninstaller section start
Section "uninstall"
 
    # Remove the link from the start menu
    Delete "$SMPROGRAMS\Latenzy.lnk"
 
    # Delete the uninstaller
    Delete $INSTDIR\uninstaller.exe
 
    RMDir $INSTDIR
# uninstaller section end
SectionEnd