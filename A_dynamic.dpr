library A_dynamic;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours;

{$R *.res}

function SecretFunction: Integer; stdcall;
var
  Hmod : HMODULE;
  Proc: function: Integer; stdcall;
begin
  Red;
  OutputDebugString('A_dynamic.SecretFunction');
  HMod := LoadLibrary('B.dll');
  Proc := GetProcAddress(Hmod, 'SecretFunction');
  if Assigned(Proc) then
    Result := Proc()
  else
    Result := -1;
  Grey;
end;

exports SecretFunction;

begin
  Green;
  WriteLn('A_dynamic loaded');
  Grey;
end.
