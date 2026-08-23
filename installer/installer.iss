; -- installer.iss --
; Generates an installer with Inno Setup.

#define tools_dir_name "embedded-tools"
#define releasedir "..\build\windows\x64\runner\Release\"
; #define instbuilddir "..\build\installer"
#define instbuilddir ".\"
#define toolsdir "..\"+tools_dir_name

#define executable "pacman-APK.exe"
#define app_name "APK Package Manager"
#define dist_appname "pacman-APK"
#define reg_appname "pacman-apk"
#define reg_name_installer "Package installer"

#define reg_assoc_apk reg_appname + ".apk"
#define reg_assoc_xapk reg_appname + ".xapk"
#define reg_assoc_apkm reg_appname + ".apkm"
#define reg_assoc_apks reg_appname + ".apks"

#define path_classes "SOFTWARE\Classes\"
#define path_assoc_user "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\"
#define path_assoc_default ".DEFAULT\"+path_assoc_user 

[Setup]
AppId={{5D0B1333-8F21-4E60-A1E4-42B100238CDE}
AppVersion=1.6.0
PrivilegesRequired=admin
AppName=PacMan-APK
AppPublisher=nuloperrito
ArchitecturesInstallIn64BitMode=x64
WizardStyle=modern
DefaultDirName={autopf}\PacMan-APK
DefaultGroupName=PacMan-APK
UninstallDisplayIcon={app}\{#executable}
Compression=lzma2
SolidCompression=yes
ChangesAssociations=yes
ChangesEnvironment=yes
OutputBaseFilename={#dist_appname}-v{#SetupSetting("AppVersion")}-installer
OutputDir={#instbuilddir}
; Adjust it to "no" if you do not want the path selection page to be hidden when the software has already been installed.
DisableDirPage=auto
DisableProgramGroupPage=no

VersionInfoVersion=1.6.0.0
VersionInfoProductVersion=1.6.0
VersionInfoDescription=PacmanAPK Utility Installer
VersionInfoCompany=nuloperrito
VersionInfoCopyright=Copyright (C) 2026 nuloperrito

[Tasks]
Name: fileassoc_apk; Description: "{cm:AssocFileExtension,{#app_name},.apk}";
Name: fileassoc_xapk; Description: "{cm:AssocFileExtension,{#app_name},.xapk}";
Name: fileassoc_apkm; Description: "{cm:AssocFileExtension,{#app_name},.apkm}";
Name: fileassoc_apks; Description: "{cm:AssocFileExtension,{#app_name},.apks}";

[Registry]
Root: HKA; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "PACMAN_APK_HOME"; ValueData: "{app}"; Flags: createvalueifdoesntexist preservestringtype uninsdeletevalue
; File association: apk
Root: HKA; Subkey: "{#path_classes}\.apk"; ValueData: "{#reg_assoc_apk}"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\.apk\OpenWithProgids"; ValueType: string; ValueName: "{#reg_assoc_apk}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apk}"; ValueData: "{#reg_name_installer}"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apk}\DefaultIcon"; ValueData: "%PACMAN_APK_HOME%\{#executable},0"; ValueType: expandsz;  ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apk}\shell\open\command";  ValueData: """%PACMAN_APK_HOME%\{#executable}"" ""%1""";  ValueType: expandsz;  ValueName: ""
Root: HKU; Subkey: "{#path_assoc_default}\.apk\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apk
Root: HKCU; Subkey: "{#path_assoc_user}\.apk\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apk
; File association: xapk
Root: HKA; Subkey: "{#path_classes}\.xapk"; ValueData: "{#reg_assoc_xapk}"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\.xapk\OpenWithProgids"; ValueType: string; ValueName: "{#reg_assoc_xapk}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_xapk}"; ValueData: "{#reg_name_installer}"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_xapk}\DefaultIcon"; ValueData: "%PACMAN_APK_HOME%\{#executable},0"; ValueType: expandsz;  ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_xapk}\shell\open\command";  ValueData: """%PACMAN_APK_HOME%\{#executable}"" ""%1""";  ValueType: expandsz;  ValueName: ""
Root: HKU; Subkey: "{#path_assoc_default}\.xapk\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_xapk
Root: HKCU; Subkey: "{#path_assoc_user}\.xapk\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_xapk
; File association: apkm
Root: HKA; Subkey: "{#path_classes}\.apkm"; ValueData: "{#reg_assoc_apkm}"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\.apkm\OpenWithProgids"; ValueType: string; ValueName: "{#reg_assoc_apkm}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apkm}"; ValueData: "{#reg_name_installer}"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apkm}\DefaultIcon"; ValueData: "%PACMAN_APK_HOME%\{#executable},0"; ValueType: expandsz;  ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apkm}\shell\open\command";  ValueData: """%PACMAN_APK_HOME%\{#executable}"" ""%1""";  ValueType: expandsz;  ValueName: ""
Root: HKU; Subkey: "{#path_assoc_default}\.apkm\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apkm
Root: HKCU; Subkey: "{#path_assoc_user}\.apkm\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apkm
; File association: apks
Root: HKA; Subkey: "{#path_classes}\.apks"; ValueData: "{#reg_assoc_apks}"; Flags: uninsdeletevalue; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\.apks\OpenWithProgids"; ValueType: string; ValueName: "{#reg_assoc_apks}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apks}"; ValueData: "{#reg_name_installer}"; Flags: uninsdeletekey; ValueType: string; ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apks}\DefaultIcon"; ValueData: "%PACMAN_APK_HOME%\{#executable},0"; ValueType: expandsz;  ValueName: ""
Root: HKA; Subkey: "{#path_classes}\{#reg_assoc_apks}\shell\open\command";  ValueData: """%PACMAN_APK_HOME%\{#executable}"" ""%1""";  ValueType: expandsz;  ValueName: ""
Root: HKU; Subkey: "{#path_assoc_default}\.apks\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apks
Root: HKCU; Subkey: "{#path_assoc_user}\.apks\UserChoice"; ValueType: none; Flags: deletekey; Tasks: fileassoc_apks

[Files]
Source: "{#releasedir}\*"; Excludes: "\*.lib,\*.exp,\{#tools_dir_name}"; DestDir: "{app}"; Flags: recursesubdirs
Source: "{#toolsdir}\*"; DestDir: "{app}\{#tools_dir_name}"; Flags: recursesubdirs

[Run]
Filename: "{app}\{#executable}"; Description: "{cm:LaunchProgram,{#StringChange(app_name, '&', '&&')}}"; Flags: postinstall unchecked nowait runasoriginaluser

[Icons]
Name: "{group}\PacMan-APK"; Filename: "{app}\{#executable}"; Check: ShouldCreateStartMenuIcon
Name: "{autodesktop}\PacMan-APK"; Filename: "{app}\{#executable}"; Check: ShouldCreateDesktopIcon

[Code]
var
  ShortcutPage: TInputOptionWizardPage;

// Create custom page for shortcut options
procedure InitializeWizard();
begin
  ShortcutPage := CreateInputOptionPage(
    wpSelectDir,
    'Select Shortcuts',
    'Which shortcuts should be created?',
    'Select the shortcuts you want the installer to create:',
    False, False
  );
  
  // Add options
  ShortcutPage.Add('Create Start Menu shortcuts');
  ShortcutPage.Add('Create a Desktop shortcut');
  
  // Default values: both checked
  ShortcutPage.Values[0] := True;
  ShortcutPage.Values[1] := True;
end;

// Dynamically skip wpSelectProgramGroup if Start Menu shortcut is not requested
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := False;
  if PageID = wpSelectProgramGroup then
  begin
    Result := not ShortcutPage.Values[0];
  end;
end;

// Helper functions for [Icons] Check parameter
function ShouldCreateStartMenuIcon(): Boolean;
begin
  Result := ShortcutPage.Values[0];
end;

function ShouldCreateDesktopIcon(): Boolean;
begin
  Result := ShortcutPage.Values[1];
end;

// Check if a process is running via WMI
function IsAppRunning(const FileName: string): Boolean;
var
  WbemLocator: Variant;
  WMIService: Variant;
  WbemObjectSet: Variant;
begin
  Result := False;
  try
    WbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
    WMIService := WbemLocator.ConnectServer('', 'root\CIMV2');
    WbemObjectSet := WMIService.ExecQuery('SELECT Name FROM Win32_Process WHERE Name="' + FileName + '"');
    Result := not VarIsNull(WbemObjectSet) and (WbemObjectSet.Count > 0);
  except
    // Fallback to False if WMI service is unavailable or corrupted on the host machine
    Result := False;
  end;
end;

// Attempt to kill a process and return True if successful
function KillApp(const FileName: string): Boolean;
var
  ResultCode: Integer;
begin
  // Execute taskkill to force terminate the process and its child processes
  Exec('taskkill.exe', '/F /IM "' + FileName + '" /T', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  
  // Buffer time for the OS to completely release the process resources
  Sleep(500); 
  
  // Return True if the process is no longer running
  Result := not IsAppRunning(FileName);
end;

// Built-in Inno Setup event function triggered before uninstallation starts
function InitializeUninstall(): Boolean;
var
  AdbRunning, PacmanRunning: Boolean;
  KillFailed: Boolean;
begin
  Result := True;
  KillFailed := False;

  AdbRunning := IsAppRunning('adb.exe');
  PacmanRunning := IsAppRunning('pacman-APK.exe');

  if AdbRunning or PacmanRunning then
  begin
    if AdbRunning then
    begin
      if not KillApp('adb.exe') then
        KillFailed := True;
    end;

    if PacmanRunning then
    begin
      if not KillApp('pacman-APK.exe') then
        KillFailed := True;
    end;

    if KillFailed then
    begin
      // Prompt the user and abort the uninstallation process
      MsgBox('The processes "adb.exe" or "pacman-APK.exe" are currently in use and cannot be terminated.' + #13#10 + 
             'Please close them manually before proceeding with the uninstallation.', mbError, MB_OK);
      Result := False;
    end;
  end;
end;
