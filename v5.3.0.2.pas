
# Based on GAppProxy 2.0.0 by Du XiaoGang <dugang.2008@gmail.com>
# Based on WallProxy 0.4.0 by Hust Moon <www.ehust@gmail.com>
# Contributor:
#      Phus Lu           <phus.lu@gmail.com>
#      Hewig Xu          <hewigovens@gmail.com>
#      Ayanamist Yang    <ayanamist@gmail.com>
#      V.E.O             <V.E.O@tom.com>
#      Max Lv            <max.c.lv@gmail.com>
#      AlsoTang          <alsotang@gmail.com>
#      Christopher Meng  <i@cicku.me>
#      Yonsm Guo         <YonsmGuo@gmail.com>
#      Parkman           <cseparkman@gmail.com>
#      Ming Bai          <mbbill@gmail.com>
#      Bin Yu            <yubinlove1991@gmail.com>
#      lileixuan         <lileixuan@gmail.com>
#      Cong Ding         <cong@cding.org>
#      Zhang Youfu       <zhangyoufu@gmail.com>
#      Lu Wei            <luwei@barfoo>
#      Harmony Meow      <harmony.meow@gmail.com>
#      logostream        <logostream@gmail.com>
#      Rui Wang          <isnowfy@gmail.com>
#      Wang Wei Qiang    <wwqgtxx@gmail.com>
#      Felix Yan         <felixonmars@gmail.com>
#      Sui Feng          <suifeng.me@qq.com>
#      QXO               <qxodream@gmail.com>
#      Geek An           <geekan@foxmail.com>
#      Poly Rabbit       <mcx_221@foxmail.com>
#      oxnz              <yunxinyi@gmail.com>
#      Shusen Liu        <liushusen.smart@gmail.com>
#      Yad Smood         <y.s.inside@gmail.com>
#      Chen Shuang       <cs0x7f@gmail.com>
#      cnfuyu            <cnfuyu@gmail.com>
#      cuixin            <steven.cuixin@gmail.com>
#      s2marine0         <s2marine0@gmail.com>
#      Toshio Xiang      <snachx@gmail.com>
#      Bo Tian           <dxmtb@163.com>
#      Virgil            <variousvirgil@gmail.com>
#      hub01             <miaojiabumiao@yeah.net>
#      v3aqb             <sgzz.cj@gmail.com>
#      Oling Cat         <olingcat@gmail.com>
#      Meng Zhuo         <mengzhuo1203@gmail.com>
#      zwhfly            <zwhfly@163.com>
#      Hubertzhang       <hubert.zyk@gmail.com>
#      arrix             <arrixzhou@gmail.com>
unit Unit1;

interface
//         枫叶香蕉v5X系列 源码 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

  Dialogs, TLhelp32, shellapi, StdCtrls, Types, ShlObj, ActiveX, ComObj,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls, Registry,
  Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils, Wininet, StrUtils, MPlayer,
  mmsystem, ToolWin, IniFiles, System.Zip, Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg, IdHashSHA, Typinfo,
  Vcl.ImgList;
const
  protect = 'C:\windows\kylin-proxy\proxy.ini';
