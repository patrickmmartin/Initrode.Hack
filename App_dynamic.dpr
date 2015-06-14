program App_dynamic;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

var
  Hmod : HMODULE;
  Proc: function: Integer; stdcall;
  SecretFunction : integer;
begin
  try
    WriteLn('App dynamic start');
    HMod := LoadLibrary('A_dynamic.dll');
    Proc := GetProcAddress(Hmod, 'SecretFunction');
    if Assigned(Proc) then
      SecretFunction := Proc()
    else
      SecretFunction := -1;
    WriteLn('SecretFunction: ', SecretFunction);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
