unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxClasses, dxReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,  cxButtons,
  dxReport.Backend, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxReport.ConnectionString.JSON.DB,
  dxReport.ConnectionString.JSON, Vcl.StdCtrls, dxmdaset, dxShellDialogs,
  dxReport.ConnectionString.SQL, dxLayoutControlAdapters, dxLayoutContainer,
  dxLayoutControl, dxCore, dxSkinsForm, System.ImageList, Vcl.ImgList,
  cxImageList;

type
  TMainForm = class(TForm)
    dxReport1: TdxReport;
    btnOpen: TcxButton;
    btnPreview: TcxButton;
    btnNew: TcxButton;
    dxOpenFileDialog: TdxOpenFileDialog;
    dxSaveFileDialog: TdxSaveFileDialog;
    btnSave: TcxButton;
    btnDesign: TcxButton;
    dxReportDataConnectionManager: TdxReportDataConnectionManager;
    ReportsNWindConnectionString: TdxReportDatabaseSQLConnection;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    liNew: TdxLayoutItem;
    liOpen: TdxLayoutItem;
    liSave: TdxLayoutItem;
    liDesign: TdxLayoutItem;
    liPreview: TdxLayoutItem;
    dxSkinController1: TdxSkinController;
    dxLayoutLabeledItem1: TdxLayoutLabeledItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    procedure btnOpenClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure dxReport1LayoutChanged(ASender: TdxReport);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnNewClick(Sender: TObject);
begin
  Caption := '*';
  dxReport1.ReportName := '';
  dxReport1.ShowDesigner;
end;

procedure TMainForm.btnOpenClick(Sender: TObject);
begin
  if dxOpenFileDialog.Execute then
  begin
    Caption := ChangeFileExt(ExtractFileName(dxOpenFileDialog.FileName), '');
    dxReport1.ReportName := Caption;
    dxReport1.Layout.LoadFromFile(dxOpenFileDialog.FileName);
  end;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
begin
  if dxReport1.ReportName = '' then
  begin
    ShowMessage('Report is not specified');
    Exit;
  end;

  if dxSaveFileDialog.Execute then
  begin
    dxReport1.ReportName := ChangeFileExt(ExtractFileName(dxSaveFileDialog.FileName), '');
    Caption := dxReport1.ReportName;
    dxReport1.Layout.SaveToFile(dxSaveFileDialog.FileName);
  end;
end;

procedure TMainForm.btnDesignClick(Sender: TObject);
begin
  dxReport1.ShowDesigner;
end;

procedure TMainForm.btnPreviewClick(Sender: TObject);
begin
  if (dxReport1.ReportName = '')  then
  begin
    ShowMessage('Report is not specified');
    Exit;
  end;
  dxReport1.ShowViewer;
end;

procedure TMainForm.dxReport1LayoutChanged(ASender: TdxReport);
begin
  Caption := dxReport1.ReportName;
end;

procedure TMainForm.FormCreate(Sender: TObject);
const
  AFileName = '..\..\..\TableReport.repx';
begin
  if FileExists(AFileName) then
  begin
    dxReport1.ReportName := 'TableReport';
    dxReport1.Layout.LoadFromFile(AFileName);
  end;
end;

end.
