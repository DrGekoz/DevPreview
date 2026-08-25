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
OutputBaseFilename=DevPreviewSetup-1.0.0-native
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
Source: "NativePreview\DevPreviewNative.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Renderer\bin\Release\net472\DevPreview.Renderer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Renderer\bin\Release\net472\*.dll"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Classes\CLSID\{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"; ValueType: string; ValueName: ""; ValueData: "DevPreview Native Preview Handler"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\CLSID\{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}\InProcServer32"; ValueType: string; ValueName: ""; ValueData: "{app}\DevPreviewNative.dll"
Root: HKLM; Subkey: "SOFTWARE\Classes\CLSID\{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}\InProcServer32"; ValueType: string; ValueName: "ThreadingModel"; ValueData: "Both"
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\PreviewHandlers"; ValueType: string; ValueName: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"; ValueData: "DevPreview"
Root: HKLM; Subkey: "SOFTWARE\Classes\.md\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.markdown\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.py\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.json\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.html\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.htm\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.css\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.js\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.ts\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.xml\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.yaml\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.yml\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.txt\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.log\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.ini\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.bat\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.cmd\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.ps1\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.cs\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"
Root: HKLM; Subkey: "SOFTWARE\Classes\.sql\shellex\{{8895b1c6-b41f-4c1c-a562-0d564250836f}"; ValueType: string; ValueName: ""; ValueData: "{{8B4FB2D1-2F50-4D64-9A71-345A9F704C1E}"

[Run]
Filename: "{sys}\certutil.exe"; Parameters: "-addstore -f TrustedPublisher ""{app}\DevPreview.cer"""; StatusMsg: "Trusting DevPreview certificate..."; Flags: runhidden waituntilterminated
Filename: "{app}\srm.exe"; Parameters: "install ""{app}\MarkdownPreview.dll"" -codebase"; StatusMsg: "Registering Explorer Preview Pane handler..."; Flags: runhidden waituntilterminated
Filename: "{sys}\taskkill.exe"; Parameters: "/f /im explorer.exe"; Flags: runhidden waituntilterminated
Filename: "{win}\explorer.exe"; Flags: runhidden nowait

[UninstallRun]
Filename: "{app}\srm.exe"; Parameters: "uninstall ""{app}\MarkdownPreview.dll"""; Flags: runhidden waituntilterminated
Filename: "{sys}\taskkill.exe"; Parameters: "/f /im explorer.exe"; Flags: runhidden waituntilterminated
Filename: "{win}\explorer.exe"; Flags: runhidden nowait


