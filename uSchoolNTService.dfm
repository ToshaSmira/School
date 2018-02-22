object SchoolNTService: TSchoolNTService
  OldCreateOrder = False
  DisplayName = 'SchoolNTService'
  ShareProcess = True
  UseSynchronizer = False
  OnContinue = NtServiceContinue
  OnPause = NtServicePause
  OnShutdown = NtServiceShutdown
  OnStart = NtServiceStart
  OnStop = NtServiceStop
  ServiceName = 'SchoolNTService'
  FailureActions = <>
  Height = 150
  Width = 215
  StartedByScm = 'A1B9975E-40E51232'
  object ActivateTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ActivateTimerTimer
    Left = 40
    Top = 24
  end
end
