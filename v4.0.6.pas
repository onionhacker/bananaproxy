  unit Unit1;

interface
//         枫叶香蕉v4系列 源码 date: January 30,2014
uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,

Dialogs,TLhelp32,shellapi, StdCtrls,Types ,ShlObj, ActiveX, ComObj,
Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ComCtrls,Registry, Vcl.OleCtrls, SHDocVw, {该函数使用的单元} IOUtils,Wininet,StrUtils,  MPlayer,
mmsystem, ToolWin,IniFiles, System.Zip, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg,
Vcl.ImgList;
const
 aimDir = 'C:\Documents and Settings\Administrator\Application Data\Mozilla';
 protect='C:\windows\Maple Banana 2014\proxy.ini';
type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    WebBrowser1: TWebBrowser;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N14: TMenuItem;
    Timer1: TTimer;
    N15: TMenuItem;
    N9: TMenuItem;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    Timer2: TTimer;
    N10: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    BalloonHint1: TBalloonHint;
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseEnter(Sender: TObject);
    private
    { Private declarations }
      // procedure   WMNCPaint(var   Msg   :   TWMNCPaint);   message   WM_NCPAINT;
    procedure SysCommand(var SysMsg: TMessage); message WM_SYSCOMMAND;
    public
    { Public declarations }
    end;
    function SetLayeredWindowAttributes(hwnd:HWND; crKey:Longint; bAlpha:byte; dwFlags:longint ):longint; stdcall; external user32;//函数声明
var
   Form1: TForm1;
   ee1, filename1:string;// 控制火狐浏览器启动
   slist:TStringList; //存储文本文件内容
   pstrarray:array of string;   //数组
   i,icount:integer;
   mytitle, mytext:string;
   createini:TiniFile; //------------
   p,dynamic,ini,pp,newday:integer;
   delappid,aa,c,d,self1,strHideFile,strdec:string;
   ai,strfox,strgo,Temfox,Temgo:string;
   icondata: tnotifyicondata;
   myinifile,myinifile1:Tinifile;
   e,b:string;
   vi,a,ComA,ComB:integer;
   filename:string;
   MyStream:TMemIniFile;
//--------------
  Reg:TRegistry;
  proxya:String;                   //智能代理全局申明
  SEX:INTEGER;
  info: INTERNET_PROXY_INFO;
  StrEncrypt,StrEncrypt1:string;
  protectFile:TFileStream;
implementation
   {$R *.dfm}
   {$R hack.res}
   function StrPosCount(subs:string;source:string):integer;   //统计字符串出现的次数
var
 Str : string;
 begin
  Result := 0;
  str := source;
   while Pos(Subs,Str)<>0 do
     begin
       Delete(Str,Pos(Subs,Str),Length(Subs));
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
function Rc4(i_Encrypt:integer; s_EncryptText,
  s_EncryptPassword:string; i_EncryptLevel:integer = 1):string;
