program App_cheat;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

var
  HForcemod : HMODULE;
  Hmod : HMODULE;
  Proc: function: Integer; stdcall;
  SecretFunction : integer;
begin
  try
    WriteLn('App cheat start');

    CopyFile('other\B_.dll', 'other\B.dll', false);

    OutputDebugString('A_cheat.main');
    HForceMod := LoadLibrary('other\B.dll');
    HMod := LoadLibrary('A_static.dll');
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
