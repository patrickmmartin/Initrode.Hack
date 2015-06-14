library B_;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours in '..\OutColours.pas';

{$R *.res}

function SecretFunction: Integer; stdcall;
begin
  Red;
  WriteLn('B_.SecretFunction');
  Grey;
  Result := 42;
end;

exports SecretFunction;


begin
  Green;
  WriteLn('B Loaded');
  Red;
  WriteLn('... not really!');
  Grey;
end.