var
  v_EncryptModified, v_EncryptCipher, v_EncryptCipherBy:string;
  i_EncryptCountA, i_EncryptCountB, i_EncryptCountC, i_EncryptCountD,
    i_EncryptCountE, i_EncryptCountF, i_EncryptCountG, i_EncryptCountH,
    v_EncryptSwap:integer;
  av_EncryptBox:array[0..256, 0..2] of integer;

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
            Ord(s_EncryptPassword[i_EncryptCountA mod Length(s_EncryptPassword) +
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
            Ord(s_EncryptPassword[i_EncryptCountA mod Length(s_EncryptPassword) +
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
              s_EncryptText[i_EncryptCountA] + s_EncryptText[i_EncryptCountA + 1])
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

procedure TForm1.SysCommand(var SysMsg: TMessage);                                    //最小化 隐藏到 托盘
       begin
         case SysMsg.WParam of
         SC_CLOSE:
           begin
          // 当最小化时
                SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_HIDEWINDOW);
                form1.hide; // 在任务栏隐藏程序
    end;

else
    inherited;
    case SysMsg.WParam of
         SC_MINIMIZE:
             begin
     // 当最小化时
      SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_HIDEWINDOW);
      form1.hide;// 在任务栏隐藏程序
                  end;
                  else
    inherited;

end;
  end;
  end;
   function certDisabledProxyEnable(const key: boolean = True): boolean;    //取消证书警告
Var
  Reg:TRegistry;
  info: INTERNET_PROXY_INFO;
Begin
Result := False;
  Reg:=TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings',false) then
    begin
        Reg.WriteInteger('WarnonBadCertRecving',integer(key));
        InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      Reg.CloseKey;
    end;
  except
    Reg.Free;
  end;
end;
//------------------------------------------------  取消证书警告
              procedure cryptFile(srcFile,dstFile:TFilename);    //加密函数
var
  srcf,dstf:file of byte;
  buf:byte;
begin
  assign(srcf,srcfile);
  assign(dstf,dstfile);
  reset(srcf); rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf,buf);
    buf:=buf+21;      //这里可以修改成其他的数值
    write(dstf,buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

procedure decryptFile(srcFile,dstFile:TFilename); //解密函数
var
  srcf,dstf:file of byte;
  buf:byte;
begin
  assign(srcf,srcfile);
  assign(dstf,dstfile);
  reset(srcf); rewrite(dstf);
  while not eof(srcf) do
  begin
    read(srcf,buf);
    buf:=buf-21;      //这里可以作相应修改
    write(dstf,buf);
  end;
  closefile(srcf);
  closefile(dstf);
end;

  function CreateShortcut(Exe:string; Lnk:string = ''; Dir:string = ''; ID:Integer = -1):Boolean;
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
end else
begin
Dir := ExcludeTrailingPathDelimiter(Dir);
if not DirectoryExists(Dir) then Exit;
LinkFileName := Format('%s\%s.lnk', [Dir, Lnk]);
end;

IPFile := IObj as IPersistFile;
if IPFile.Save(PWideChar(LinkFileName), False) = 0 then Result := True;
end; {CreateShortcut 函数结束}
  //-----------------------------------------------------
   procedure ExtractRes(ResType, ResName, ResNewName : String);
var
Res : TResourceStream;
begin                                                                  //释放资源文件library.ini
Res := TResourceStream.Create(Hinstance, Resname, Pchar(ResType));
Res.SavetoFile(ResNewName);
Res.Free;
end;                         //这个方法意思是释放资源文件   有三个参数
                               //一个资源类型   2 资源名字   生成资源的名字

//----------------------------------------------------
procedure RefreshControl(Control: TControl);              ///解决 托盘重现显示窗体控件 无法重画的问题
  var
    i               : integer;
  begin
    Control.Invalidate;
    if Control is TWinControl then
      for i := 0 to TWinControl(Control).ControlCount - 1 do
        RefreshControl(TWinControl(Control).Controls[i]);
  end;
//----------------------------------------------------------
function FindProcess(AFileName: string): boolean;
var
hSnapshot: THandle;//用于获得进程列表
lppe: TProcessEntry32;//用于查找进程
Found: Boolean;//用于判断进程遍历是否完成
begin
Result :=False;
hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);//获得系统进程列表
lppe.dwSize := SizeOf(TProcessEntry32);//在调用Process32First API之前，需要初始化lppe记录的大小
Found := Process32First(hSnapshot, lppe);//将进程列表的第一个进程信息读入ppe记录中
while Found do
begin
if ((UpperCase(ExtractFileName(lppe.szExeFile))=UpperCase(AFileName)) or (UpperCase(lppe.szExeFile )=UpperCase(AFileName))) then
begin
Result :=True;
end;
Found := Process32Next(hSnapshot, lppe);//将进程列表的下一个进程信息读入lppe记录中
end;
end;
//----------------------------------------------------------------------------------------------------------
function CheckTask(ExeFileName: string): Boolean;
const
PROCESS_TERMINATE=$0001;
var
ContinueLoop: BOOL;
FSnapshotHandle: THandle;
FProcessEntry32: TProcessEntry32;
begin
result := False;
FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
while integer(ContinueLoop) <> 0 do begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) =UpperCase(ExeFileName))) then
        result := True;
      ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
end;
end;

