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
  uTransportServer in 'uTransportServer.pas' {TransportServer: TDataModule},
  SchoolLibrary_Intf in 'SchoolLibrary_Intf.pas',
  SchoolLibrary_Invk in 'SchoolLibrary_Invk.pas',
  SchoolService_Impl in 'SchoolService_Impl.pas' {SchoolService: TRORemoteDataModule},
  uDBDataManager in 'uDBDataManager.pas' {DBDataManager: TDataModule};

{#ROGEN:school.rodl}  // RemObjects: Careful, do not remove!
  {$R RODLFile.res}
  {$R *.RES}
begin
  Application.Initialize;
    Application.CreateForm(TSchoolNTService, SchoolNTService);
    Application.CreateForm(TTransportServer, TransportServer);
  Application.Run;
end.
