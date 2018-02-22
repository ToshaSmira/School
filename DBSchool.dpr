program DBSchool;

uses
  {$IFDEF DEBUG}
    madExcept,
    madLinkDisAsm,
    madListHardware,
    madListProcesses,
    madListModules,
  {$ENDIF }
  MidasLib,
  SvCom_NTService,
  uSchoolNTService in 'uSchoolNTService.pas' {SchoolNTService: TNtService},
  uTransportData in 'uTransportData.pas' {TransportData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSchoolNTService, SchoolNTService);
  Application.CreateForm(TTransportData, TransportData);
  Application.Run;
end.
