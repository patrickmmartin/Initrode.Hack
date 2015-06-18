library A_tough;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours;

{$R *.res}

var
  Hmod : HMODULE;
  Proc: function: Integer; stdcall;

function SecretFunction: Integer; stdcall;
begin
  Red;
  if Assigned(Proc) then
    Result := Proc()
  else
    Result := -1;
  Grey;
end;

exports SecretFunction;

begin
  Green;
  WriteLn('A_tough loaded');
  HMod := LoadLibrary('B.dll');
  WriteLn('Locating SecretFunction');
  Proc := GetProcAddress(Hmod, 'SecretFunction');
  Grey;
end.