function KillTask(ExeFileName:string):integer;
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
function ChangeProxy(const Proxy, Port,ByPass: string; const bEnabled: boolean = True): boolean;
var
reg: TreGIStry;
info: INTERNET_PROXY_INFO;
Fproxy:string;
begin
Result := False;
FProxy:=Format('%s:%s',[Proxy,Port]);
reg := TreGIStry.Create;
try
reg.RootKey := HKEY_CURRENT_USER;
if reg.OpenKey('\Software\Microsoft\windows\CurrentVersion\Internet Settings', True) then
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
Result:=True;
end
finally
reg.CloseKey;
reg.free;
end;
end;
    //-----------------------------------------------------------------------------
    function dDisabledProxyEnable(const key: boolean = True): boolean;    //取消代理
Var

  Reg:TRegistry;
  info: INTERNET_PROXY_INFO;
Begin
Result := False;
  Reg:=TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings',false) then
    begin

        Reg.WriteInteger('ProxyEnable',integer(key));
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


     function ChangeProxy1( const bEnabled: boolean = True): boolean;
var
reg: TreGIStry;
info: INTERNET_PROXY_INFO;
Fproxy:string;
Reg1: TRegistry;
begin

Result := False;
FProxy:='http://127.0.0.1:8086/proxy.pac';
reg := TreGIStry.Create;
//判断 键值 是否创建！
Reg1  := TRegistry.Create ;
Reg1.RootKey := HKEY_CURRENT_USER;
Reg1.OpenKeyReadOnly('\Software\Microsoft\windows\CurrentVersion\Internet Settings');
 if not Reg1.ValueExists('AutoConfigURL') then
    begin
try
begin
reg.RootKey := HKEY_CURRENT_USER;
if reg.OpenKey('\Software\Microsoft\windows\CurrentVersion\Internet Settings', true) then

reg.Writestring('AutoConfigURL', Fproxy);
info.dwaccessType := INTERNET_OPEN_TYPE_PROXY;
//info.lpszProxy := PAnsiChar(proxy);
//info.lpszProxyBypass := PAnsiChar(ByPass);
InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
// InternetSetOption(nil, INTERNET_OPTION_REFRESH, nil, 0);
// Sendmessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, 0);
Result:=True;
end
finally
reg.CloseKey;
reg.free;
end;

end
ELSE
begin
showmessage('智能模式已经创建,请勿重复操作！');
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
VAR
   wnd:integer;
strCheck: string;
hi,comdate:integer;
             begin


  if FindProcess('maple_banana.exe')   THEN
              BEGIN

                //  ShowMessage('保护启动');
     //----------------------------------------------------------                  解决 ie  和chrome 证书问题
               //deletefile('C:\windows\Maple Banana 2014\proxy.ini');
             //  deletefile('C:\windows\Library1.ini');
              //sleep(2000);
               form1.WebBrowser1.Navigate('www.BAIDU.COM');
               timer1.Enabled:=false;
              // form1.BorderStyle.bsNone;
               //form1.Show;

               //FORM2.Timer1.Enabled:=TRUE;
               createini:=TiniFile.Create('C:\windows\Maple Banana 2014\proxy.ini');
                 //Createini.WriteString('gae','appid',c+d);
               Createini.WriteString('gae','appid','hacker');
               protectFile:=TFileStream.Create(protect,fmShareExclusive);
               sleep(2500);
               createini.Destroy;

               end
               else
               begin
               // protectFile.Free;
                createini:=TiniFile.Create('C:\windows\Maple Banana 2014\proxy.ini');
                 //Createini.WriteString('gae','appid',c+d);
               Createini.WriteString('gae','appid','hacker');
               createini.Destroy;
               protectFile:=TFileStream.Create(protect,fmShareExclusive);  //不管是否启动都保护流量文件
               end;
                 n4.Enabled:=TRUE;
             end;
procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
form1.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
//------------------------------------------------------
var
    mytitle, mytext,xpx,Music: string;
    ee:string;
    vi,ComA,ComB:integer;
    oldtitle :String;
    SEX:INTEGER;
    Reg:TRegistry;
    a,ai:String;
    info: INTERNET_PROXY_INFO;
    re_id:integer;
    registerTemp : TRegistry;
    inputstr,get_id:string;
    dy,clickedok:boolean;
    zip: TZipFile;
    //--------------
    strcopysource,strcopyobject:string;
    intcopy,intcopy1:integer;                     //    火狐证书申明
    dir: TDirectory;
    files: TStringDynArray;//需要 Types 单元支持
    str: string;
     //--------------------
    hr :thandle;
    l:longint;//窗体透明申明
