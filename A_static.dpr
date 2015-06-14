library A_static;

uses
  SysUtils,
  Classes,
  Windows,
  OutColours;

{$R *.res}

function SecretFunction: Integer; stdcall; external 'B.dll';

function MySecretFunction: Integer; stdcall;
begin
  Red;
  Result := SecretFunction;
  Grey;
end;

exports MySecretFunction name 'SecretFunction';

begin
  Green;
  WriteLn('A_static Loaded');
  Grey;
end.
