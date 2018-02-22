unit uTransportServer;

interface

uses
  System.SysUtils, System.Classes, uROJSONMessage, uROMessage, uROBinMessage, uROComponent, uROBaseConnection,
  uROServer, uROCustomHTTPServer, uROBaseHTTPServer, uROIndyHTTPServer;

type
  TTransportServer = class(TDataModule)
    MainHTTPServer: TROIndyHTTPServer;
    ROBinMessage: TROBinMessage;
    ROJSONMessage: TROJSONMessage;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Start;
    procedure Stop;
  end;

var
  TransportServer: TTransportServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TTransportData }

procedure TTransportServer.Start;
begin
  MainHTTPServer.Active := true;
end;

procedure TTransportServer.Stop;
begin
  MainHTTPServer.Active := false;
end;

end.
