program TestHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse;

var
  Api: THorse;

begin
  Api := THorse.Create(9000);
  try
    Api.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);
    Api.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
