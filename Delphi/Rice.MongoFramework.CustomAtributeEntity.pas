unit Rice.MongoFramework.CustomAtributeEntity;

interface

// atributo para determinar o nome da coleção na entidade a ser usada
// nome da coleção
type 
  DocumentName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

// determinar _id da coleção
type
  IdField = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

// nome do campo na coleção
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
