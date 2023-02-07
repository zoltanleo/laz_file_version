unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls
  , fileinfo
  ;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  info:TFileVersionInfo;
begin
  memo1.clear;
  info := TFileVersionInfo.Create(nil);
  info.fileName:= Application.ExeName;
  info.ReadFileInfo;
  //showmessage(info.VersionStrings.Text);  // muestra toda la info
  memo1.lines.add('CompanyName: '+info.VersionStrings.Values['CompanyName']);
  memo1.lines.add('FileDescription: '+info.VersionStrings.Values['FileDescription']);
  memo1.lines.add('FileVersion: '+info.VersionStrings.Values['FileVersion']);
  memo1.lines.add('InternalName: '+info.VersionStrings.Values['InternalName']);
  memo1.lines.add('LegalCopyright: '+info.VersionStrings.Values['LegalCopyright']);
  memo1.lines.add('OriginalFilename: '+info.VersionStrings.Values['OriginalFilename']);
  memo1.lines.add('ProductName: '+info.VersionStrings.Values['ProductName']);
  memo1.lines.add('ProductVersion: '+info.VersionStrings.Values['ProductVersion']);
  info.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  info:TFileVersionInfo;
begin
  try
    info:= TFileVersionInfo.Create(Application);
    info.fileName:= Application.ExeName;
    info.ReadFileInfo;
    Self.Caption:= Format('%s v.%s',
    [info.VersionStrings.Values['ProductName'],info.VersionStrings.Values['ProductVersion']]);
  finally
    FreeAndNil(info);
  end;
end;

end.

