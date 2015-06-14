library Nope;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours;

{$R *.res}

procedure Success; stdcall;
begin
  WriteLn('We''re in!');
end;

exports Success;

begin

  Green;
  WriteLn('Nope Loaded');

  Red;
  WriteLn('Nope: It''s going to have to be a "No", this time');

  Grey;
  ExitCode := 1;

end.