type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    WebBrowser1: TWebBrowser;
    Timer1: TTimer;
    N15: TMenuItem;
    N9: TMenuItem;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    Timer2: TTimer;
    BalloonHint1: TBalloonHint;
    N5: TMenuItem;
    N8: TMenuItem;
    Timer3: TTimer;
    Image1: TImage;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseEnter(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N11DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N7DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N6DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N14DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure onionDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N13Click(Sender: TObject);
    procedure N12DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N18DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N19DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N20DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N21DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure O1Click(Sender: TObject);
    procedure DNS2Click(Sender: TObject);
    procedure DNS1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure O1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure DNS2DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N26Click(Sender: TObject);
    procedure ASDL1Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N26DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure ASDL1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N27DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure FormShow(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure RC41Click(Sender: TObject);
    procedure aes256cfb1Click(Sender: TObject);
    procedure bfcfb1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    procedure SysCommand(var SysMsg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }
  end;
function SetLayeredWindowAttributes(hwnd: HWND; crKey: Longint; bAlpha: byte;
  dwFlags: longint): longint; stdcall; external user32; //函数声明
var
  Form1: TForm1;
  ee1, filename1: string;               // 控制火狐浏览器启动
  slist: TStringList;                   //存储文本文件内容
  pstrarray: array of string;           //数组
  i, icount: integer;
  mytitle, mytext: string;
  createini: TiniFile;                  //------------
  p, dynamic, ini, pp, newday: integer;
  delappid, aa, c, d, self1, strHideFile, strdec: string;
  ai, strfox, strgo, Temfox, Temgo: string;
  icondata: tnotifyicondata;
  myinifile, myinifile1: Tinifile;
  e, b: string;
  vi, a, ComA, ComB: integer;
  filename: string;
  MyStream: TMemIniFile;
  //--------------
  Reg: TRegistry;
  proxya: string;                       //智能代理全局申明
  SEX: integer;
  info: INTERNET_PROXY_INFO;
  StrEncrypt, StrEncrypt1: string;
  protectFile: TFileStream;
  buffer: array[0..86] of Byte = ($46, $00, $00, $00, $01, $00, $00, $00, $05,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $00,
    $68, $74, $74, $70, $3A, $2F, $2F, $31, $32, $37, $2E, $30, $2E, $30, $2E,
    $31, $3A, $38, $30, $38, $36, $2F, $70, $72, $6F, $78, $79, $2E, $70, $61,
    $63, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00);
  buffer1: array[0..86] of Byte = ($46, $00, $00, $00, $02, $00, $00, $00, $01,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1F, $00, $00, $00,
    $68, $74, $74, $70, $3A, $2F, $2F, $31, $32, $37, $2E, $30, $2E, $30, $2E,
    $31, $3A, $38, $30, $38, $36, $2F, $70, $72, $6F, $78, $79, $2E, $70, $61,
    $63, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00);
  buffer2: array[0..107] of Byte = ($46, $00, $00, $00, $03, $00, $00, $00, $03,
    $00, $00, $00, $0E, $00, $00, $00, $31, $32, $37, $2E, $30, $2E, $30, $2E,
    $31, $3A, $38, $30, $38, $37, $07, $00, $00, $00, $3C, $6C, $6F, $63, $61,
    $6C, $3E, $1F, $00, $00, $00, $68, $74, $74, $70, $3A, $2F, $2F, $31, $32,
    $37, $2E, $30, $2E, $30, $2E, $31, $3A, $38, $30, $38, $36, $2F, $70, $72,
    $6F, $78, $79, $2E, $70, $61, $63, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00);
  StrShaKylin, StrShaFirefox: string;
  Strfirefox, Strfirefox1: string;
  StrCountry: string;
  StrUpdate: string;
  Strkylinpath: string;
  StrMyPath: string;
  StrGetVolumeID: string;
  StrEncryption: string;
  StrEncryptionGet: string;
function GetFile_SHA1(const iFileName: string): string; // 获取文件SHA1
implementation

{$R *.dfm}

uses Unit2;
{$R hack.res}

function GetVolumeID: string;
var
  vVolumeNameBuffer: array[0..255] of Char;
  vVolumeSerialNumber: DWORD;
  vMaximumComponentLength: DWORD;
  vFileSystemFlags: DWORD;
  vFileSystemNameBuffer: array[0..255] of Char;
begin
  if GetVolumeInformation('c:\', vVolumeNameBuffer, SizeOf(vVolumeNameBuffer),
    @vVolumeSerialNumber, vMaximumComponentLength, vFileSystemFlags,
    vFileSystemNameBuffer, SizeOf(vFileSystemNameBuffer)) then
  begin
    Result := IntToHex(vVolumeSerialNumber, 8);
  end;
end;

{自动适应屏幕 ---开始}

function DayOfWeek(const DateTime: TDateTime): Word;  //判断星期几,偶数升级，基数sleep
begin
  Result := DateTimeToTimeStamp(DateTime).Date mod 7 + 1;
end;

function PropertyExists(const AObject: TObject; const APropName: string):
  Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  Result := Assigned(PropInfo);
end;

function GetObjectProperty(
  const AObject: TObject;
  const APropName: string
  ): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := GetPropInfo(AObject.ClassInfo, APropName);
  if Assigned(PropInfo) and
    (PropInfo^.PropType^.Kind = tkClass) then
    Result := GetObjectProp(AObject, PropInfo);
end;

procedure FitDeviceResolution(Sender: TForm);
const
  OriWidth = 1280;
  OriHeight = 800;
var
  i: Integer;
  j: Integer;
  LocAnchors: array of TAnchors;
  LocAlign: array of TAlign;
  LocList: TList;
  LocFontSize: Integer;
  LocFont: TFont;
  LocCmp: TComponent;
  ScrResolutionRateH, ScrResolutionRateW, LocFontRate: Double;
begin
  ScrResolutionRateH := Screen.Height / OriHeight;
  ScrResolutionRateW := Screen.Width / OriWidth;
  if Abs(ScrResolutionRateH - 1) < Abs(ScrResolutionRateW - 1) then
    LocFontRate := ScrResolutionRateH
  else
    LocFontRate := ScrResolutionRateW;
  LocList := TList.Create;
  try
    try
      if (screen.width <> OriWidth) or (screen.Height <> OriHeight) then
      begin
        Sender.Scaled := False;
        for i := Sender.ComponentCount - 1 downto 0 do
        begin
          LocCmp := Sender.Components[i];
          if LocCmp is TControl then
            LocList.Add(LocCmp);
          if PropertyExists(LocCmp, 'FONT') then
          begin
            LocFont := TFont(GetObjectProperty(LocCmp, 'FONT'));
            LocFontSize := Round(LocFontRate * LocFont.Size);
            LocFont.Size := LocFontSize;
          end;
        end;
        SetLength(LocAnchors, LocList.Count);
        SetLength(LocAlign, LocList.Count);
        for i := 0 to LocList.Count - 1 do
          with TControl(LocList.Items[i]) do
          begin
            LocAnchors[i] := Anchors;
            LocAlign[i] := Align;
            Align := alNone;
            Anchors := [akLeft, akTop];
          end;
        Sender.Top := Round(Sender.Top * ScrResolutionRateH);
        Sender.Left := Round(Sender.Left * ScrResolutionRateW);
        Sender.Height := Round(Sender.Height * ScrResolutionRateH);
        Sender.Width := Round(Sender.Width * ScrResolutionRateW);
        Sender.Font.size := Round(LocFontRate * Sender.Font.size);
        for i := 0 to LocList.Count - 1 do
        begin
          with TControl(LocList.Items[i]) do
          begin
            Top := Round(Top * ScrResolutionRateH);
            Left := Round(Left * ScrResolutionRateW);
            Height := Round(height * ScrResolutionRateH);
            Width := Round(width * ScrResolutionRateW);
          end;
        end;
        for i := 0 to LocList.Count - 1 do
          TControl(LocList.Items[i]).Align := LocAlign[i];
        for i := 0 to LocList.Count - 1 do
          TControl(LocList.Items[i]).Anchors := LocAnchors[i];
      end;
    except
      MessageDlg(LocCMP.Name, mtInformation, [mbOK], 0);
    end;
  finally
    LocList.Free;
  end;
end;
{自动适应屏幕 ---结束}

function GetFile_SHA1(const iFileName: string): string;  //Checksum hash value for firefox

var
  SHA1: TIdHashSHA1;
  fileStream: TMemoryStream;
begin
  SHA1 := TIdHashSHA1.Create;
  fileStream := TMemoryStream.Create;
  try
    fileStream.LoadFromFile(iFileName);
    Result := SHA1.HashStreamAsHex(fileStream);
  finally
    fileStream.Free;
    SHA1.Free;
  end;
end;

function ADSLsetupTOCANCEL(const bEnabled: boolean = True): boolean;
var
  hKey1: HKEY;
  i: integer;
  retCode, size: Cardinal;
  Key, Value: array[0..255] of char;
  strkey: string;
begin
  Result := False;
  Reg := TRegistry.Create;
  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0,
    KEY_READ, hKey1);
  i := 0;
  repeat
    size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      reg := tregistry.Create;
      reg.RootKey := HKEY_CURRENT_USER;
      REG.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections', true);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      size := 1024;
      strkey := string(key);
      Reg.WriteBinaryData(strkey, buffer1[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  // showmessage('拨号取消成功！') ;
  sleep(50);
  Result := True;
  reg.CloseKey;
  reg.free;
end;

function ADSLsetupglobal(const bEnabled: boolean = True): boolean;  //setup global  Mode  for adsl
var
  hKey1: HKEY;
  i: integer;
  retCode, size: Cardinal;
  Key, Value: array[0..255] of char;
  strkey: string;
begin

  Result := False;
  Reg := TRegistry.Create;

  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0,
    KEY_READ, hKey1);
  i := 0;
  repeat
    size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      reg := tregistry.Create;
      reg.RootKey := HKEY_CURRENT_USER;
      REG.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections', true);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      size := 1024;
      strkey := string(key);
      Reg.WriteBinaryData(strkey, buffer2[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  //showmessage('拨号设置成功！') ;
  SLEEP(50);
  Result := True;

  reg.CloseKey;
  reg.free;
end;

function ADSLsetup(const bEnabled: boolean = True): boolean;  //setup smart Mode at adsl
var
  hKey1: HKEY;
  i: integer;
  retCode, size: Cardinal;
  Key, Value: array[0..255] of char;
  strkey: string;
begin

  Result := False;
  Reg := TRegistry.Create;

  RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections',
    0,
    KEY_READ, hKey1);
  i := 0;
  repeat
    size := 1024;
    retCode := RegEnumValue(hKey1, i, Key, size, nil, nil, nil, nil);
    if retCode = ERROR_SUCCESS then
    begin
      reg := tregistry.Create;
      reg.RootKey := HKEY_CURRENT_USER;
      REG.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections', true);
      i := i + 1;
      // Memo1.Lines.Add(Key);
      size := 1024;
      strkey := string(key);
      Reg.WriteBinaryData(strkey, buffer[0], Length(buffer));
    end;
  until (retCode <> ERROR_SUCCESS);
  RegCloseKey(hKey1);
  //showmessage('拨号设置成功！') ;
  SLEEP(50);
  Result := True;

  reg.CloseKey;
  reg.free;
end;

function StrPosCount(subs: string; source: string): integer;  //统计字符串出现的次数
var
  Str: string;
begin
  Result := 0;
  str := source;
  while Pos(Subs, Str) <> 0 do
  begin
    Delete(Str, Pos(Subs, Str), Length(Subs));
    Inc(Result);
  end;
end;

{===============================================================================

函数名:    Rc4_StrEncrypt()
描  述:    RC4 Based string encryption
参  数:   i_Encrypt ——为 1 是加密, 0 是解密（integer类型）；
        s_EncryptText ——待加密（解密）的字符串（string类型）；
        s_EncryptPassword ——加密（解密）的密码（string类型）；
        i_EncryptLevel ——加密级别（范围：1－－10；integer类型））

翻译:        吴间道
QQ:           93331961
=============================================================================== }

function Rc4(i_Encrypt: integer; s_EncryptText,
  s_EncryptPassword: string; i_EncryptLevel: integer = 1): string;
var
  v_EncryptModified, v_EncryptCipher, v_EncryptCipherBy: string;
  i_EncryptCountA, i_EncryptCountB, i_EncryptCountC, i_EncryptCountD,
    i_EncryptCountE, i_EncryptCountF, i_EncryptCountG, i_EncryptCountH,
    v_EncryptSwap: integer;
  av_EncryptBox: array[0..256, 0..2] of integer;

begin
  if (i_Encrypt <> 0) and (i_Encrypt <> 1) then
  begin
    result := '';
  end
  else if (s_EncryptText = '') or (s_EncryptPassword = '') then
  begin
    result := '';
  end
  else
  begin
    if (i_EncryptLevel <= 0) or (Int(i_EncryptLevel) <> i_EncryptLevel) then
      i_EncryptLevel := 1;
    if Int(i_EncryptLevel) > 10 then i_EncryptLevel := 10;
    if i_Encrypt = 1 then
    begin
      for i_EncryptCountF := 0 to i_EncryptLevel do
      begin
        i_EncryptCountG := 0;
        i_EncryptCountH := 0;
        v_EncryptModified := '';
        for i_EncryptCountG := 1 to Length(s_EncryptText) do
        begin
          if i_EncryptCountH = Length(s_EncryptPassword) then
          begin
            i_EncryptCountH := 1;
          end
          else
          begin
            inc(i_EncryptCountH);
          end;
          v_EncryptModified := v_EncryptModified +
            Chr(Ord(s_EncryptText[i_EncryptCountG]) xor
            Ord(s_EncryptPassword[i_EncryptCountH]) xor 255);
        end;
        s_EncryptText := v_EncryptModified;
        i_EncryptCountA := 0;
        i_EncryptCountB := 0;
        i_EncryptCountC := 0;
        i_EncryptCountD := 0;
        i_EncryptCountE := 0;
        v_EncryptCipherBy := '';
        v_EncryptCipher := '';
        v_EncryptSwap := 0;
        for i_EncryptCountA := 0 to 255 do
        begin
          av_EncryptBox[i_EncryptCountA, 1] :=
            Ord(s_EncryptPassword[i_EncryptCountA mod Length(s_EncryptPassword)
            +
              1]);
          av_EncryptBox[i_EncryptCountA, 0] := i_EncryptCountA;
        end;
        for i_EncryptCountA := 0 to 255 do
        begin
          i_EncryptCountB := (i_EncryptCountB + av_EncryptBox[i_EncryptCountA][0]
            + av_EncryptBox[i_EncryptCountA][1]) mod 256;
          v_EncryptSwap := av_EncryptBox[i_EncryptCountA][0];
          av_EncryptBox[i_EncryptCountA][0] :=
            av_EncryptBox[i_EncryptCountB][0];
          av_EncryptBox[i_EncryptCountB][0] := v_EncryptSwap;
        end;
        for i_EncryptCountA := 1 to Length(s_EncryptText) do
        begin
          i_EncryptCountC := (i_EncryptCountC + 1) mod 256;
          i_EncryptCountD := (i_EncryptCountD +
            av_EncryptBox[i_EncryptCountC][0]) mod 256;
          i_EncryptCountE := av_EncryptBox[(av_EncryptBox[i_EncryptCountC][0] +
            av_EncryptBox[i_EncryptCountD][0]) mod 256][0];
          v_EncryptCipherBy := inttostr(Ord(s_EncryptText[i_EncryptCountA]) xor
            i_EncryptCountE);
          v_EncryptCipher := v_EncryptCipher +
            IntToHex(strtoint(v_EncryptCipherBy), 2);

        end;
        s_EncryptText := v_EncryptCipher;
      end;

    end
    else
    begin
      for i_EncryptCountF := 0 to i_EncryptLevel do
      begin
        i_EncryptCountB := 0;
        i_EncryptCountC := 0;
        i_EncryptCountD := 0;
        i_EncryptCountE := 0;
        v_EncryptCipherBy := '';
        v_EncryptCipher := '';
        v_EncryptSwap := 0;
        for i_EncryptCountA := 0 to 255 do
        begin
          av_EncryptBox[i_EncryptCountA, 1] :=
            Ord(s_EncryptPassword[i_EncryptCountA mod Length(s_EncryptPassword)
            +
              1]);
          av_EncryptBox[i_EncryptCountA, 0] := i_EncryptCountA;
        end;
        for i_EncryptCountA := 0 to 255 do
        begin
          i_EncryptCountB := (i_EncryptCountB + av_EncryptBox[i_EncryptCountA, 0]
            + av_EncryptBox[i_EncryptCountA, 1]) mod 256;
          v_EncryptSwap := av_EncryptBox[i_EncryptCountA, 0];
          av_EncryptBox[i_EncryptCountA, 0] := av_EncryptBox[i_EncryptCountB,
            0];
          av_EncryptBox[i_EncryptCountB, 0] := v_EncryptSwap;
        end;
        for i_EncryptCountA := 1 to Length(s_EncryptText) do
        begin
          if (i_EncryptCountA mod 2) <> 0 then
          begin
            i_EncryptCountC := ((i_EncryptCountC + 1) mod 256);
            i_EncryptCountD := ((i_EncryptCountD +
              av_EncryptBox[i_EncryptCountC, 0]) mod 256);
            i_EncryptCountE := av_EncryptBox[((av_EncryptBox[i_EncryptCountC, 0]
              + av_EncryptBox[i_EncryptCountD, 0]) mod 256), 0];
            v_EncryptCipherBy := inttostr(StrToInt64('$' +
              s_EncryptText[i_EncryptCountA] + s_EncryptText[i_EncryptCountA +
              1])
                xor i_EncryptCountE);
            v_EncryptCipher := v_EncryptCipher +
              Chr(strtoint(v_EncryptCipherBy));
          end;
        end;
        s_EncryptText := v_EncryptCipher;
        i_EncryptCountG := 0;
        i_EncryptCountH := 0;
        v_EncryptModified := '';
        for i_EncryptCountG := 1 to Length(s_EncryptText) do
        begin
          if i_EncryptCountH = Length(s_EncryptPassword) then
          begin
            i_EncryptCountH := 1;
          end
          else
          begin
            i_EncryptCountH := i_EncryptCountH + 1;
          end;
          v_EncryptModified := v_EncryptModified +
            Chr((Ord(s_EncryptText[i_EncryptCountG]) xor
            Ord(s_EncryptPassword[i_EncryptCountH]) xor 255));
        end;
        s_EncryptText := v_EncryptModified;
      end;
    end;
    result := s_EncryptText;
  end;
end;

function DeleteDirectory(NowPath: string): Boolean; // 删除整个目录
var
  search: TSearchRec;
  ret: integer;
  key: string;
begin
  if NowPath[Length(NowPath)] <> '\' then
    NowPath := NowPath + '\';
  key := NowPath + '*.*';
  ret := findFirst(key, faanyfile, search);
  while ret = 0 do
  begin
    if ((search.Attr and fadirectory) = fadirectory) then
    begin
      if (search.Name <> '.') and (search.name <> '..') then
        DeleteDirectory(NowPath + search.name);
    end
    else
    begin
      if ((search.Attr and fadirectory) <> fadirectory) then
      begin
        deletefile(NowPath + search.name);
      end;
    end;
    ret := FindNext(search);
  end;
  findClose(search);
  removedir(NowPath);
  result := True;
end;

procedure TForm1.SysCommand(var SysMsg: TMessage); //最小化 隐藏到 托盘
begin
  case SysMsg.WParam of
    SC_CLOSE:
      begin
        // 当最小化时
        SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_HIDEWINDOW);
        form1.hide;                     // 在任务栏隐藏程序
      end;

  else
    inherited;
    case SysMsg.WParam of
      SC_MINIMIZE:
        begin
          // 当最小化时
          SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
            SWP_HIDEWINDOW);
          form1.hide;                   // 在任务栏隐藏程序
        end;
    else
      inherited;

    end;
  end;
end;

function certDisabledProxyEnable(const key: boolean = True): boolean;  //取消证书警告
var
  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if
      Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings',
      false) then
    begin
      Reg.WriteInteger('WarnonBadCertRecving', integer(key));
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      Reg.CloseKey;
    end;
  except
    Reg.Free;
  end;