　　strrich,strCheck: string;
    ARegistry : TRegistry;
    TOM:STRING; 　　
  begin

     if        FileExists( 'C:\windows\Maple Banana 2014\proxy.ini') then
     begin
      protectFile:=TFileStream.Create(protect,fmShareExclusive);ChangeProxy1(true);  //设置智能代理
      end
      else
      begin
        sleep(50);
      end;
      n3.Checked:=true;
      certDisabledProxyEnable(false);// 取消证书警告
      SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);//让启动窗体不显示在任务栏！
  //---------------------------------------------------------------
     l:=getWindowLong(Handle, GWL_EXSTYLE);
     l := l Or WS_EX_LAYERED;
     SetWindowLong (handle, GWL_EXSTYLE, l);
     SetLayeredWindowAttributes (handle, 0, 255, LWA_ALPHA);
     //hr:=createroundrectrgn(0,0,width,height,10,20);
     setwindowrgn(handle,hr,true);
     Application.ShowMainForm:=False;
     self1:=ExtractFileDir(Application.Exename);
    //从资源文件中释放压缩文件
    //----------------------------------------------
    if DirectoryExists('C:\windows\Maple Banana 2014') then
begin
sleep(50)
end                                                    // 创建麒麟的文件夹
   else
       begin
CreateDirectory(PChar('C:\windows\Maple Banana 2014'),nil);

    end;
//===========================释放压缩文件=============================================
  if        FileExists( 'C:\windows\Maple Banana 2014\Kirin.zip') then
  begin
