object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 577
  Height = 312
  AutoScroll = True
  AutoSize = True
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 561
    Height = 273
    TabOrder = 0
    AutoSize = True
    CustomizeFormTabbedView = True
    object btnImport: TcxButton
      Left = 26
      Top = 83
      Width = 145
      Height = 25
      Caption = 'Import from File'
      TabOrder = 1
      OnClick = btnImportClick
    end
    object btnPreview: TcxButton
      Left = 206
      Top = 82
      Width = 193
      Height = 25
      Caption = 'Open Viewer'
      TabOrder = 4
      OnClick = btnPreviewClick
    end
    object btnNew: TcxButton
      Left = 26
      Top = 51
      Width = 145
      Height = 25
      Caption = 'Create New'
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnSaveToFile: TcxButton
      Left = 26
      Top = 115
      Width = 145
      Height = 25
      Caption = 'Save to File'
      TabOrder = 2
      OnClick = btnSaveToFileClick
    end
    object btnDesign: TcxButton
      Left = 206
      Top = 51
      Width = 193
      Height = 24
      Caption = 'Open Designer'
      TabOrder = 3
      OnClick = btnDesignClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object liNew: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avTop
      CaptionOptions.Text = 'btnNew'
      CaptionOptions.Visible = False
      Control = btnNew
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liOpen: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avTop
      CaptionOptions.Text = 'btnOpen'
      CaptionOptions.Visible = False
      Control = btnImport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liSave: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'btnSave'
      CaptionOptions.Visible = False
      Control = btnSaveToFile
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDesign: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnShowDesigner'
      CaptionOptions.Visible = False
      Control = btnDesign
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liPreview: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnViewReport'
      CaptionOptions.Visible = False
      Control = btnPreview
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutLabeledItem1: TdxLayoutLabeledItem
      CaptionOptions.Text = 'Label'
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'Report Layout'
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Report Dialogs'
      Index = 1
    end
  end
  object dxReport1: TdxReport
    Parameters = <>
    OnLayoutChanged = dxReport1LayoutChanged
    Left = 16
    Top = 224
  end
  object dxOpenFileDialog: TdxOpenFileDialog
    Filter = 'REPX (*.repx)|*.repx'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Import Report Layout'
    Left = 136
    Top = 176
  end
  object dxSaveFileDialog: TdxSaveFileDialog
    DefaultExt = 'repx'
    Filter = 'REPX (*.repx)|*.repx'
    Title = 'Save Report Layout'
    Left = 72
    Top = 176
  end
  object dxBackendDataConnectionManager: TdxBackendDataConnectionManager
    Left = 16
    Top = 176
    object ReportsNWindConnectionString: TdxBackendDatabaseSQLConnection
      DisplayName = 'NWindConnectionString'
      ConnectionString = 'XpoProvider=SQLite; Data Source=..\..\..\nwind.db; Mode=ReadOnly'
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'WXI'
    Left = 72
    Top = 224
  end
end
