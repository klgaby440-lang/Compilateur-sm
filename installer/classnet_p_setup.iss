[Setup]
AppName=ClassNet P
AppVersion=1.3.0
DefaultDirName={autopf}\CRYPT\ClassNet P
DefaultGroupName=ClassNet P
OutputBaseFilename=ClassNet_P_Setup_v1.3.0
OutputDir=Output
Compression=lzma
SolidCompression=yes

[Files]
; Inclusion du binaire Tauri pour ClassNet P
Source: "..\classnet-p\src-tauri\target\release\classnet-p.exe"; DestDir: "{app}"; Flags: ignoreversion
; Inclusion du serveur Intranet Nuitka
Source: "..\intranet-server\dist_nuitka\server_intranet.dist\*"; DestDir: "{app}\server"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{group}\ClassNet P (Préfet)"; Filename: "{app}\classnet-p.exe"
