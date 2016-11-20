unit Rice.Example.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  System.StrUtils,
  System.TypInfo,
  System.Rtti,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  MongoWire.mongoID,
  MongoWire.bsonUtils,
  Rice.MongoFramework.Connection,
  MongoWire.bsonDoc,
  REST.Json,
  MongoWire.MongoWire,
  Generics.Collections,
  MongoWire.mongoAuth,
  Rice.Example.Aluno.Domain,
  Rice.Example.Aluno.DAO, Rice.MongoBuilder4D, Vcl.ComCtrls;

type
  TFormMainTest = class(TForm)
    dtsData: TFDMemTable;
    dtsDataId: TStringField;
    dtsDataNome: TStringField;
    dtsDataEndereco: TStringField;
    dtsDataNota: TFloatField;
    DataSource1: TDataSource;
    dtsDataMatricula: TStringField;
    lbl2: TLabel;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    mmoResult: TMemo;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btn12: TButton;
    btn13: TButton;
    btn1: TButton;
    dbedtId: TDBEdit;
    dbedtNome: TDBEdit;
    dbedtMatricula: TDBEdit;
    dbedtEndereco: TDBEdit;
    dbedtNota: TDBEdit;
    btn2: TButton;
    btn10: TButton;
    btn11: TButton;
    lbl1: TLabel;
    btn14: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    lbl7: TLabel;
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainTest: TFormMainTest;

implementation

{$R *.dfm}

procedure TFormMainTest.btn10Click(Sender: TObject);
Var
  Aluno: TAluno;
begin

  Aluno := TAluno.Create();
  Aluno.Id := mongoObjectId;
  Aluno.Nome := dtsDataNome.AsString;
  Aluno.Endereco := dtsDataEndereco.AsString;
  Aluno.Matricula := dtsDataMatricula.AsString;
  Aluno.Notas.Nota := dtsDataNota.AsFloat;

  try
    TAlunoDAO.Insert(Aluno);
    showmessage('Student insert!');
  except
    showmessage('Student not insert!')
  end;

  Aluno.Free;

end;

procedure TFormMainTest.btn11Click(Sender: TObject);
begin
  if (MessageDlg('Confirm Deletion ', mtConfirmation, [mbYes, mbNo], 1) = mrYes)  then
    TAlunoDAO.Delete<TAluno>(dtsDataId.AsString);
end;

procedure TFormMainTest.btn1Click(Sender: TObject);
// var
// v: TObjectList<TAluno>;
// aluno: TAluno;
// r: TAluno;
begin

  // v := TAlunoDAO.GetByID<TAluno>();

end;

procedure TFormMainTest.btn2Click(Sender: TObject);
Var
  Aluno: TAluno;
begin
  Aluno := TAlunoDAO.GetByID<TAluno>(dtsDataId.AsString);

  dtsData.EmptyDataSet;
  dtsData.Insert;
  dtsDataId.AsString := Aluno.Id;
  dtsDataNome.AsString := Aluno.Nome;
  dtsDataEndereco.AsString := Aluno.Endereco;
  dtsDataMatricula.AsString := Aluno.Matricula;
  dtsDataNota.AsFloat := Aluno.Notas.Nota;
  dtsData.Post;
  Aluno.Free;
end;

procedure TFormMainTest.btn3Click(Sender: TObject);
begin
  mmoResult.Lines.Add(MongoDB.Where('valor').gt(30).ToString);
end;

procedure TFormMainTest.btn4Click(Sender: TObject);
begin
  mmoResult.Lines.Add(MongoDB.Where.Column('valor').gte(50).ToString);
end;

procedure TFormMainTest.btn5Click(Sender: TObject);
begin
  mmoResult.Lines.Add(MongoDB.Where('quantidade').lt(100).ToString);
end;

procedure TFormMainTest.btn6Click(Sender: TObject);
begin
  mmoResult.Lines.Add(MongoDB.Where('quantidade').lte(100).ToString);
end;

procedure TFormMainTest.btn7Click(Sender: TObject);
begin
  mmoResult.Lines.Add(

    MongoDB.Insert
      .ColumnValue('name', 'Oneide')
      .ColumnValue('idade', 27)
      .ColumnValue('email', 'oneide@oneide.com.br')
      .ColumnValue('endereco', 'av. sul brasil 383')
      .ColumnValue('salario', 500.55)
      .ToString

    );

end;

procedure TFormMainTest.btn8Click(Sender: TObject);
begin

  mmoResult.Lines.Add(
    MongoDB.Query.Criteria(
      MongoDB.Where.Column('valor').Equal(100)
      .Column('cliente').Equal('ONEIDEE')
      .andOperator(
        MongoDB.Where('valor').lt(100).gt(30)
      )
      .orOperator(
        MongoDB.Where('quantidade').lt(100).gt(30)
      )
    ).ToString);

end;

procedure TFormMainTest.btn9Click(Sender: TObject);
begin
  mmoResult.Lines.Add(
    MongoDB.Query.Criteria(
      MongoDB.Update.Where(
        MongoDB.Where.Column('valor').Equal(100)
        .Column('cliente').Equal('ONEIDEE')
        .andOperator(MongoDB.Where('valor').lt(100).gt(30))
        .orOperator(
          MongoDB.Where('quantidade').lt(100).gt(30))
        )
        .ColumnValue('nome', 'Oneide Luiz Schneider')
        .ColumnValue('email', 'Oneide@oneide')
        .ColumnValue('idade', 27)
        .Multi(True)
    ).ToString);
end;

procedure TFormMainTest.btn12Click(Sender: TObject);
Var
  Aluno: TAluno;
begin

  Aluno := TAluno.Create();
  Aluno.Id := dtsDataId.AsString;
  Aluno.Nome := dtsDataNome.AsString;
  Aluno.Endereco := dtsDataEndereco.AsString;
  Aluno.Matricula := dtsDataMatricula.AsString;
  Aluno.Notas.Nota := dtsDataNota.AsFloat;

  try
    TAlunoDAO.SaveOrUpdate(Aluno);
    showmessage('Student insert!');
  except
    showmessage('Student not insert!')
  end;

  Aluno.Free;

end;

procedure TFormMainTest.btn13Click(Sender: TObject);
var
  vObjetos: TObjectList<TAluno>;
  Aluno: TAluno;
begin
  if (dtsData.Active) then
    dtsData.EmptyDataSet
  else
    dtsData.CreateDataSet;

  vObjetos := TAlunoDAO.GetAll<TAluno>();

  for Aluno in vObjetos do
  begin
    dtsData.Insert;
    dtsDataId.AsString := Aluno.Id;
    dtsDataNome.AsString := Aluno.Nome;
    dtsDataMatricula.AsString := Aluno.Matricula;
    dtsDataEndereco.AsString := Aluno.Endereco;
    dtsDataNota.AsFloat := Aluno.Notas.Nota;
    dtsData.Post;
  end;

  FreeAndNil(vObjetos);

end;

procedure TFormMainTest.btn14Click(Sender: TObject);
begin

  mmoResult.Lines.Add(MongoDB.Where.Column('nome').ne('ONEIDE').ToString);

end;

procedure TFormMainTest.FormShow(Sender: TObject);
begin
  if (dtsData.Active) then
    dtsData.EmptyDataSet
  else
    dtsData.CreateDataSet;
end;

end.
