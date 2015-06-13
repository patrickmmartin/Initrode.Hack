library Nope;

uses
  SysUtils,
  Classes,
  Windows;

{$R *.res}

procedure Success; stdcall;
begin
  WriteLn('We''re in!');
end;

exports Success;

begin

  WriteLn('Nope Loaded');

  ExitCode := 1;

end.
