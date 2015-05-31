library A_static;

uses
  SysUtils,
  Classes,
  Windows;

{$R *.res}

function SecretFunction: Integer; stdcall; external 'B.dll';

function MySecretFunction: Integer; stdcall;
begin
  OutputDebugString('A_static.SecretFunction');
  Result := SecretFunction;
end;

exports MySecretFunction name 'SecretFunction';

begin
end.
