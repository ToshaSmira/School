unit uSchoolNTService;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Dialogs, Controls, SvCom_NTService, ActiveX, Vcl.ExtCtrls;

type
  TSchoolNTService = class(TNtService)
    ActivateTimer: TTimer;
    procedure ActivateTimerTimer(Sender: TObject);
    procedure NtServiceStart(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceStop(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceShutdown(Sender: TObject);
    procedure NtServicePause(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceContinue(Sender: TNtService; var DoAction: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActivateService;
    procedure DeactivateService;
  end;

var
  SchoolNTService: TSchoolNTService;

implementation

uses
  uTransportServer;

{$R *.DFM}


{ TSchoolNTService }

procedure TSchoolNTService.ActivateService;
begin
  CoInitializeEx(nil, COINIT_MULTITHREADED);
  ActivateTimer.Enabled := True;
end;

procedure TSchoolNTService.ActivateTimerTimer(Sender: TObject);
begin
  ActivateTimer.Enabled := False;
  try
    TransportServer.Start;
  except
    on E: Exception do
    begin
      //Logger.Error('OnActivate: %s', [E.Message]);
      ActivateTimer.Interval := 1000;
      ActivateTimer.Enabled := True;
    end;
  end;
end;

procedure TSchoolNTService.DeactivateService;
begin
  TransportServer.Stop;
  CoUninitialize;
end;

procedure TSchoolNTService.NtServiceContinue(Sender: TNtService; var DoAction: Boolean);
begin
  ActivateService;
  ReportStatus;
end;

procedure TSchoolNTService.NtServicePause(Sender: TNtService; var DoAction: Boolean);
begin
  DeactivateService;
  ReportStatus;
end;

procedure TSchoolNTService.NtServiceShutdown(Sender: TObject);
begin
  DeactivateService;
  ReportStatus;
end;

procedure TSchoolNTService.NtServiceStart(Sender: TNtService; var DoAction: Boolean);
begin
  ActivateService;
  ReportStatus;
end;

procedure TSchoolNTService.NtServiceStop(Sender: TNtService; var DoAction: Boolean);
begin
  DeactivateService;
  ReportStatus;
end;

end.