end;
//------------------------------------------------  取消证书警告

procedure cryptFile(srcFile, dstFile: TFilename); //加密函数
var
  srcf, dstf: file of byte;
  buf: byte;
begin
  assign(srcf, srcfile);
  assign(dstf, dstfile);
  reset(srcf);
  rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf, buf);
    buf := buf + 21;                    //这里可以修改成其他的数值
    write(dstf, buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

procedure decryptFile(srcFile, dstFile: TFilename); //解密函数
var
  srcf, dstf: file of byte;
  buf: byte;
begin
  assign(srcf, srcfile);
  assign(dstf, dstfile);
  reset(srcf);
  rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf, buf);
    buf := buf - 21;                    //这里可以作相应修改
    write(dstf, buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

function CreateShortcut(Exe: string; Lnk: string = ''; Dir: string = ''; ID:
  Integer = -1): Boolean;
var
  IObj: IUnknown;
  ILnk: IShellLink;
  IPFile: IPersistFile;
  PIDL: PItemIDList;
  InFolder: array[0..MAX_PATH] of Char;
  LinkFileName: WideString;
begin
  Result := False;
  if not FileExists(Exe) then Exit;
  if Lnk = '' then Lnk := ChangeFileExt(ExtractFileName(Exe), '');

  IObj := CreateComObject(CLSID_ShellLink);
  ILnk := IObj as IShellLink;
  ILnk.SetPath(PChar(Exe));
  ILnk.SetWorkingDirectory(PChar(ExtractFilePath(Exe)));

  if (Dir = '') and (ID = -1) then ID := CSIDL_DESKTOP;
  if ID > -1 then
  begin
    SHGetSpecialFolderLocation(0, ID, PIDL);
    SHGetPathFromIDList(PIDL, InFolder);
    LinkFileName := Format('%s\%s.lnk', [InFolder, Lnk]);
  end
  else
  begin
    Dir := ExcludeTrailingPathDelimiter(Dir);
    if not DirectoryExists(Dir) then Exit;
    LinkFileName := Format('%s\%s.lnk', [Dir, Lnk]);
  end;

  IPFile := IObj as IPersistFile;
  if IPFile.Save(PWideChar(LinkFileName), False) = 0 then Result := True;
end;                                    {CreateShortcut 函数结束}
//-----------------------------------------------------

procedure ExtractRes(ResType, ResName, ResNewName: string);
var
  Res: TResourceStream;
begin                                   //释放资源文件library.ini
  Res := TResourceStream.Create(Hinstance, Resname, Pchar(ResType));
  Res.SavetoFile(ResNewName);
  Res.Free;
end;                                    //这个方法意思是释放资源文件   有三个参数
//一个资源类型   2 资源名字   生成资源的名字

//----------------------------------------------------

procedure RefreshControl(Control: TControl);  ///解决 托盘重现显示窗体控件 无法重画的问题
var
  i: integer;
begin
  Control.Invalidate;
  if Control is TWinControl then
    for i := 0 to TWinControl(Control).ControlCount - 1 do
      RefreshControl(TWinControl(Control).Controls[i]);
end;
//----------------------------------------------------------

function FindProcess(AFileName: string): boolean;
var
  hSnapshot: THandle;                   //用于获得进程列表
  lppe: TProcessEntry32;                //用于查找进程
  Found: Boolean;                       //用于判断进程遍历是否完成
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);  //获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32);  //在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe);  //将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(AFileName)) or
      (UpperCase(lppe.szExeFile) = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe);  //将进程列表的下一个进程信息读入lppe记录中
  end;
