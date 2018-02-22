unit uTransportData;

interface

uses
  System.SysUtils, System.Classes, uROJSONMessage, uROMessage, uROBinMessage, uROComponent, uROBaseConnection,
  uROServer, uROCustomHTTPServer, uROBaseHTTPServer, uROIndyHTTPServer;

type
  TTransportData = class(TDataModule)
    MainHTTPServer: TROIndyHTTPServer;
    ROBinMessage: TROBinMessage;
    ROJSONMessage: TROJSONMessage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransportData: TTransportData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