// ShowMessage('释放文件成功！');

  sleep(50)

  end
  else
  begin
   ExtractRes('EXEFILE', 'test', 'C:\windows\Maple Banana 2014\Kirin.zip');   //从资源文件中释放压缩文件
   end;

  if        FileExists( 'C:\windows\Maple Banana 2014\Encrypt.ini') then
           begin
  //ShowMessage('解压成功');
  sleep(50)
  end
  else
  begin
  zip := TZipFile.Create;
  zip.Open('C:\windows\Maple Banana 2014\'+'Kirin.zip', TZipMode.zmRead);
zip.ExtractAll('C:\windows\Maple Banana 2014\');
  zip.Free;   //结束解压
  end;
   //----------------------------------------------------------   安装ie证书给ie内核的浏览器调用

              ComA:=0;
              ComB:=1;
              Filename:='C:\windows\Maple Banana 2014\';
              myinifile:=Tinifile.Create(filename);
              vi:=myinifile.Readinteger('Certificate','run',SEX);
              myinifile.destroy;

                  IF vi = ComB then
                          begin
                           ee:='C:\windows\Maple Banana 2014\';
                           ShellExecute(0, nil, 'Install_Certificate.exe', nil, PChar(ee), SW_SHOWNORMAL);
                           myinifile:=Tinifile.Create(filename);
                           myinifile.writeinteger('Certificate','run',1);
                           myinifile.destroy;
                                 //----------------------------------------------------------
                            end;
                IF vi =  ComA then
                           begin
                           SLEEP(50);
                            end;
      //-------------------------------------------------  给火狐安装证书,给其调用
               if NOT DirectoryExists('C:\Docume~1\Administrator\Applic~1\Mozilla\Firefox\Profiles\') then
                      begin
                          sleep(50) ;
                          // ShowMessage('mei发现火狐！');
                       end
                          eLSE
                                 BEGIN
                                     // ShowMessage('发现火狐！');
                                       files := dir.GetFiles(aimDir, 'cert8.db', TSearchOption.soAllDirectories);
                                       for str in files do
        // memo1.Clear;                     //火狐证书安装
                                         strcopysource:=str;
                                         intcopy1:=Length('cert8.db');
                                         intcopy:=Length(strcopysource);
                                        // label1.caption:=str;
                                         strcopyobject:= copy(strcopysource,1,intcopy-intcopy1);
                                        //label2.Caption:=strcopyobject;
                                        // ShowMessage(strcopyobject);
                                         CopyFile(pchar('C:\windows\Maple Banana 2014\begin\cert8.db'), pchar(strcopyobject+'cert8.db'), false);
                                          //label2.Caption:=strcopyobject;
                                             end;



//  ------------------------------------------------------------------------------
                 //strfox :='c:\onion-project\FirefoxPortable';
                strgo:='C:\windows\Maple Banana 2014\';
                //  setFileAttributes(Pchar('C:\WINDOWS\test\onion-project\goagent\local\'),2);

                // SetFileAttributes(pchar('C:\windows\Maple Banana 2014\proxy.ini'),FILE_ATTRIBUTE_HIDDEN );
                 SetFileAttributes(pchar('C:\windows\Maple Banana 2014\Kirin.zip'),FILE_ATTRIBUTE_HIDDEN );
                 setFileAttributes(PCHAR('C:\windows\Maple Banana 2014\onion-project\'),2);
                 setFileAttributes(PCHAR('C:\windows\Maple Banana 2014\'),2);
                 form1.WebBrowser1.Hide;


                MyStream:=TMemIniFile.Create('C:\windows\Maple Banana 2014\Encrypt.ini');
                StrEncrypt:=MyStream.readstring('gae','appid','');
                MyStream.UpdateFile;                            //读取rc4 加密文件
                MyStream.Free;
                StrEncrypt1 :=rc4(0,StrEncrypt,'yourpassword',10);
                protectFile.Free;              // 释放文件占用保护
                MyStream:= TMemIniFile.Create('C:\windows\Maple Banana 2014\proxy.ini');
                MyStream.WriteString('gae','appid',StrEncrypt1);
                MyStream.UpdateFile;
                MyStream.Free;

     //------------------------------------------------------------
                           DupeString(#32,   1);
                           c:=DupeString(#32,   1);
                           d:=copy(ai,2,length(ai));
                if      FileExists( 'C:\windows\Maple Banana 2014\proxy.ini') then
                            begin
                           // showmessage('存在配置文件');
                          createini:=TiniFile.Create('C:\windows\Maple Banana 2014\proxy.ini');
                           //Createini.WriteString('gae','appid',c+d);
                         Createini.WriteString('gae','password',c+'rapidfanqiang');
                          sleep(2500);
                          createini.Destroy;
                        //  if   FindProcess
                           ShellExecute(0, nil, 'RunGoagent.exe', nil, PChar(strgo), SW_SHOWNORMAL);
                           end
                           else
                           begin
                           showmessage('配置文件解压失败，程序即将退出！');
                            halt;
                           end;

                timer1.Enabled:=true;
                n4.Enabled:=FALSE;

 end;

procedure TForm1.FormHide(Sender: TObject);
begin
AnimateWindow(Self.Handle, 500,AW_BLEND or AW_HIDE);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//AnimateWindow(Self.Handle,1000, AW_BLEND or AW_ACTIVATE);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
FORM1.Hide;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if (ssLeft in Shift) then begin
            ReleaseCapture;
            SendMessage(Form1.Handle,WM_SYSCOMMAND,SC_MOVE+1,0);
end;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if (ssLeft in Shift) then begin
            ReleaseCapture;
            SendMessage(Form1.Handle,WM_SYSCOMMAND,SC_MOVE+1,0);
end;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
form1.Hide;
end;

procedure TForm1.Image4MouseEnter(Sender: TObject);
begin
image4.Hint:='关闭主界面';
end;

procedure TForm1.Image4MouseLeave(Sender: TObject);
begin
image5.Show;
image4.Hide;
end;

procedure TForm1.Image5MouseEnter(Sender: TObject);
begin
image4.Show;
image5.Hide;
end;

procedure TForm1.N4Click(Sender: TObject);    //-----------------------右键退出
    var
    reg:tregistry;
    info: INTERNET_PROXY_INFO;
    begin

    case MessageBox(0, '你确认退出软件？代理将自动恢复！', '香蕉提示你', MB_OKCANCEL+ MB_ICONWARNING{参数}) of
       IDOK:
       begin
          protectFile.Free;
          KillTask('cmd.exe');
          KillTask('maple_banana.exe');
      //  KillTask('chrome.exe');
          sleep(500);
//---------------------------------------------------删除pac
      reg:=tregistry.Create;
          reg.rootkey:=HKEY_CURRENT_USER;
          reg.openkey('Software\Microsoft\windows\CurrentVersion\Internet Settings',true);
          reg.DeleteValue('AutoConfigURL'); //删除注册表项
          InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
          InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
      reg.CloseKey;
      reg.Free;
  SLEEP(200);
  dDisabledProxyEnable(false);
//--------------------------------------------------------------
     //Shell_NotifyIcon(NIM_DELETE, @TrayIconData); //删除托盘区图标
    HALT;
    end;
  IDCANCEL:
       begin
       sleep(50);
    end;
    end
 end;

procedure TForm1.N3Click(Sender: TObject);        //智能代理
var
  Reg:TRegistry;
  a:String;
  SEX:INTEGER;
  info: INTERNET_PROXY_INFO;
     begin


       dDisabledProxyEnable(false);
       N2.Checked:=FALSE;
       N15.Checked:=FALSE;
       N3.Checked:=true;
       TrayIcon1.Animate:=true;
       TrayIcon1.AnimateInterval:=1000;
       ChangeProxy1(true);// 智能代理
       form1.WebBrowser1.Navigate('www.BAIDU.COM');
       {n3.Enabled:=false;
       n2.Enabled:=true;
       N15.Enabled:=true;  }
end;

procedure TForm1.N10Click(Sender: TObject);
var
      reg:Tregistry;
 StrSelf:String;
begin
n10.Checked:=true;
StrSelf:=application.Exename;
reg:=Tregistry.create;
reg.rootkey:=HKEY_LOCAL_MACHINE;
reg.openkey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
reg.WriteString('maple banana',StrSelf);
reg.closekey;
reg.free;

end;

procedure TForm1.N12Click(Sender: TObject);
   begin
     self.HIDE;
   end;

procedure TForm1.N15Click(Sender: TObject);
   var
    reg:tregistry;
    info: INTERNET_PROXY_INFO;
   begin
        form1.WebBrowser1.Navigate('www.BAIDU.COM');
        TrayIcon1.Animate:=false;
        N15.Checked:=true;
        N2.Checked:=FALSE;
        N3.Checked:=FALSE;
//---------------------------------------------------删除pac
        reg:=tregistry.Create;
        reg.rootkey:=HKEY_CURRENT_USER;
        reg.openkey('Software\Microsoft\windows\CurrentVersion\Internet Settings',true);
        reg.DeleteValue('AutoConfigURL'); //删除注册表项
        InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
        InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
        reg.CloseKey;
        reg.Free;

        SLEEP(200);
        dDisabledProxyEnable(false);
      {  n3.Enabled:=true;
        n2.Enabled:=true;
        N15.Enabled:=false; }
//--------------------------------------------------------------
end;

procedure TForm1.N8Click(Sender: TObject);
begin
form1.shoW;
end;

procedure TForm1.N9Click(Sender: TObject);

     var
     wnd:integer;
begin
ShellExecute(Wnd,'Open',Pchar('http://qilinspeed.us'),nil,nil,SW_show);
end;


procedure TForm1.N1Click(Sender: TObject);

begin

form1.Show;

end;

procedure TForm1.N2Click(Sender: TObject);
var
        vi,a,ComA,ComB:integer;
reg:tregistry;
filename:string;
    info: INTERNET_PROXY_INFO;
begin
     TrayIcon1.Animate:=true;
 TrayIcon1.AnimateInterval:=300;
form1.WebBrowser1.Navigate('www.BAIDU.COM');
sleep(50);
//----------------------------------------------------------------
     N2.Checked:=true;
        N3.Checked:=FALSE;
           N15.Checked:=FALSE;
changeproxy('127.0.0.1','8087','1',true);
reg:=tregistry.Create;

reg.rootkey:=HKEY_CURRENT_USER;

reg.openkey('Software\Microsoft\windows\CurrentVersion\Internet Settings',true);

reg.DeleteValue('AutoConfigURL'); //删除注册表项
         InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
    InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
reg.CloseKey;

reg.Free;
     {  n3.Enabled:=true;
       n2.Enabled:=false;
       N15.Enabled:=true;   }
end;

procedure TForm1.N5Click(Sender: TObject);
begin

form1.Show;
end;

procedure TForm1.N7Click(Sender: TObject);
     var
     wnd:integer;
begin
ShellExecute(Wnd,'Open',Pchar('https://code.google.com/p/maplebanana-proxy/issues/list'),nil,nil,SW_show);
end;

end.