end;
//----------------------------------------------------------------------------------------------------------

function CheckTask(ExeFileName: string): Boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      result := True;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
end;

function KillTask(ExeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOLean;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
        OpenProcess(PROCESS_TERMINATE,
        BOOL(0),
        FProcessEntry32.th32ProcessID),
        0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
//-----------------------------------------------------------------------------

function ChangeProxy(const Proxy, Port, ByPass: string; const bEnabled: boolean
  = True): boolean;
var
  reg: TreGIStry;
  info: INTERNET_PROXY_INFO;
  Fproxy: string;
begin
  Result := False;
  FProxy := Format('%s:%s', [Proxy, Port]);
  reg := TreGIStry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if
      reg.OpenKey('\Software\Microsoft\windows\CurrentVersion\Internet Settings',
      True) then
    begin
      reg.Writestring('ProxyServer', Fproxy);
      reg.WriteInteger('ProxyEnable', integer(bEnabled));
      info.dwaccessType := INTERNET_OPEN_TYPE_PROXY;
      info.lpszProxy := PAnsiChar(proxy);
      info.lpszProxyBypass := PAnsiChar(ByPass);
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      // InternetSetOption(nil, INTERNET_OPTION_REFRESH, nil, 0);
      // Sendmessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
      Result := True;
    end
  finally
    reg.CloseKey;
    reg.free;
  end;
end;
//-----------------------------------------------------------------------------

function dDisabledProxyEnable(const key: boolean = True): boolean; //取消代理
var

  Reg: TRegistry;
  info: INTERNET_PROXY_INFO;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if
      Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings',
      false) then
    begin

      Reg.WriteInteger('ProxyEnable', integer(key));
      InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
      InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      Reg.CloseKey;
    end;
  except
    Reg.Free;
  end;
