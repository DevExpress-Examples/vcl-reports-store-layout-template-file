program ReportStoreToFile;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  ReportStoreToFile.dxSettings in 'ReportStoreToFile.dxSettings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DevExpress Example';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
