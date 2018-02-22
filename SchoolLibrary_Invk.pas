unit SchoolLibrary_Invk;

// ----------------------------------------------------------------------
//  This file was automatically generated by Remoting SDK from a
//  RODL file downloaded from a server or associated with this project.
// 
//  Do not modify this file manually, or your changes will be lost when
//  it is regenerated the next time you update your RODL.
// ----------------------------------------------------------------------

{$I RemObjects.inc}

interface

uses
  {$IFDEF DELPHIXE2UP}System.SysUtils{$ELSE}SysUtils{$ENDIF},
  {$IFDEF DELPHIXE2UP}System.Classes{$ELSE}Classes{$ENDIF},
  uROXMLIntf,
  uROServer,
  uROServerIntf,
  uROClasses,
  uROTypes,
  uROClientIntf,
  SchoolLibrary_Intf;

type
  { Forward declarations }
  TSchoolService_Invoker = class;

  TSchoolService_Invoker = class(TROInvoker)
  public
    constructor Create; override; 
  published
    procedure Invoke_GetNameServer(const __Instance: IInterface; const __Message: IROMessage; const __Transport: IROTransport; out __oResponseOptions: TROResponseOptions);
    procedure Invoke_GetDateTimeServer(const __Instance: IInterface; const __Message: IROMessage; const __Transport: IROTransport; out __oResponseOptions: TROResponseOptions);
  end;

implementation

uses
  uROEventRepository,
  uRORes,
  uROClient;

constructor TSchoolService_Invoker.Create;
begin
  inherited Create();
  FAbstract := false;
end;

procedure TSchoolService_Invoker.Invoke_GetNameServer(const __Instance: IInterface; const __Message: IROMessage; const __Transport: IROTransport; out __oResponseOptions: TROResponseOptions);
var
  lResult: AnsiString;
  __lintf: SchoolLibrary_Intf.ISchoolService;
begin
  CheckRoles(__Instance, GetDefaultServiceRoles());
  try
    if not Supports(__Instance, ISchoolService, __lintf) then begin
      raise EIntfCastError.Create('Critical error in TSchoolService_Invoker.Invoke_GetNameServer: __Instance does not support SchoolService interface');
    end;

    lResult := __lintf.GetNameServer();

    __Message.InitializeResponseMessage(__Transport, 'SchoolLibrary', 'SchoolService', 'GetNameServerResponse');
    __Message.Write('Result', System.TypeInfo(AnsiString), lResult, []);
    __Message.Finalize();
    __Message.UnsetAttributes(__Transport);

  finally
    __lintf := nil;
  end;
end;

procedure TSchoolService_Invoker.Invoke_GetDateTimeServer(const __Instance: IInterface; const __Message: IROMessage; const __Transport: IROTransport; out __oResponseOptions: TROResponseOptions);
var
  lResult: DateTime;
  __lintf: SchoolLibrary_Intf.ISchoolService;
begin
  CheckRoles(__Instance, GetDefaultServiceRoles());
  try
    if not Supports(__Instance, ISchoolService, __lintf) then begin
      raise EIntfCastError.Create('Critical error in TSchoolService_Invoker.Invoke_GetDateTimeServer: __Instance does not support SchoolService interface');
    end;

    lResult := __lintf.GetDateTimeServer();

    __Message.InitializeResponseMessage(__Transport, 'SchoolLibrary', 'SchoolService', 'GetDateTimeServerResponse');
    __Message.Write('Result', System.TypeInfo(DateTime), lResult, [paIsDateTime]);
    __Message.Finalize();
    __Message.UnsetAttributes(__Transport);

  finally
    __lintf := nil;
  end;
end;

initialization
finalization
end.