end;
//------------------------------------------------  ChangeProxy  智能代理模式，写注册表
         //const Proxy, Port,ByPass: string;

function ChangeProxy1(const bEnabled: boolean = True): boolean;
var
  reg: TreGIStry;
  info: INTERNET_PROXY_INFO;
  Fproxy: string;
  Reg1: TRegistry;
begin

  Result := False;
  FProxy := 'http://127.0.0.1:8086/proxy.pac';
  reg := TreGIStry.Create;
  //判断 键值 是否创建！
  Reg1 := TRegistry.Create;
  Reg1.RootKey := HKEY_CURRENT_USER;
  Reg1.OpenKeyReadOnly('\Software\Microsoft\windows\CurrentVersion\Internet Settings');
  if not Reg1.ValueExists('AutoConfigURL') then
  begin
    try
      begin
        reg.RootKey := HKEY_CURRENT_USER;
        if
          reg.OpenKey('\Software\Microsoft\windows\CurrentVersion\Internet Settings', true) then

          reg.Writestring('AutoConfigURL', Fproxy);
        InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
        InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
        Result := True;
      end
    finally
      reg.CloseKey;
      reg.free;
    end;

  end
  else
  begin
    //showmessage('智能模式已经创建,请勿重复操作！');
    sleep(50);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  wnd: integer;
  strCheck: string;
  hi, comdate: integer;
