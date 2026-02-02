; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#define MyAppName "擦拭机二代"
#define MyAppVersion "2.0"
#define MyAppPublisher "wildfire~廿一"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "BoardMeasureDustV2.exe"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (若要生成新的 GUID，可在菜单中点击 "工具|生成 GUID"。)

AppId={{B569C4CE-2936-4945-8438-6F148200B83B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; 以下行取消注释，以在非管理安装模式下运行（仅为当前用户安装）。
;PrivilegesRequired=lowest
OutputDir=D:\packInstallTest\安装测试
OutputBaseFilename=BoardMeasureDust
SetupIconFile=D:\project\company\BoardMeasureDustProject\BoardMeasureDustV2\favicon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]
; 创建程序目录下的子文件夹
;Name: "{app}\Resources"
Name: "D:\project\company\BoardMeasureDustProject\CapturePictureSave"

[Files]
Source: "D:\packInstallTest\BoardMeasureDust\BoardMeasureDustV2.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\packInstallTest\BoardMeasureDust\other\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”
; 将源目录下的所有文件复制到目标目录
Source: "D:\project\company\BoardMeasureDustProject\runTimeNeed\*"; DestDir: "D:\project\company\BoardMeasureDustProject\runTimeNeed"; Flags: ignoreversion recursesubdirs createallsubdirs
; 添加图标文件
Source: "D:\project\company\BoardMeasureDustProject\BoardMeasureDustV2\favicon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\favicon.ico"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\favicon.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

