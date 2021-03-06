# RiceFramework

The RiceFramework aims to help those who develop something for MongoDB with Delphi. It has been tested with versions XE5, XE6, XE7 and Berlin 10.1. Where as driver was used TMongoWire(https://github.com/stijnsanders/TMongoWire).

Examples:

**Class TAluno**

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

 **DAO** 
       
        
        type
        TAlunoDAO = class(TGenericDAO)
        public
        end;
  
  
**Insert**  

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

**Delete**

        TAlunoDAO.Delete<TAluno>(dtsDadosId.AsString);
        
**Update**

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
          
**GetAll**

        var
           vObjetos: TObjectList<TAluno>;
        begin   
           vObjetos := TAlunoDAO.GetAll<TAluno>();
           for Aluno in vObjetos do
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

**GetByID**

        Var
          Aluno: TAluno;
        begin
          Aluno := TAlunoDAO.GetByID<TAluno>(dtsDadosId.AsString);
        end;  
