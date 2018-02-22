unit uSchoolNTService;

interface

uses
    Windows,
    Messages,
    SysUtils,
    Classes,
    Graphics,
    Dialogs,
    Controls,
    SvCom_NTService;

type
  TSchoolNTService = class(TNtService)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SchoolNTService: TSchoolNTService;

implementation

{$R *.DFM}


end.

 
 
