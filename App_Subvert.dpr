program App_Subvert;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  OutColours,
  JclPEImage,
  JclSysUtils;

function SecretFunction: Integer; stdcall; external 'A_dynamic.dll';

function MySecretFunction: Integer; stdcall;
begin
  Red;
  WriteLn('MySecretFunction');
  Result := 42;
  Grey;
end;


function MyGetProc(hModule: HMODULE; ProcName: PAnsiChar): Pointer; stdcall;
begin
  if String(ProcName) = 'SecretFunction' then
  begin
    Red;
    WriteLn('Hooking SecretFunction');
    Result := @MySecretFunction;
    Grey;
  end
  else
  begin
    Green;
    WriteLn('Not hooking ' + string(ProcName));
    Result := @MySecretFunction;
    Grey;
  end;
end;

var
  PeImportHooks: TJclPeMapImgHooks;
  Hmod : HMODULE;
  OldGetProc : TProcedure;
begin
  try
    WriteLn('App subvert start');

    HMod := LoadLibrary('A_dynamic.dll');

    PeImportHooks := TJclPeMapImgHooks.Create;
    try

      if PeImportHooks.HookImport(Pointer(HMod), kernel32,
                                  'GetProcAddress',
                                  @MyGetProc, @OldGetProc) then
        WriteLn('GetProcAddress hooked ...')
      else
        WriteLn(Format('GetProcAddress hooking error - %s', [SysErrorMessage(GetLastError)]));

        WriteLn('SecretFunction: ', SecretFunction);
    finally
      PeImportHooks.Free;
    end;

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
