unit Rice.MongoFramework.CustomAtributeEntity;

interface

// atributo para determinar o nome da cole��o na entidade a ser usada
// nome da cole��o
type 
  DocumentName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

// determinar _id da cole��o
type
  IdField = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

// nome do campo na cole��o
type 
  FieldName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

implementation

constructor DocumentName.Create(aName: String);
begin
  FName := aName
end;

constructor IdField.Create(aName: String);
begin
  FName := aName;
end;

constructor FieldName.Create(aName: String);
begin
  FName := aName;
end;

end.
