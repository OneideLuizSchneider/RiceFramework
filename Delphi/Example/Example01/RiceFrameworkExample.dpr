program RiceFrameworkExample;

uses
  Vcl.Forms,
  Rice.Example.View in 'Rice.Example.View.pas' {Form3},
  Rice.Example.Aluno.Domain in 'Rice.Example.Aluno.Domain.pas',
  MongoWire.bsonDoc in '..\..\TMongoWire\MongoWire.bsonDoc.pas',
  MongoWire.bsonUtils in '..\..\TMongoWire\MongoWire.bsonUtils.pas',
  MongoWire.mongoAuth in '..\..\TMongoWire\MongoWire.mongoAuth.pas',
  MongoWire.mongoID in '..\..\TMongoWire\MongoWire.mongoID.pas',
  MongoWire.mongoStream in '..\..\TMongoWire\MongoWire.mongoStream.pas',
  MongoWire.mongoWire in '..\..\TMongoWire\MongoWire.mongoWire.pas',
  MongoWire.simpleSock in '..\..\TMongoWire\MongoWire.simpleSock.pas',
  MongoWire.VBScript_RegExp_55_TLB in '..\..\TMongoWire\MongoWire.VBScript_RegExp_55_TLB.pas',
  Rice.MongoFramework.Connection in '..\..\Rice.MongoFramework.Connection.pas',
  Rice.MongoFramework.CustomAtributeEntity in '..\..\Rice.MongoFramework.CustomAtributeEntity.pas',
  Rice.MongoFramework.GenericDao in '..\..\Rice.MongoFramework.GenericDao.pas',
  Rice.MongoFramework.GenericEntity in '..\..\Rice.MongoFramework.GenericEntity.pas',
  Rice.MongoFramework.ObjectConversion in '..\..\Rice.MongoFramework.ObjectConversion.pas',
  Rice.Example.Aluno.DAO in 'Rice.Example.Aluno.DAO.pas',
  Rice.Example.Nota.Domain in 'Rice.Example.Nota.Domain.pas',
  Rice.MongoBuilder4D in '..\..\NoSQL4D\Rice.MongoBuilder4D.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
