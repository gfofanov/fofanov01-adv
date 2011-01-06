{*****************************************************************************
 *
 * Project  :
 * Unit Name: Reports
 * Purpose  : ־עקועû
 * Create   :
 * History  :
 *
 *****************************************************************************}

unit Reports;

interface

uses
  SysUtils, Classes, DB, frxClass, frxDBSet, frxExportXLS,
  frxDMPExport, frxExportDBF, frxExportODF, frxExportMail, frxExportImage,
  frxExportRTF, frxExportXML, frxExportHTML, frxExportPDF;

type
  TdmReport = class(TDataModule)
    dsReport: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxMailExport1: TfrxMailExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxDBFExport1: TfrxDBFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReport: TdmReport;

implementation

uses DataModule;

{$R *.dfm}

end.
