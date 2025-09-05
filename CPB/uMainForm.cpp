//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDataStorage"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxNavigator"
#pragma link "cxStyles"
#pragma link "dxDateRanges"
#pragma link "dxReport"
#pragma link "dxReport.Backend"
#pragma link "dxReport.ConnectionString.JSON"

#if defined(_WIN64)
  #pragma link "dxReport.ConnectionString.JSON.DB.O"
#else
  #pragma link "dxReport.ConnectionString.JSON.DB.OBJ"
#endif


#pragma link "dxScrollbarAnnotations"
#pragma link "dxmdaset"
#pragma link "dxShellDialogs"
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{

}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------

void __fastcall TMainForm::btnNewClick(TObject *Sender)
{
    Caption = "";
    dxReport1->ReportName = "";
    dxReport1->ShowDesigner();
}

void __fastcall TMainForm::btnOpenClick(TObject *Sender)
{
    if (dxOpenFileDialog->Execute())
    {
        Caption = ChangeFileExt(ExtractFileName(dxOpenFileDialog->FileName), "");
        dxReport1->ReportName = Caption;
        dxReport1->Layout->LoadFromFile(dxOpenFileDialog->FileName);
    }
}

void __fastcall TMainForm::btnSaveClick(TObject *Sender)
{
    if (dxReport1->ReportName == "")
    {
        ShowMessage("Report is not specified");
        return;
    }

    if (dxSaveFileDialog->Execute())
    {
        dxReport1->ReportName = ChangeFileExt(ExtractFileName(dxSaveFileDialog->FileName), "");
        Caption = dxReport1->ReportName;
		dxReport1->Layout->SaveToFile(dxSaveFileDialog->FileName);
    }
}

void __fastcall TMainForm::btnShowDesignerClick(TObject *Sender)
{
    dxReport1->ShowDesigner();
}

void __fastcall TMainForm::btnViewReportClick(TObject *Sender)
{
    if (dxReport1->ReportName == "")
    {
        ShowMessage("Report is not specified");
        return;
    }
    dxReport1->ShowViewer();
}

void __fastcall TMainForm::dxReport1LayoutChanged(TdxReport *ASender)
{
    Caption = dxReport1->ReportName;
}

//---------------------------------------------------------------------------

