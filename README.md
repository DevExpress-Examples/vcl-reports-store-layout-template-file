<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/1051124732/25.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T1306454)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->

# DevExpress VCL Reports – Import and Save Report Layouts to XML Files

This example uses XML-based REPX files as [report layout](https://docs.devexpress.com/VCL/dxReport.TdxReport.Layout) storage.
Run the app and execute the following actions:

-   Customize our predefined layout and save it to a new file.
-   Create a new report layout and save it to a file.
-   Import a report layout you created earlier from a file.

<img width="450" src="./images/app.png" alt="An application with buttons to create a new report, import and save reports, open a report designer and report viewer" />


## Prerequisites

See: [DevExpress Reports Prerequisites](https://docs.devexpress.com/VCL/405469/ExpressReports/vcl-reports#expressreports-prerequisites)


## Implementation Details

### Import a Report Layout from a File

To import (load) a report layout from a file, call the 
[`Layout.LoadFromFile`](https://docwiki.embarcadero.com/Libraries/Athens/en/System.Classes.TStrings.LoadFromFile)
method and assign a name to the
[`ReportName`](https://docs.devexpress.com/VCL/dxReport.TdxReport.ReportName) property: 

**Delphi:**
```delphi
procedure TMainForm.ImportReport(const AFileName: string);
begin
    // Import a report layout from a file
    dxReport1.Layout.LoadFromFile(AFileName);
    // Assign the file's name as an internal report name
    dxReport1.ReportName := ChangeFileExt(ExtractFileName(AFileName), '');
end;
```

**C++Builder:**
```cpp
void __fastcall TMainForm::ImportReport(const String &FileName)
{
    // Import a report layout from a file
    dxReport1->Layout->LoadFromFile(FileName);
    // Assign the file's name as an internal report name
    dxReport1->ReportName = ChangeFileExt(ExtractFileName(FileName), "");
}
```

> [!Note]
> An internal report name may differ from the source REPX file name.


### Save a Report Layout to a File

To save the current report layout to a file, call the 
[`Layout.SaveToFile`](https://docwiki.embarcadero.com/Libraries/Athens/en/System.Classes.TStrings.SaveToFile) method:

**Delphi:**
```delphi
procedure TMainForm.SaveReport(const AFileName: string);
begin
    // Save the report layout to a file
    dxReport1.Layout.SaveToFile(AFileName);
end;
```

**C++Builder:**
```cpp
void __fastcall TMainForm::SaveReport(const String &FileName)
{
    // Save the report layout to a file
    dxReport1->Layout->SaveToFile(FileName);
}
```

> [!Note]
> Internal report names are not stored in REPX files.


## Test the Example

### Modify the Pre-loaded Layout and Save to a New File

The example application loads a predefined layout at startup: `TableReport.repx`.
You can modify this preloaded report layout and then save changes to a REPX file.

1.  Build and run the sample application. 
    Note the preloaded layout's name in the application's caption.
2.  Click **Open Designer** to edit the loaded layout in the DevExpress
    [Report Designer](https://docs.devexpress.com/XtraReports/119176/web-reporting/web-end-user-report-designer).
    Modify the layout as you see fit.
3.  Once you have made changes in the **Report Designer** dialog, click the hamburger button, select **Save**, and close the dialog.
4.  Click **Save to File** to save the report layout to a REPX file.
    You can overwrite an existing file or create a new file.
5.  Restart the application and click **Import from File** to import a report layout from the previously saved REPX file.
6.  Click **Open Viewer** to display the imported layout in the DevExpress
    [Report Viewer](https://docs.devexpress.com/XtraReports/401850/web-reporting/web-document-viewer).


### Create, Design, and Save a New Layout

You can design a new layout from scratch and then save it to a REPX file:

1.  Build and run the sample application.
2.  Click **Create New** to open a new blank report layout in the DevExpress
    [Report Designer](https://docs.devexpress.com/XtraReports/119176/web-reporting/web-end-user-report-designer).
3.  Design the report layout (template) using tools available in the **Report Designer**.
4.  Once you have made all necessary changes in the **Report Designer** dialog, click the hamburger button, select **Save**, and enter a report layout name.
    Click **Save** and close the dialog.
5.  Click **Save to File** to save the report layout to a REPX file.
6.  Restart the application and click **Import from File** to import a report layout from the previously saved REPX file.
7.  Click **Open Viewer** to display the imported layout in the DevExpress
    [Report Viewer](https://docs.devexpress.com/XtraReports/401850/web-reporting/web-document-viewer).


## Documentation and Examples

-   [Introduction to VCL Reports](https://docs.devexpress.com/VCL/405469/ExpressReports/vcl-reports)
-   [How to store report layouts in REPX files at design-time](https://docs.devexpress.com/VCL/dxReport.TdxReport.Layout#string-list-editor)
-   [How to store report layouts in a database (example application)](https://github.com/DevExpress-Examples/vcl-reports-store-layout-template-database)
-   [How to use SQLite as a data source for reports (as demonstrated in this example)](https://docs.devexpress.com/VCL/405750/ExpressCrossPlatformLibrary/vcl-backend/database-engines/vcl-backend-sqlite-support)
-   [TdxReport.Layout Property API reference](https://docs.devexpress.com/VCL/dxReport.TdxReport.Layout)
-   [TdxBackendDatabaseSQLConnection Component API reference](https://docs.devexpress.com/VCL/dxBackend.ConnectionString.SQL.TdxBackendDatabaseSQLConnection)


<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-reports-store-layout-template-file&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-reports-store-layout-template-file&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
