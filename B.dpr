library B;

uses
  SysUtils,
  Classes,
  Windows;

{$R *.res}

function SecretFunction: Integer; stdcall;
begin
  WriteLn('B Loaded');
  OutputDebugString('B.SecretFunction');
  Result := 12;
end;

exports SecretFunction;


begin
end.
