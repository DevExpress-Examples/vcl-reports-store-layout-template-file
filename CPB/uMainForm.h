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
#include "dxReport.Backend.hpp"
#include "dxReport.ConnectionString.JSON.DB.hpp"
#include "dxReport.ConnectionString.JSON.hpp"
#include "dxReport.hpp"
#include "dxScrollbarAnnotations.hpp"
#include <Data.DB.hpp>
#include <Vcl.Menus.hpp>
#include "dxmdaset.hpp"
#include "uData.h"
#include "dxShellDialogs.hpp"
#include <Vcl.Dialogs.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TcxButton *btnOpen;
	TcxButton *btnViewReport;
	TcxGrid *cxGrid1;
	TcxGridDBTableView *gvCategories;
	TcxGridDBColumn *gvCategoriesCategoryID;
	TcxGridDBColumn *gvCategoriesCategoryName;
	TcxGridDBColumn *gvCategoriesDescription;
	TcxGridDBTableView *gvProducts;
	TcxGridDBColumn *gvProductsProductID;
	TcxGridDBColumn *gvProductsProductName;
	TcxGridDBColumn *gvProductsSupplierID;
	TcxGridDBColumn *gvProductsCategoryID;
	TcxGridDBColumn *gvProductsQuantityPerUnit;
	TcxGridDBColumn *gvProductsUnitPrice;
	TcxGridDBColumn *gvProductsUnitsInStock;
	TcxGridDBColumn *gvProductsUnitsOnOrder;
	TcxGridDBColumn *gvProductsReorderLevel;
	TcxGridDBColumn *gvProductsDiscontinued;
	TcxGridDBColumn *gvProductsEAN13;
	TcxGridLevel *cxGrid1Level1;
	TcxGridLevel *cxGrid1Level2;
	TcxButton *btnNew;
	TdxReport *dxReport1;
	TdxReportDataConnectionManager *dxReportDataConnectionManager1;
	TdxReportDataSetJSONConnection *dxReportDataConnectionManager1dxReportDataSetJSONConnection1;
	TdxReportDataSetCollectionItem *itmProducts;
	TdxReportDataSetCollectionItem *itmCategories;
	TdxOpenFileDialog *dxOpenFileDialog;
	TdxSaveFileDialog *dxSaveFileDialog;
	TcxButton *btnSave;
	TcxButton *btnShowDesigner;
	void __fastcall btnNewClick(TObject *Sender);
	void __fastcall btnOpenClick(TObject *Sender);
	void __fastcall btnSaveClick(TObject *Sender);
	void __fastcall btnShowDesignerClick(TObject *Sender);
	void __fastcall btnViewReportClick(TObject *Sender);
	void __fastcall dxReport1LayoutChanged(TdxReport *ASender);
private:	// User declarations
protected:
    void __fastcall LoadData();
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
