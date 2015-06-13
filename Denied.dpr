program Denied;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

procedure Success; stdcall; external 'Nope.dll';


begin
  OutputDebugString('Denied.Main');
  try
    WriteLn('App denied start');
    WriteLn('Are we in?: ');
    Success();
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
