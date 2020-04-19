unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BtnCopy: TButton;
    DropBg: TComboBox;
    DropText: TComboBox;
    TxtLebar: TEdit;
    TxtTinggi: TEdit;
    TxtText: TEdit;
    TxtHasil: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnCopyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  BtnCopy.Enabled:=false;
  TxtLebar.Caption := '100';
  TxtTinggi.Caption := '0';
  TxtText.Caption := '';
  TxtHasil.Caption := '';
  DropBg.ItemIndex:= 0;
  DropText.ItemIndex:= 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  teks, dimensi, warna, warnabg, warnateks : string;
begin
  BtnCopy.Enabled:=true;
  // pengerjaan lebar dan tinggi
  if TxtTinggi.Caption='0' then
  begin
    dimensi := TxtLebar.Caption;
  end
  else
  begin
    dimensi := TxtLebar.Caption + 'x' + TxtTinggi.Caption;
  end;

  // background color
  case DropBg.ItemIndex of
       1 : warna := 'FFFFFF'; // white
       2 : warna := '000000'; // black
       3 : warna := 'FF0000'; // red
       4 : warna := 'FFFF00'; // yellow
       5 : warna := '008000'; // green
       6 : warna := '0000FF'; // blue
  end;

  if DropBg.ItemIndex <> 0 then
  begin
    warnabg := '/' + warna;
  end
  else
  begin
    warnabg := '';
  end;

  // teks
  if TxtText.Caption <> '' then
  begin
    teks := StringReplace(TxtText.Caption, ' ', '+',
                          [rfReplaceAll, rfIgnoreCase]);
    teks := '?text=' + teks;
  end
  else
  begin
    teks := '';
  end;

  // text color
  case DropText.ItemIndex of
       1 : warna := 'FFFFFF'; // white
       2 : warna := '000000'; // black
       3 : warna := 'FF0000'; // red
       4 : warna := 'FFFF00'; // yellow
       5 : warna := '008000'; // green
       6 : warna := '0000FF'; // blue
  end;

  if DropText.ItemIndex <> 0 then
  begin
    warnateks := '/' + warna;
  end
  else
  begin
    warnateks := '';
  end;

  // hasil
  TxtHasil.Caption:= 'https://via.placeholder.com/' + dimensi + warnabg + warnateks + teks;
end;

procedure TForm1.BtnCopyClick(Sender: TObject);
begin
  TxtHasil.SelectAll;
  TxtHasil.CopyToClipboard;
  ShowMessage('Copied to clipboard');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  TxtLebar.SetFocus;
  TxtHasil.Clear;
  BtnCopy.Enabled:=false;
end;

end.

