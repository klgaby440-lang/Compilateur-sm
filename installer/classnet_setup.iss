[Setup]
AppName=ClassNet Suite Enterprise
AppVersion=1.3.0
AppPublisher=CRYPT Enterprise
AppPublisherURL=https://crypt-tech.internal
DefaultDirName={autopf}\CRYPT\ClassNet
DefaultGroupName=ClassNet Enterprise
OutputBaseFilename=ClassNet_Suite_Setup_v1.3.0
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "Créer les raccourcis sur le Bureau"; GroupDescription: "Tâches supplémentaires :"

[Files]
; 1. Interface Administration ClassNet P (Tauri)
Source: "..\classnet-p\src-tauri\target\release\classnet-p.exe"; DestDir: "{app}"; Flags: ignoreversion
; 2. Interface Enseignant ClassNet App (Tauri)
Source: "..\classnet-app\src-tauri\target\release\classnet-app.exe"; DestDir: "{app}"; Flags: ignoreversion
; 3. Nœud Serveur Intranet Local (Nuitka)
Source: "..\intranet-server\dist_nuitka\server_intranet.dist\*"; DestDir: "{app}\server"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\ClassNet P (Administration)"; Filename: "{app}\classnet-p.exe"
Name: "{group}\ClassNet App (Saisie Enseignant)"; Filename: "{app}\classnet-app.exe"
Name: "{group}\Démarrer le Nœud Intranet Local"; Filename: "{app}\server\server_intranet.exe"
Name: "{autodesktop}\ClassNet P Administration"; Filename: "{app}\classnet-p.exe"; Tasks: desktopicon
Name: "{autodesktop}\ClassNet App Enseignant"; Filename: "{app}\classnet-app.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\server\server_intranet.exe"; Description: "Lancer le serveur Intranet local CRYPT"; Flags: nowait postinstall skipifsilent
Filename: "{app}\classnet-p.exe"; Description: "Lancer ClassNet P (Administration)"; Flags: nowait postinstall skipifsilent
