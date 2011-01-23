object dmReport: TdmReport
  OldCreateOrder = False
  Left = 230
  Top = 116
  Height = 530
  Width = 447
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qrFreeAdv
    Left = 152
    Top = 24
  end
  object frxReport1: TfrxReport
    Version = '4.9'
    DotMatrixReport = False
    EngineOptions.UseFileCache = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbSave, pbExport, pbZoom, pbFind, pbPageSetup, pbTools, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40553.516914965300000000
    ReportOptions.LastChange = 40563.354879189810000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 24
    Top = 24
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsReport
    BCDToCurrency = False
    Left = 88
    Top = 24
  end
  object frxXLSExport1: TfrxXLSExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = True
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 24
    Top = 80
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    EscModel = 1
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = False
    Left = 88
    Top = 80
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 152
    Top = 80
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    Left = 216
    Top = 80
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 24
    Top = 136
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 88
    Top = 136
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 152
    Top = 136
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    Left = 216
    Top = 136
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 24
    Top = 192
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 88
    Top = 192
  end
  object frxDBFExport1: TfrxDBFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OEMCodepage = False
    Left = 152
    Top = 192
  end
  object qrFreeAdv: TpFIBDataSet
    SelectSQL.Strings = (
      '-- dmReport.qrFreeAdv'
      'select a.address_name, r.name_contractor'
      '       , count(*) c_all'
      
        '       , sum(case when s.date_fact is not null then 1 else 0 end' +
        ') c_full'
      
        '       , sum(case when s.date_fact is null then 1 else 0 end) c_' +
        'empty'
      '  from adv a,  contract c,  contractor r, side s'
      '  where a.id_contract=c.id_contract'
      '        and c.id_contractor=r.id_contractor'
      '        and a.id_adv=s.id_adv'
      '        and a.id_adv in (select id_adv from ('
      '        select id_adv'
      '               , count(*) c_all'
      
        '               , sum(case when date_fact is not null then 1 else' +
        ' 0 end) c_full'
      
        '               , sum(case when date_fact is null then 1 else 0 e' +
        'nd) c_empty'
      '          from side group by id_adv)'
      '                             where c_all>c_full)'
      '  group by a.address_name, r.name_contractor')
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    Left = 24
    Top = 256
  end
  object qrAdvwoSide: TpFIBDataSet
    SelectSQL.Strings = (
      '-- dmReport.qrAdvwoSide'
      'select a.address_name, r.name_contractor'
      '  from adv a,  contract c,  contractor r'
      '  where a.id_contract=c.id_contract'
      '        and c.id_contractor=r.id_contractor'
      
        '        and not exists (select 1 from side s where s.id_adv=a.id' +
        '_adv)'
      '  group by a.address_name, r.name_contractor')
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    Left = 88
    Top = 256
  end
  object qrAllAdv: TpFIBDataSet
    SelectSQL.Strings = (
      '-- dmReport.qrAllAdv'
      'select a.address_name'
      
        '       , (select count(*) from side s where id_adv=a.id_adv) c_a' +
        'll'
      '  from adv a'
      '  order by a.address_name')
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    Left = 160
    Top = 256
  end
  object pFIBDataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      '-- dmReport.qr'
      'select a.address_name'
      
        '       , (select count(*) from side where id_adv=a.id_adv) c_sid' +
        'e'
      '  from adv a'
      '  where a.id_adv in (select id_adv from side where type_side=2)'
      '  order by a.address_name')
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    Left = 224
    Top = 256
  end
end
