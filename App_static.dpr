program App_static;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

function SecretFunction: Integer; stdcall; external 'A_static.dll';

begin
  try
    WriteLn('App static start');
    WriteLn('SecretFunction: ', SecretFunction);
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
