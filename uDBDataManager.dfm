object DBDataManager: TDBDataManager
  OldCreateOrder = False
  Height = 198
  Width = 295
  object Schema: TDASchema
    Datasets = <
      item
        Params = <>
        Statements = <
          item
            Connection = 'MSSQL'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'SELECT'#10'  ps.AutoIndex,'#10'  ps.FirstName,'#10'  ps.LastName'#10'FROM PUPILS' +
              ' ps'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutoIndex'
                TableField = 'AutoIndex'
              end
              item
                DatasetField = 'FirstName'
                TableField = 'FirstName'
              end
              item
                DatasetField = 'LastName'
                TableField = 'LastName'
              end>
          end>
        Name = 'PUPILS'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'AutoIndex'
            DataType = datInteger
          end
          item
            Name = 'FirstName'
            DataType = datString
            Size = 50
          end
          item
            Name = 'LastName'
            DataType = datString
            Size = 50
          end>
      end>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Version = 0
    ConnectionManager = ConnectionManager
    Left = 24
    Top = 24
  end
  object ConnectionManager: TDAConnectionManager
    Connections = <
      item
        Name = 'MSSQL'
        ConnectionString = 'SDAC?Server=10.1.1.7;Database=SSchool;UserID=sa;Password=sa;'
        Description = 'Connection to MS SQL Server'
        ConnectionType = 'MSSQL'
        Default = True
      end>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 160
    Top = 24
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%'
    TraceActive = False
    TraceFlags = []
    Left = 136
    Top = 96
  end
  object SDACDriver: TDASDACDriver
    Left = 223
    Top = 96
  end
end
