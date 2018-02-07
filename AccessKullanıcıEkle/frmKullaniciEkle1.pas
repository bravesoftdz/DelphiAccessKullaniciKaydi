unit frmKullaniciEkle1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UniProvider,
  ODBCUniProvider, AccessUniProvider, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmKullaniciEkle = class(TForm)
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    AccessUniProvider1: TAccessUniProvider;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKullaniciEkle: TfrmKullaniciEkle;

implementation

{$R *.dfm}

procedure TfrmKullaniciEkle.Button1Click(Sender: TObject);
begin
 with UniQuery1 do
 begin
   try
    Connection := UniConnection1;   ///Hangi Connection ba�l� olmas� gerekti�ini belirtiyoruz.
    Close;                 //Ba�lant�y� kapat�yoruz
    SQL.Clear;              //SQL temizli�i yap�yoruz.
    SQL.Text := 'insert into KullaniciGiris(KAdi, KSifre) VALUES(:KAdi, :KSifre)'; //SQL kay�t sorgusunu yaz�yoruz.
    ParamByName('KAdi').Value := Edit1.Text;       //Parametre tan�m� yap�yoruz.
    ParamByName('KSifre').Value := Edit2.Text;     //Parametre tan�m� yap�yoruz.
    ExecSQL;                                       ///SQL sorgusunu �al��t�yoruz.
    ShowMessage('Kullan�c� kayd�n�z tamamlanm��t�r!');
   except
    ShowMessage('Kay�t yap�l�rken hata olu�tu!');
   end;
 end;
end;

procedure TfrmKullaniciEkle.FormShow(Sender: TObject);
begin
 with UniConnection1 do
 begin
   try
    ProviderName := 'Access'; //Hangi t�r veritaban� istedi�imiz belirtiyoruz.
    Database := ExtractFilePath(Application.ExeName) + 'data.mdb'; //veritaban� yolumuzu belirtiyoruz.
    Connected := True; //Ba�lant�y� a��yoruz.
    ShowMessage('Veritaban� ba�lant�s� sa�land�!');
   except
    ShowMessage('Veritaban� ba�lant� hatas�!');
   end;
 end;
end;

end.
