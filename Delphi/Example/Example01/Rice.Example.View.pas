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
  Rice.Example.Aluno.DAO, Rice.MongoBuilder4D;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btn1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    dtsDados: TFDMemTable;
    dtsDadosId: TStringField;
    dtsDadosNome: TStringField;
    dtsDadosEndereco: TStringField;
    dtsDadosNota: TFloatField;
    DataSource1: TDataSource;
    dbgrd1: TDBGrid;
    dtsDadosMatricula: TStringField;
    dbedtId: TDBEdit;
    dbedtNome: TDBEdit;
    dbedtMatricula: TDBEdit;
    dbedtEndereco: TDBEdit;
    dbedtNota: TDBEdit;
    btn2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btn10Click(Sender: TObject);
Var
  Aluno: TAluno;
begin

  Aluno := TAluno.Create();
  Aluno.Id := mongoObjectId;
  Aluno.Nome := dtsDadosNome.AsString;
  Aluno.Endereco := dtsDadosEndereco.AsString;
  Aluno.Matricula := dtsDadosMatricula.AsString;
  Aluno.Notas.Nota := dtsDadosNota.AsFloat;

  try
    TAlunoDAO.Insert(Aluno);
    showmessage('Aluno inserido!');
  except
    showmessage('Aluno não inserido!')
  end;

  Aluno.Free;

end;

procedure TForm3.btn11Click(Sender: TObject);
begin
  if (MessageDlg('Confirma a Exclusão ', mtConfirmation, [mbYes, mbNo], 1) = mrYes)  then
    TAlunoDAO.Delete<TAluno>(dtsDadosId.AsString);
end;

procedure TForm3.btn1Click(Sender: TObject);
// var
// v: TObjectList<TAluno>;
// aluno: TAluno;
// r: TAluno;
begin

  // v := TAlunoDAO.GetByID<TAluno>();

end;

procedure TForm3.btn2Click(Sender: TObject);
Var
  Aluno: TAluno;
begin
  Aluno := TAlunoDAO.GetByID<TAluno>(dtsDadosId.AsString);

  dtsDados.EmptyDataSet;
  dtsDados.Insert;
  dtsDadosId.AsString := Aluno.Id;
  dtsDadosNome.AsString := Aluno.Nome;
  dtsDadosEndereco.AsString := Aluno.Endereco;
  dtsDadosMatricula.AsString := Aluno.Matricula;
  dtsDadosNota.AsFloat := Aluno.Notas.Nota;
  dtsDados.Post;
  Aluno.Free;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  Memo1.Lines.Add(MongoDB.Where('valor').gt(30).ToString);
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
  Memo1.Lines.Add(MongoDB.Where.Column('valor').gte(50).ToString);
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
  Memo1.Lines.Add(MongoDB.Where('quantidade').lt(100).ToString);
end;

procedure TForm3.btn6Click(Sender: TObject);
begin
  Memo1.Lines.Add(MongoDB.Where('quantidade').lte(100).ToString);
end;

procedure TForm3.btn7Click(Sender: TObject);
begin
  Memo1.Lines.Add(

    MongoDB.Insert
      .ColumnValue('name', 'Oneide')
      .ColumnValue('idade', 27)
      .ColumnValue('email', 'oneide@oneide.com.br')
      .ColumnValue('endereco', 'av. sul brasil 383')
      .ColumnValue('salario', 500.55)
      .ToString

    );

end;

procedure TForm3.btn8Click(Sender: TObject);
begin

  Memo1.Lines.Add(
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

procedure TForm3.btn9Click(Sender: TObject);
begin
  Memo1.Lines.Add(
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

procedure TForm3.Button1Click(Sender: TObject);
Var
  Aluno: TAluno;
begin

  Aluno := TAluno.Create();
  Aluno.Id := dtsDadosId.AsString;
  Aluno.Nome := dtsDadosNome.AsString;
  Aluno.Endereco := dtsDadosEndereco.AsString;
  Aluno.Matricula := dtsDadosMatricula.AsString;
  Aluno.Notas.Nota := dtsDadosNota.AsFloat;

  try
    TAlunoDAO.SaveOrUpdate(Aluno);
    showmessage('Aluno inserido!');
  except
    showmessage('Aluno não inserido!')
  end;

  Aluno.Free;

end;

procedure TForm3.Button2Click(Sender: TObject);
var
  vObjetos: TObjectList<TAluno>;
  Aluno: TAluno;
begin
  if (dtsDados.Active) then
    dtsDados.EmptyDataSet
  else
    dtsDados.CreateDataSet;

  vObjetos := TAlunoDAO.GetAll<TAluno>();

  for Aluno in vObjetos do
  begin
    dtsDados.Insert;
    dtsDadosId.AsString := Aluno.Id;
    dtsDadosNome.AsString := Aluno.Nome;
    dtsDadosMatricula.AsString := Aluno.Matricula;
    dtsDadosEndereco.AsString := Aluno.Endereco;
    dtsDadosNota.AsFloat := Aluno.Notas.Nota;
    dtsDados.Post;
  end;

  FreeAndNil(vObjetos);

end;

procedure TForm3.Button3Click(Sender: TObject);
begin

  Memo1.Lines.Add(MongoDB.Where.Column('nome').ne('ONEIDE').ToString);

end;

procedure TForm3.FormShow(Sender: TObject);
begin
  if (dtsDados.Active) then
    dtsDados.EmptyDataSet
  else
    dtsDados.CreateDataSet;
end;

end.
