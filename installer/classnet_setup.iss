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
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "Créer un raccourci sur le Bureau pour ClassNet P"; GroupDescription: "Tâches supplémentaires :"

[Files]
; 1. Application Principale de Bureau (Tauri - ClassNet P)
Source: "..\classnet-p\src-tauri\target\release\classnet-p.exe"; DestDir: "{app}"; Flags: ignoreversion
; 2. Serveur Intranet Local compilé en autonome par Nuitka
Source: "..\intranet-server\dist_nuitka\server_intranet.dist\*"; DestDir: "{app}\server"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\ClassNet P (Administration)"; Filename: "{app}\classnet-p.exe"
Name: "{group}\Démarrer le Nœud Intranet Local"; Filename: "{app}\server\server_intranet.exe"
Name: "{autodesktop}\ClassNet P Administration"; Filename: "{app}\classnet-p.exe"; Tasks: desktopicon

[Run]
; Lancer automatiquement le serveur intranet en arrière-plan à la fin de l'installation
Filename: "{app}\server\server_intranet.exe"; Description: "Lancer le serveur Intranet local CRYPT"; Flags: nowait postinstall skipifsilent
; Lancer l'application de bureau
Filename: "{app}\classnet-p.exe"; Description: "Lancer ClassNet P maintenant"; Flags: nowait postinstall skipifsilent
