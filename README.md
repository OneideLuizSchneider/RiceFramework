# RiceFramework

O RiceFramework tem como Objetivo ajudar aqueles que desenvolvem algo para o MongoDB com o Delphi. Foi testado com as versões XE5, XE6 e XE7.
Onde como driver foi usado o TMongoWire.

Exemplos:

Classe TAluno, mas o nome da colecao no BD será 'aluno'. Pode-se notar que tambem esta anotada o IdField, que é anotado encima do campo que sera unico na base de dados.

  [DocumentName('aluno')]
  TAluno = class(TGenericEntity)
  private
    FMatricula: string;
    FNotas: TNotas;
    FNome: string;
    FEndereco: string;
    FId: string;
  public
    [IdField('id')]
    property Id:string read FId write FId;
    property Nome:string read FNome write FNome;
    property Endereco:string read FEndereco write FEndereco;
    property Matricula: string read FMatricula write FMatricula;
    property Notas: TNotas read FNotas write FNotas;

    constructor Create();
    destructor Destroy; override;
  end;

  
  o DAO, que herda do genericDAO as opcoes de CRUD :
  
  type
  TAlunoDAO = class(TGenericDAO)
  public
  end;
  
  E por fim como persistir o dados:
  
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
    TAlunoDAO.Insert<TAluno>(Aluno);
    showmessage('Aluno inserido!');
  except
    showmessage('Aluno não inserido!')
  end;
  Aluno.Free;