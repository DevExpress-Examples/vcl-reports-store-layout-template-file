object MainForm: TMainForm
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'MainForm'
  ClientHeight = 297
  ClientWidth = 465
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
    Width = 465
    Height = 297
    TabOrder = 0
    AutoSize = True
    object btnOpen: TcxButton
      Left = 12
      Top = 44
      Width = 145
      Height = 25
      Caption = 'Open Report'
      SpeedButtonOptions.CanBeFocused = False
      TabOrder = 1
      OnClick = btnOpenClick
    end
    object btnPreview: TcxButton
      Left = 164
      Top = 75
      Width = 193
      Height = 25
      Caption = 'Preview Report'
      TabOrder = 4
      OnClick = btnPreviewClick
    end
    object btnNew: TcxButton
      Left = 12
      Top = 12
      Width = 145
      Height = 25
      Caption = 'New Report'
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnSave: TcxButton
      Left = 164
      Top = 12
      Width = 193
      Height = 25
      Caption = 'Save Report'
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnDesign: TcxButton
      Left = 164
      Top = 44
      Width = 193
      Height = 24
      Caption = 'Design Report'
      TabOrder = 3
      OnClick = btnDesignClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      Hidden = True
      ItemIndex = 1
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
      Control = btnOpen
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liSave: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnSave'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDesign: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnShowDesigner'
      CaptionOptions.Visible = False
      Control = btnDesign
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liPreview: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnViewReport'
      CaptionOptions.Visible = False
      Control = btnPreview
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 193
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutLabeledItem1: TdxLayoutLabeledItem
      CaptionOptions.Text = 'Label'
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ItemIndex = 1
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ItemIndex = 2
      ShowBorder = False
      Index = 1
    end
  end
  object dxReport1: TdxReport
    Parameters = <>
    OnLayoutChanged = dxReport1LayoutChanged
    Left = 48
    Top = 214
  end
  object dxOpenFileDialog: TdxOpenFileDialog
    Filter = 'REPX (*.repx)|*.repx'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 152
    Top = 160
  end
  object dxSaveFileDialog: TdxSaveFileDialog
    DefaultExt = 'repx'
    Filter = 'REPX (*.repx)|*.repx'
    Left = 96
    Top = 160
  end
  object dxBackendDataConnectionManager1: TdxBackendDataConnectionManager
    Left = 48
    Top = 160
    object ReportsNWindConnectionString: TdxBackendDatabaseSQLConnection
      DisplayName = 'NWindConnectionString'
      ConnectionString = 
        'XpoProvider=SQLite; Data Source=|DataDirectory|\..\..\..\nwind.d' +
        'b; Mode=ReadOnly'
    end
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'WXI'
    Left = 96
    Top = 214
  end
end