begin
  if FindProcess('kylinagent.exe') then
  begin
    TrayIcon1.BalloonTitle := '香蕉提示';
    TrayIcon1.BalloonHint := '枫叶香蕉正常运行！开始你的翻墙之旅';
    TrayIcon1.ShowBalloonHint;
    form2.Timer1.Enabled := true;
    Form2.Top := (Screen.Height - Form2.Height) div 2;
    Form2.Left := (Screen.Width - Form2.Width) div 2;
    form2.show;

    //----------------------------------------------------------                  解决 ie  和chrome 证书问题
              //deletefile('C:\windows\kylin-proxy\proxy.ini');
            //  deletefile('C:\windows\Library1.ini');
             //sleep(2000);

    timer1.Enabled := false;

    n4.Enabled := TRUE;

  end
  else
  begin
    // protectFile.Free;

    n4.Enabled := TRUE;
  end;
  timer1.Enabled := false;

  StrUpdate := Strkylinpath;

  //choose  a  date update file from github server
{   form1.WebBrowser1.Navigate('www.BAIDU.COM');
  sleep(2000);
        if DayOfWeek(Now)=1 then     //Sunday
begin
ShellExecute(0, nil, 'update.exe', nil, PChar(StrUpdate), SW_SHOWNORMAL);
end;   }

end;


procedure TForm1.Timer3Timer(Sender: TObject);
begin
  //form3.Show;
  //form3.Timer1.Enabled:=true;
  //timer3.Enabled:=false;

end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  form1.Show;
end;

procedure TForm1.ASDL1Click(Sender: TObject);

var
  filename: string;
begin
  // protectfile.Free;
  filename := 'C:\WINDOWS\kylin-proxy\proxy.ini';
  myinifile := Tinifile.Create(filename);
  myinifile.writestring('autorange', 'threads', '6');
  //myinifile.writestring('iplist','google_hk','61.219.131.84|61.219.131.83|61.219.131.85|61.219.131.86|61.219.131.87|61.219.131.88');
  myinifile.destroy;
  //--------------
//  protectFile:=TFileStream.Create(protect,fmShareExclusive);
end;


procedure TForm1.FormCreate(Sender: TObject);
//------------------------------------------------------
var

  mytitle, mytext, xpx, Music: string;
  ee: string;
  vi, ComA, ComB: integer;
  oldtitle: string;
  SEX: INTEGER;
  Reg: TRegistry;
  a, ai: string;
  info: INTERNET_PROXY_INFO;
  re_id: integer;
  registerTemp: TRegistry;
  inputstr, get_id: string;
  dy, clickedok: boolean;
  zip: TZipFile;
  //--------------
  strcopysource, strcopyobject: string;
  intcopy, intcopy1: integer;           //    火狐证书申明
  dir: TDirectory;
  files: TStringDynArray;               //需要 Types 单元支持
  str: string;
  //--------------------
  hr: thandle;
  l: longint;                           //窗体透明申明
  　　strrich, strCheck: string;
  ARegistry: TRegistry;
  TOM: string;
  　　
