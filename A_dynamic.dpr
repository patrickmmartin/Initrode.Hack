library A_dynamic;

uses
  SysUtils,
  Classes,
  Windows;

{$R *.res}

function SecretFunction: Integer; stdcall;
var
  Hmod : HMODULE;
  Proc: function: Integer; stdcall;
begin
  OutputDebugString('A_dynamic.SecretFunction');
  HMod := LoadLibrary('B.dll');
  Proc := GetProcAddress(Hmod, 'SecretFunction');
  if Assigned(Proc) then
    Result := Proc()
  else
    Result := -1;
end;

exports SecretFunction;

begin
end.
