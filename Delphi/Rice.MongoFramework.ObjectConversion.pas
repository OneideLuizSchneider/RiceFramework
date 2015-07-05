unit Rice.MongoFramework.ObjectConversion;

interface

uses
  System.Classes,
  MongoWire.bsonUtils,
  MongoWire.bsonDoc,
  REST.JSON;

type

  TObjectToBson = class
  public
    class function Convert<T: class>(Obj: T): IBSONDocument;
  end;

  TJsonToObject = class
  public
    class function Convert(const Obj: string): TObject;
  end;

  TJsonToBson = class
  public
    class function Convert(const Obj: string): IBSONDocument;
  end;

implementation

{ TObjectToBson }

class function TObjectToBson.Convert<T>(Obj: T): IBSONDocument;
begin
  Result := JsonToBson(TJson.ObjectToJsonString(TObject(Obj)));
end;

{ TJsonToObject }

class function TJsonToObject.Convert(const Obj: string): TObject;
begin
  Result := TJson.JsonToObject<TObject>((Obj))
end;

{ TJsonToBson }

class function TJsonToBson.Convert(const Obj: string): IBSONDocument;
begin
  Result := JsonToBson(Obj);
end;

end.