begin

  ChangeProxy1(true);                   //设置智能代理
  form1.WebBrowser1.Navigate('www.BAIDU.COM'); //让chrome浏览器立即生效 调用代理
  StrGetVolumeID := GetVolumeID;
  StrEncryption := rc4(1, StrGetVolumeID, 'sheismysin', 4); //
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
    getWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);
  //do net show form in Taskbar

  FitDeviceResolution(Self);            //自动适应屏幕

  // form3.Timer1.Enabled:=true;
  trayicon1.ShowBalloonHint;
  n3.Checked := true;
  certDisabledProxyEnable(false);       // 取消证书警告
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW);  //让启动窗体不显示在任务栏！
  //---------------------------------------------------------------
  l := getWindowLong(Handle, GWL_EXSTYLE);
  l := l or WS_EX_LAYERED;
  SetWindowLong(handle, GWL_EXSTYLE, l);
  SetLayeredWindowAttributes(handle, 0, 255, LWA_ALPHA);
  // hr:=createroundrectrgn(0,0,width,height,20,20);
  setwindowrgn(handle, hr, true);

  Application.ShowMainForm := False;
  self1 := ExtractFileDir(Application.Exename);
  //从资源文件中释放压缩文件
  //----------------------------------------------

    // changeproxy('127.0.0.1','8086','1',true);

  StrMyPath := ExtractFilename(Application.Exename);

  TrayIcon1.Hint := '枫叶香蕉提示' + #13 + '代理模式:智能'#13 + '版本号:V5.3';

  Strkylinpath := GetEnvironmentVariable('APPDATA') + '\maplebanana\';  // 以前一直用这个
  //----------------------------------------------
  if FileExists(Strkylinpath + 'v5302.run') then
  begin
    TrayIcon1.BalloonTitle := '香蕉提示';
    TrayIcon1.BalloonHint := '版本更新成功！';
    TrayIcon1.ShowBalloonHint;
    sleep(50);
    // showmessage(Strkylinpath+'更新成功');
  end
  else
  begin
    // showmessage(Strkylinpath+'正在更新');
    KillTask('firefox.exe');
    KillTask('cmd.exe');
    killtask('update.exe');
    KillTask('kylinagent.exe');
    KillTask('launchAgent.exe');
    //DeleteDir(Strkylinpath);
    DeleteDirectory(Strkylinpath);
    sleep(2000);

    if DirectoryExists(Strkylinpath) then
    begin
      sleep(50)
    end                                 
    else
    begin
      CreateDirectory(PChar(Strkylinpath), nil);

    end;
    //===========================释放压缩文件=============================================
    if FileExists(Strkylinpath + 'kylin.zip') then
    begin
      //ShowMessage(Strkylinpath+'\kylin.zip');

      sleep(50);

    end
    else
    begin
      //ShowMessage('kylin.zip');
      ExtractRes('EXEFILE', 'test', Strkylinpath + 'kylin.zip');  //从资源文件中释放压缩文件
    end;

    if FileExists(Strkylinpath + 'v5302.run') then
    begin
      ShowMessage('解压成功');
      sleep(50);
    end
    else
    begin
      zip := TZipFile.Create;
      zip.Open(Strkylinpath + 'kylin.zip', TZipMode.zmRead);
      zip.ExtractAll(Strkylinpath);
      zip.Free;                         //结束解压

    end;
  end;
  //----------------------------------------------------------   安装ie证书给ie内核的浏览器调用

  ComA := 0;
  ComB := 1;
  Filename := Strkylinpath + 'InstallCrt.ini';
  myinifile := Tinifile.Create(filename);
  vi := myinifile.Readinteger('Certificate', 'run', 0);
  myinifile.destroy;

  if vi = ComB then
  begin
    // ShowMessage('可以安装证书！');
    ee := Strkylinpath;

    ShellExecute(0, nil, 'Install_Certificate.exe', nil, PChar(ee),
      SW_SHOWNORMAL);
    myinifile := Tinifile.Create(filename);
    myinifile.writeinteger('Certificate', 'run', 1);
    myinifile.destroy;
    //----------------------------------------------------------
  end;
  if vi = ComA then
  begin
    //   ShowMessage('无法安装证书！');
    SLEEP(50);
  end;
  //-------------------------------------------------  给火狐安装证书,给其调用
  Strfirefox := GetEnvironmentVariable('APPDATA') + '\Mozilla'; // 以前一直用这个

  if not FileExists(Strfirefox + '\Firefox\profiles.ini') then
  begin
    sleep(50);

  end
  else
  begin

    files := dir.GetFiles(Strfirefox, 'key3.db',
      TSearchOption.soAllDirectories);
    for str in files do
      // memo1.Clear;                     //火狐证书安装
      strcopysource := str;
    intcopy1 := Length('cert8.db');
    intcopy := Length(strcopysource);
    // label1.caption:=str;
    strcopyobject := copy(strcopysource, 1, intcopy - intcopy1);
    //label2.Caption:=strcopyobject;
   // ShowMessage(strcopyobject);
    if not FindProcess('firefox.exe') then
    begin

      StrShaFirefox := GetFile_SHA1(strcopyobject + '\cert8.db');  //get firefox Certificate sha1 values
      StrShaKylin := GetFile_SHA1(Strkylinpath + 'begin\cert8.db');  //get kylin Certificate sha1 values
      if StrShaFirefox <> StrShaKylin then
      begin
        // ShowMessage('sha1不同,正在复制');

        CopyFile(pchar(Strkylinpath + 'begin\cert8.db'), pchar(strcopyobject +
          '\cert8.db'), false);

      end
      else
      begin

        //   ShowMessage('相同sha1！');
        sleep(50);

      end;
    end
    else
    begin
      sleep(50);
      //   ShowMessage('发现火狐在运行,无法复制cert');
    end;

  end;



