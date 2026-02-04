unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxClasses, dxReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,  cxButtons,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.StdCtrls, dxmdaset, dxShellDialogs,
  dxLayoutControlAdapters, dxLayoutContainer,
  dxLayoutControl, dxCore, dxSkinsForm, System.ImageList, Vcl.ImgList,
  cxImageList, dxBackend, dxBackend.ConnectionString.SQL;

type
  TMainForm = class(TForm)
    dxReport1: TdxReport;
    btnImport: TcxButton;
    btnPreview: TcxButton;
    btnNew: TcxButton;
    dxOpenFileDialog: TdxOpenFileDialog;
    dxSaveFileDialog: TdxSaveFileDialog;
    btnSaveToFile: TcxButton;
    btnDesign: TcxButton;
    dxBackendDataConnectionManager: TdxBackendDataConnectionManager;
    ReportsNWindConnectionString: TdxBackendDatabaseSQLConnection;
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
    procedure btnImportClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnDesignClick(Sender: TObject);
    procedure dxReport1LayoutChanged(ASender: TdxReport);
    procedure FormCreate(Sender: TObject);
    procedure ImportReport(const AFileName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  BASE_CAPTION = 'DevExpress Example — ';

procedure TMainForm.ImportReport(const AFileName: string);
begin
  if FileExists(AFileName) then
  begin
    // Import a report layout from a file
    dxReport1.Layout.LoadFromFile(AFileName);
    // Assign the file's name as an internal report name
    dxReport1.ReportName := ChangeFileExt(ExtractFileName(AFileName), '');
    // Update the form caption based on the report name
    Caption := BASE_CAPTION + dxReport1.ReportName;
  end
  else
  begin
    ShowMessage('The specified file could not be found: ' + AFileName);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
const
  // Assumes that the compiled executable is located in ./Delphi/Win*/[Debug|Release]/
  AFileName = '..\..\..\Table Report.repx';
begin
  ImportReport(AFileName);
end;

procedure TMainForm.btnNewClick(Sender: TObject);
begin
  Caption := BASE_CAPTION + 'New Report Layout';
  dxReport1.ReportName := '';
  dxReport1.ShowDesigner;
end;

procedure TMainForm.btnImportClick(Sender: TObject);
begin
  if dxOpenFileDialog.Execute then
    ImportReport(dxOpenFileDialog.FileName);
end;


procedure TMainForm.btnSaveToFileClick(Sender: TObject);
begin
  if dxReport1.ReportName = '' then
  begin
    ShowMessage('No report is currently open. Please import or create a new report before saving.');
    Exit;
  end;
  // Suggest a file name based on the report name
  dxSaveFileDialog.FileName := dxReport1.ReportName;
  if dxSaveFileDialog.Execute then
  begin
    // Update the report name based on the selected file name
    dxReport1.ReportName := ChangeFileExt(ExtractFileName(dxSaveFileDialog.FileName), '');
    // Save the report layout to a file
    dxReport1.Layout.SaveToFile(dxSaveFileDialog.FileName);
    // Update the form caption based on the report name
    Caption := BASE_CAPTION + dxReport1.ReportName;
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
    ShowMessage('No report is currently open. Please import or create a new report before previewing.');
    Exit;
  end;
  dxReport1.ShowViewer;
end;

procedure TMainForm.dxReport1LayoutChanged(ASender: TdxReport);
begin
  Caption := BASE_CAPTION + dxReport1.ReportName;
end;

end.
