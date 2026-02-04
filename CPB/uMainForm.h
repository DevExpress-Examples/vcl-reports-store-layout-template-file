//---------------------------------------------------------------------------

#ifndef uMainFormH
#define uMainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "cxButtons.hpp"
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxLookAndFeels.hpp"
#include "cxNavigator.hpp"
#include "cxStyles.hpp"
#include "dxDateRanges.hpp"
#include "dxReport.hpp"
#include "dxScrollbarAnnotations.hpp"
#include <Data.DB.hpp>
#include <Vcl.Menus.hpp>
#include "dxmdaset.hpp"
#include "dxShellDialogs.hpp"
#include <Vcl.Dialogs.hpp>
#include "dxCore.h"
#include "dxLayoutContainer.hpp"
#include "dxLayoutControl.hpp"
#include "dxLayoutControlAdapters.hpp"
#include "dxSkinsForm.hpp"
#include "dxBackend.ConnectionString.SQL.hpp"
#include "dxBackend.hpp"  // Declares the TdxBackendDatabaseSQLConnection component
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TdxLayoutControl *dxLayoutControl1;
	TcxButton *btnImport;
	TcxButton *btnPreview;
	TcxButton *btnNew;
	TcxButton *btnSaveToFile;
	TcxButton *btnDesign;
	TdxLayoutGroup *dxLayoutControl1Group_Root;
	TdxLayoutItem *liNew;
	TdxLayoutItem *liOpen;
	TdxLayoutItem *liSave;
	TdxLayoutItem *liDesign;
	TdxLayoutItem *liPreview;
	TdxLayoutLabeledItem *dxLayoutLabeledItem1;
	TdxLayoutGroup *dxLayoutGroup1;
	TdxLayoutGroup *dxLayoutGroup2;
	TdxReport *dxReport1;
	TdxOpenFileDialog *dxOpenFileDialog;
	TdxSaveFileDialog *dxSaveFileDialog;
	TdxBackendDataConnectionManager *dxBackendDataConnectionManager;
	TdxBackendDatabaseSQLConnection *ReportsNWindConnectionString;
	TdxSkinController *dxSkinController1;
	void __fastcall btnNewClick(TObject *Sender);
	void __fastcall btnImportClick(TObject *Sender);
	void __fastcall btnSaveToFileClick(TObject *Sender);
	void __fastcall dxReport1LayoutChanged(TdxReport *ASender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall btnDesignClick(TObject *Sender);
	void __fastcall btnPreviewClick(TObject *Sender);
private:	// User declarations
protected:
    void __fastcall LoadData();
    void __fastcall ImportReport(const String &FileName);
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
