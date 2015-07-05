unit Rice.MongoFramework.GenericDao;

interface

Uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  REST.JSON,
  Generics.Collections,
  Rice.MongoFramework.Connection,
  Rice.MongoFramework.CustomAtributeEntity,
  Rice.MongoFramework.ObjectConversion,
  MongoWire.bsonUtils,
  MongoWire.bsonDoc,
  MongoWire.MongoWire;

type
  TGenericDAO = class
  strict private
    class function GetDocumentName<T: class>(pObj: T): string;
    class function GetDocumentIdValue<T: class>(pObj: T): string;
  public
    // Crud Operations
    class procedure SaveOrUpdate<T: class>(pObj: T);
    class procedure Insert<T: class>(pObj: T);
    class procedure Update<T: class>(pObj: T);
    class procedure Delete<T: class>(const pID: TValue);
    class function GetAll<T: class, constructor>(): TObjectList<T>;
    class function GetByID<T: class, constructor>(const pID: TValue): T;
  end;

implementation

class function TGenericDAO.GetDocumentIdValue<T>(pObj: T): string;
var
  vContexto: TRttiContext;
  vTypObj: TRttiType;
  vProp: TRttiProperty;
  Atributo: TCustomAttribute;
begin
  Result := '';
  vContexto := TRttiContext.Create;
  try
    vTypObj := vContexto.GetType(TObject(pObj).ClassInfo);
    for vProp in vTypObj.GetProperties do
    begin
      for Atributo in vProp.GetAttributes do
      begin
        if Atributo is IdField then
        begin
          Exit(vProp.GetValue(TObject(pObj)).AsString);
        end;
      end;
    end;
  finally
    vContexto.Free;
  end;
end;

class function TGenericDAO.GetDocumentName<T>(pObj: T): String;
var
  vContexto: TRttiContext;
  vTypObj: TRttiType;
  Atributo: TCustomAttribute;
begin
  vContexto := TRttiContext.Create;
  try
    vTypObj := vContexto.GetType(TObject(pObj).ClassInfo);
    for Atributo in vTypObj.GetAttributes do
    begin
      if Atributo is DocumentName then
        Exit(DocumentName(Atributo).Name);
    end;
  finally
    vContexto.Free;
  end;
end;

class procedure TGenericDAO.Insert<T>(pObj: T);
begin
  TConnectionMongo.GetConnection().Insert(GetDocumentName(pObj),
    TObjectToBson.Convert(pObj));
end;

class procedure TGenericDAO.SaveOrUpdate<T>(pObj: T);
begin
  if (GetDocumentIdValue(pObj) <> EmptyStr) then
    TGenericDAO.Update<T>(pObj)
  else
    TGenericDAO.Insert<T>(pObj);
end;

class procedure TGenericDAO.Delete<T>(const pID: TValue);
var
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vObject: TObject;
begin
  vRttiContext := TRttiContext.Create;
  vRttiType := vRttiContext.GetType(T);
  vObject := vRttiType.AsInstance.MetaclassType.Create;
  try
    TConnectionMongo.GetConnection().Delete(GetDocumentName(vObject),
      BSON(['id', pID.ToString]));
  finally
    vRttiContext.Free;
    vObject.Free;
  end;
end;

class procedure TGenericDAO.Update<T>(pObj: T);
begin
  TConnectionMongo.GetConnection().Update(GetDocumentName(pObj),
    BSON(['id', GetDocumentIdValue(pObj)]), TObjectToBson.Convert(pObj));
end;

class function TGenericDAO.GetAll<T>(): TObjectList<T>;
var
  WireQuery: TMongoWireQuery;
  vDocument: IBSONDocument;
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vObject: TObject;
begin
  Result := TObjectList<T>.Create();

  vRttiContext := TRttiContext.Create;
  vRttiType := vRttiContext.GetType(T);
  vObject := vRttiType.AsInstance.MetaclassType.Create;
  vDocument := BSON;
  WireQuery := TMongoWireQuery.Create(TConnectionMongo.GetConnection());
  try
    WireQuery.Query(GetDocumentName(vObject), nil);
    while WireQuery.Next(vDocument) do
      Result.Add(TJson.JsonToObject<T>(BsonToJson(vDocument)));
  finally
    FreeAndNil(WireQuery);
    vRttiContext.Free;
    vObject.Free;
  end;
end;

class function TGenericDAO.GetByID<T>(const pID: TValue): T;
var
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vObject: TObject;
begin
  vRttiContext := TRttiContext.Create;
  vRttiType := vRttiContext.GetType(T);
  vObject := vRttiType.AsInstance.MetaclassType.Create;
  try
    Result := TJson.JsonToObject<T>(BsonToJson(TConnectionMongo.GetConnection()
      .get(GetDocumentName(vObject), BSON(['id', pID.ToString]))));
  finally
    vRttiContext.Free;
    vObject.Free;
  end;
end;

end.
