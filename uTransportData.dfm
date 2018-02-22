object TransportData: TTransportData
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MainHTTPServer: TROIndyHTTPServer
    Dispatchers = <
      item
        Name = 'ROBinMessage'
        Message = ROBinMessage
        Enabled = True
        PathInfo = 'Bin'
      end
      item
        Name = 'ROJSONMessage'
        Message = ROJSONMessage
        Enabled = True
        PathInfo = 'JSON'
      end>
    SendClientAccessPolicyXml = captAllowAll
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 7777
    Port = 7777
    Left = 88
    Top = 72
  end
  object ROBinMessage: TROBinMessage
    Envelopes = <>
    Left = 144
    Top = 8
  end
  object ROJSONMessage: TROJSONMessage
    Envelopes = <>
    ExtendedExceptionClass = 'ROJSONException'
    Left = 32
    Top = 8
  end
end
