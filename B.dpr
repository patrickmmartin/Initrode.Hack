library B;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours;

{$R *.res}

function SecretFunction: Integer; stdcall;
begin
  Red;
  WriteLn('B.SecretFunction');
  Grey;
  Result := 12;
end;

exports SecretFunction;


begin
  Green;
  WriteLn('B Loaded');
  Grey;
end.
