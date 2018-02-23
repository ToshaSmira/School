###############################################################
#  Define type of binary, used packages, project defines and  #
#  include paths if needed                                    #
###############################################################

ISPACKAGE=FALSE
DEFINES=$(DBVER)
INCLUDEPATH=$(RO)\Source
UNITINCLUDEPATH=$(SvCom)\RunTime;$(SvCom)\Experts;$(SvCom)\DesignTime;$(DevExpLib);$(RO)\Source;$(RO)\Source\RODEC;$(RO)\Source\CodeGen;$(RO)\Source\ZLib;$(SDAC)\source;$(ODAC)\source;$(SDACLIB);$(ODACLib);

###############################################################
!include ..\local_rules.inc
!include ..\make_settings.inc
###############################################################

PROJECTS=DBSchool.res DBSchool.exe
default:: $(PROJECTS)

###############################################################

!if $(ARCHITECTURE)==X32
DBSchool.res:: res\DBSchool.rc
   $(INCBLD)
   $(RCC) -foDBSchool.res
!endif

!if $(ARCHITECTURE)==X64
DBSchool.res:: res\DBSchoolx64.rc
   $(INCBLD)
   $(RCC) -foDBSchool.res
!endif


DBSchool.exe:: DBSchool.dpr
   $(BACKUPDOF)
   $(BACKUPCFG)
   $(MESSAGE)
   $(DCC)
   $(CHECKIN)
   $(RESTOREDOF)
   $(RESTORECFG)

###############################################################

