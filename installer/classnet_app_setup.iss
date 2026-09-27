[Setup]
AppName=ClassNet App
AppVersion=1.3.0
DefaultDirName={autopf}\CRYPT\ClassNet App
DefaultGroupName=ClassNet App
OutputBaseFilename=ClassNet_App_Setup_v1.3.0
OutputDir=Output
Compression=lzma
SolidCompression=yes

[Files]
; Inclusion du binaire Tauri pour ClassNet App
Source: "..\classnet-app\src-tauri\target\release\classnet-app.exe"; DestDir: "{app}"; Flags: ignoreversion
; Inclusion du serveur Intranet Nuitka si nécessaire
Source: "..\intranet-server\dist_nuitka\server_intranet.dist\*"; DestDir: "{app}\server"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{group}\ClassNet App"; Filename: "{app}\classnet-app.exe"
