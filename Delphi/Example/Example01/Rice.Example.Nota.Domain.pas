unit Rice.Example.Nota.Domain;

interface

uses
  Rice.MongoFramework.CustomAtributeEntity;

type
  [DocumentName('nottaass')]
  TNotas = class
  private
    FNota: Extended;
  public
    property Nota: Extended read FNota write FNota;
  end;

implementation

end.
