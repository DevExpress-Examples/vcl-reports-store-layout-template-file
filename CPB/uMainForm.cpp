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

#pragma link "dxScrollbarAnnotations"
#pragma link "dxmdaset"
#pragma link "dxShellDialogs"

#pragma link "dxCore"
#pragma link "dxLayoutContainer"
#pragma link "dxLayoutControl"
#pragma link "dxLayoutControlAdapters"
#pragma link "dxSkinsForm"

#pragma link "dxBackend"

#if defined(_WIN64)
  #pragma link "dxBackend.ConnectionString.SQL.O"
#else
  #pragma link "dxBackend.ConnectionString.SQL.OBJ"
#endif


#pragma resource "*.dfm"
TMainForm *MainForm;

const String BASE_CAPTION = "DevExpress Example — ";

__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{
}

void __fastcall TMainForm::ImportReport(const String &FileName)
{
    if (FileExists(FileName))
    {
		// Load a report layout from a file
        dxReport1->Layout->LoadFromFile(FileName);
        // Assign the loaded file's name as an internal report name
        dxReport1->ReportName = ChangeFileExt(ExtractFileName(FileName), "");
        // Update the form caption based on the report name
        Caption = BASE_CAPTION + dxReport1->ReportName;
    }
    else
    {
        ShowMessage("The specified file could not be found: " + FileName);
    }
}

void __fastcall TMainForm::FormCreate(TObject *Sender)
{
    // Assumes that the compiled executable is located in ./Delphi/Win*/[Debug|Release]/
    const String AFileName = "..\\..\\..\\Table Report.repx";
    ImportReport(AFileName);
}

void __fastcall TMainForm::btnNewClick(TObject *Sender)
{
    Caption = BASE_CAPTION + "New Report Layout";
    dxReport1->ReportName = "";
    dxReport1->ShowDesigner();
}

void __fastcall TMainForm::btnImportClick(TObject *Sender)
{
    if (dxOpenFileDialog->Execute())
    {
        ImportReport(dxOpenFileDialog->FileName);
    }
}

void __fastcall TMainForm::btnSaveToFileClick(TObject *Sender)
{
    if (dxReport1->ReportName.IsEmpty())
    {
        ShowMessage("No report is currently open. Please import or create a new report before exporting.");
        return;
    }
    // Suggest a file name based on the report name
    dxSaveFileDialog->FileName = dxReport1->ReportName;
    if (dxSaveFileDialog->Execute())
    {   
        // Update the report name based on the selected file name
        dxReport1->ReportName = ChangeFileExt(ExtractFileName(dxSaveFileDialog->FileName), "");
        // Save the report layout to a file
        dxReport1->Layout->SaveToFile(dxSaveFileDialog->FileName);
        // Update the form caption based on the report name
        Caption = BASE_CAPTION + dxReport1->ReportName;
    }
}

void __fastcall TMainForm::btnDesignClick(TObject *Sender)
{
	dxReport1->ShowDesigner();
}

void __fastcall TMainForm::btnPreviewClick(TObject *Sender)
{
    if (dxReport1->ReportName == "")
    {
        ShowMessage("No report is currently loaded. Please load or create a report before previewing.");
        return;
    }
    dxReport1->ShowViewer();
}
void __fastcall TMainForm::dxReport1LayoutChanged(TdxReport *ASender)
{
    Caption = BASE_CAPTION + dxReport1->ReportName;
}