procedure TForm1.FormHide(Sender: TObject);
begin
  ANimateWindow(Handle, 3000, AW_BLEND + AW_HIDE);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Application.MainFormOnTaskbar := False;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  FORM1.Hide;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0); //移动窗体
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) then
  begin
    ReleaseCapture;
    SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_MOVE + 1, 0);
  end;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssLeft in Shift) then
  begin
    ReleaseCapture;
    SendMessage(Form1.Handle, WM_SYSCOMMAND, SC_MOVE + 1, 0);
  end;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  form1.Hide;
end;

procedure TForm1.Image4MouseEnter(Sender: TObject);
begin
  //image4.Hint:='关闭主界面';
end;

procedure TForm1.Image4MouseLeave(Sender: TObject);
begin
  //image5.Show;
  //image4.Hide;
end;

procedure TForm1.Image5MouseEnter(Sender: TObject);
begin
  //image4.Show;

  //image5.Hide;

end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  Shellexecute(handle, nil, pchar('http://onionhacker.github.com'), nil, nil,
    sw_shownormal);
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  Shellexecute(handle, nil, pchar('https://twitter.com/onionhacker'), nil, nil,
    sw_shownormal);
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
  Shellexecute(handle, nil,
    pchar('https://code.google.com/p/maplebanana-proxy'), nil, nil,
    sw_shownormal);
end;


procedure TForm1.N4Click(Sender: TObject); //-----------------------右键退出
var
  reg: tregistry;
  info: INTERNET_PROXY_INFO;
begin
  ADSLsetupTOCANCEL(true);
  //  protectfile.Free;
  KillTask('cmd.exe');
  killtask('update.exe');
  KillTask('kylinagent.exe');
  KillTask('launchAgent.exe');

  //---------------------------------------------------删除pac
  reg := tregistry.Create;
  reg.rootkey := HKEY_CURRENT_USER;
  reg.openkey('Software\Microsoft\windows\CurrentVersion\Internet Settings',
    true);
  reg.DeleteValue('AutoConfigURL');     //删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  reg.CloseKey;
  reg.Free;
  //  SLEEP(200);
  dDisabledProxyEnable(false);
  //--------------------------------------------------------------
       //Shell_NotifyIcon(NIM_DELETE, @TrayIconData); //删除托盘区图标
  HALT;
  { end;
 IDCANCEL:
      begin
      sleep(50);
   end;
   end  }
end;




procedure TForm1.N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   开机启动'), -1, ARect, DT_LEFT or DT_LEFT
      or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   开机启动'), -1, ARect, DT_LEFT or DT_LEFT
      or DT_SINGLELINE or DT_NOCLIP);
  end;
end;



procedure TForm1.N11DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   取消开机启动   '), -1, ARect, DT_LEFT or
      DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   取消开机启动   '), -1, ARect, DT_LEFT or
      DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  self.HIDE;
end;

procedure TForm1.N12DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;


procedure TForm1.N14DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;





procedure TForm1.N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.N9Click(Sender: TObject);

var
  wnd: integer;
begin
  ShellExecute(Wnd, 'Open',
    Pchar('https://code.google.com/p/maplebanana-agent'), nil, nil, SW_show);

end;


procedure TForm1.O1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar('   OpenDNS   '), -1, ARect, DT_LEFT or
      DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebSnow;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar('   OpenDNS   '), -1, ARect, DT_LEFT or
      DT_LEFT or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TForm1.onionDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;



procedure TForm1.N1Click(Sender: TObject);

begin

  form1.Show;

end;

procedure TForm1.N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;




procedure TForm1.N2Click(Sender: TObject);

var
  vi, a, ComA, ComB: integer;
  reg: tregistry;
  filename: string;
  info: INTERNET_PROXY_INFO;

begin
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '你已经切换到全局模式';
  TrayIcon1.ShowBalloonHint;
  TrayIcon1.Hint := '枫叶香蕉提示' + #13 + '代理模式:全局'#13 +
    '版本号:V5.3.0.1';
  N2.Checked := true;
  N3.Checked := FALSE;
  N15.Checked := FALSE;
  changeproxy('127.0.0.1', '8087', '1', true);
  ADSLsetupglobal(true);
  reg := tregistry.Create;

  reg.rootkey := HKEY_CURRENT_USER;

  reg.openkey('Software\Microsoft\windows\CurrentVersion\Internet Settings',
    true);

  reg.DeleteValue('AutoConfigURL');     //删除注册表项
  InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  reg.CloseKey;

  reg.Free; 

end;

procedure TForm1.N5Click(Sender: TObject);
begin

  form1.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
var
  filename: string;
begin
  // protectfile.Free;
  filename := Strkylinpath + 'proxy.ini';
  myinifile := Tinifile.Create(filename);
  myinifile.writestring('iplist', 'google_hk',
    '103.1.139.72|103.1.139.72|103.1.139.72|103.1.139.72');
  myinifile.destroy;
  // myinifile.destroy;
  TrayIcon1.BalloonTitle := '代理提示';
  TrayIcon1.BalloonHint := '备用线路启动成功';
  TrayIcon1.ShowBalloonHint;

end;

procedure TForm1.N6DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
begin
  if (Selected) then
  begin

    ACanvas.Font.Color := clWhite;
    ACanvas.Brush.Color := clWebDodgerBlue;
    ACanvas.FillRect(ARect);
    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end
  else
  begin
    ACanvas.Font.Color := clblack;

    ACanvas.Brush.Color := clWebHoneydew;
    ACanvas.FillRect(ARect);

    DrawText(ACanvas.Handle, PChar(''), -1, ARect, DT_LEFT or DT_CENTER or
      DT_SINGLELINE or DT_NOCLIP);
  end;
end;




end.
