unit Rice.Example.Aluno.Domain;

interface

Uses
  Rice.MongoFramework.CustomAtributeEntity,
  Rice.MongoFramework.GenericEntity,
  Rice.Example.Nota.Domain,
  System.SysUtils;

type

  // nome da classe de entidade
  [DocumentName('aluno')]
  TAluno = class(TGenericEntity)
  private
    FMatricula: string;
    FNotas: TNotas;
    FNome: string;
    FEndereco: string;
    FId: string;
  public
    [IdField('Id')]
    property Id:string read FId write FId;
    property Nome:string read FNome write FNome;
    property Endereco:string read FEndereco write FEndereco;
    property Matricula: string read FMatricula write FMatricula;
    property Notas: TNotas read FNotas write FNotas;

    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TAluno }

constructor TAluno.Create;
begin
  FNotas := TNotas.Create;
end;

destructor TAluno.Destroy;
begin
  FreeAndNil(FNotas);
  inherited;
end;



end.
