unit uDBDataManager;

interface

uses
  System.SysUtils, System.Classes, uDADriverManager, uDAConnectionManager, uROComponent, uDAStreamableComponent,
  uDAClientSchema, uDASchema, uDAServerInterfaces, uDAInterfaces, SchoolLibrary_Intf, uDAEngine, uDASDACDriver;

type
  TDBDataManager = class(TDataModule)
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    Schema: TDASchema;
    SDACDriver: TDASDACDriver;
  private
    function GetConnection: IDAConnection;
  protected
    property Connection: IDAConnection read GetConnection;
  public
    { Public declarations }
    function GetPupils(out aList: roPupilsView): boolean;
  end;

function DataManager: TDBDataManager;

{$WRITEABLECONST ON}
const
  __DataManager: TDBDataManager = nil;
{$WRITEABLECONST OFF}

implementation

const
  CONNECTION_STRING = 'MSSQL';

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function DataManager: TDBDataManager;
begin
  if __DataManager = nil then
    __DataManager := TDBDataManager.Create(nil);

  Result := __DataManager;
end;

{ TDBDataManager }

function TDBDataManager.GetConnection: IDAConnection;
begin
  Result := ConnectionManager.NewConnection(CONNECTION_STRING);
end;

function TDBDataManager.GetPupils(out aList: roPupilsView): boolean;
var
  Dataset: IDADataset;
begin
  Result := False;
  aList := nil;

  Dataset := Schema.NewDataset(Connection, 'PUPILS');
  Dataset.Open;

  aList := roPupilsView.Create;
  while not Dataset.EOF do begin
    with aList.Add do begin
      AutoIndex := Dataset.FieldByName('AutoIndex').AsInteger;
      FirstName := Dataset.FieldByName('FirstName').AsString;
      LastName := Dataset.FieldByName('LastName').AsString;
    end;
    Dataset.Next;
  end;

  Result := True;
end;

initialization
finalization
  if Assigned(__DataManager) then
    FreeAndNil(__DataManager);

end.
