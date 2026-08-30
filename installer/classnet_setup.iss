[Setup]
AppName=ClassNet Suite Enterprise
AppVersion=1.3.0
AppPublisher=CRYPT Enterprise
AppPublisherURL=https://crypt-tech.internal
DefaultDirName={autopf}\CRYPT\ClassNet
DefaultGroupName=ClassNet Enterprise
OutputBaseFilename=ClassNet_Setup_v1.3.0
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin

[Files]
; Application principale Tauri (ClassNet P)[cite: 3]
Source: "classnet-p\src-tauri\target\release\classnet-p.exe"; DestDir: "{app}"; Flags: ignoreversion
; Exécutable du Serveur Intranet compilé par Nuitka
Source: "intranet-server\dist_nuitka\server_intranet.dist\*"; DestDir: "{app}\server"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\ClassNet P (Administration)"; Filename: "{app}\classnet-p.exe"
Name: "{group}\Démarrer le Nœud Intranet Local"; Filename: "{app}\server\server_intranet.exe"
Name: "{autodesktop}\ClassNet P Administration"; Filename: "{app}\classnet-p.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Créer un raccourci sur le Bureau"; GroupDescription: "Tâches supplémentaires :"

[Run]
Filename: "{app}\server\server_intranet.exe"; Description: "Lancer le serveur Intranet en arrière-plan"; Flags: nowait postinstall skipifsilent
Filename: "{app}\classnet-p.exe"; Description: "Lancer ClassNet P maintenant"; Flags: nowait postinstall skipifsilent
