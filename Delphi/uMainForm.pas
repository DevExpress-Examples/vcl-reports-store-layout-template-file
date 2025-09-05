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
  dxReport.ConnectionString.JSON, Vcl.StdCtrls, dxmdaset, uData, dxShellDialogs;

type
  TMainForm = class(TForm)
    dxReport1: TdxReport;
    dxReportDataConnectionManager1: TdxReportDataConnectionManager;
    btnOpen: TcxButton;
    btnViewReport: TcxButton;
    dxReportDataConnectionManager1dxReportDataSetJSONConnection1: TdxReportDataSetJSONConnection;
    itmProducts: TdxReportDataSetCollectionItem;
    itmCategories: TdxReportDataSetCollectionItem;
    cxGrid1: TcxGrid;
    gvCategories: TcxGridDBTableView;
    gvCategoriesCategoryID: TcxGridDBColumn;
    gvCategoriesCategoryName: TcxGridDBColumn;
    gvCategoriesDescription: TcxGridDBColumn;
    gvProducts: TcxGridDBTableView;
    gvProductsProductID: TcxGridDBColumn;
    gvProductsProductName: TcxGridDBColumn;
    gvProductsSupplierID: TcxGridDBColumn;
    gvProductsCategoryID: TcxGridDBColumn;
    gvProductsQuantityPerUnit: TcxGridDBColumn;
    gvProductsUnitPrice: TcxGridDBColumn;
    gvProductsUnitsInStock: TcxGridDBColumn;
    gvProductsUnitsOnOrder: TcxGridDBColumn;
    gvProductsReorderLevel: TcxGridDBColumn;
    gvProductsDiscontinued: TcxGridDBColumn;
    gvProductsEAN13: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    btnNew: TcxButton;
    dxOpenFileDialog: TdxOpenFileDialog;
    dxSaveFileDialog: TdxSaveFileDialog;
    btnSave: TcxButton;
    btnShowDesigner: TcxButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnViewReportClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnShowDesignerClick(Sender: TObject);
    procedure dxReport1LayoutChanged(ASender: TdxReport);
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
  Caption := '';
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

procedure TMainForm.btnShowDesignerClick(Sender: TObject);
begin
  dxReport1.ShowDesigner;
end;

procedure TMainForm.btnViewReportClick(Sender: TObject);
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

end.
