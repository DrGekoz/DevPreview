#define MyAppName "DevPreview"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Joseph Williams / DrGekoz"
#define MyAppURL "https://github.com/DrGekoz/DevPreview"
#define BuildDir "MarkdownPreview\\bin\\Release"

[Setup]
AppId={{C6A4B0A6-7E04-4F9A-A2E7-DEVPREVIEW1000}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={autopf}\DevPreview
DefaultGroupName=DevPreview
UninstallDisplayIcon={app}\MarkdownPreview.dll
OutputDir=dist
OutputBaseFilename=DevPreviewSetup-1.0.0-fixed
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible


[Files]
Source: "{#BuildDir}\MarkdownPreview.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDir}\MarkdownPreview.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDir}\Markdig.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDir}\SharpShell.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "BuildTools\srm.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "DevPreview.cer"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{sys}\certutil.exe"; Parameters: "-addstore -f TrustedPublisher ""{app}\DevPreview.cer"""; StatusMsg: "Trusting DevPreview certificate..."; Flags: runhidden waituntilterminated
Filename: "{app}\srm.exe"; Parameters: "install ""{app}\MarkdownPreview.dll"" -codebase"; StatusMsg: "Registering Explorer Preview Pane handler..."; Flags: runhidden waituntilterminated
Filename: "{sys}\taskkill.exe"; Parameters: "/f /im explorer.exe"; Flags: runhidden waituntilterminated
Filename: "{win}\explorer.exe"; Flags: runhidden nowait

[UninstallRun]
Filename: "{app}\srm.exe"; Parameters: "uninstall ""{app}\MarkdownPreview.dll"""; Flags: runhidden waituntilterminated
Filename: "{sys}\taskkill.exe"; Parameters: "/f /im explorer.exe"; Flags: runhidden waituntilterminated
Filename: "{win}\explorer.exe"; Flags: runhidden nowait


