unit Rice.MongoFramework.Connection;

interface

uses
  System.SysUtils,
  System.Classes,
  MongoWire.MongoWire;

type
  TConnectionMongo = class(TPersistent)
  strict private
    class var FMongoWire: TMongoWire;
    class function GetInstance(const pDbName: string = 'teste';
      pServer: string = 'localhost'; const pPort: Integer = 27017): TMongoWire;
    class function Exists(): Boolean;
  public
    class function GetConnection(): TMongoWire;
    class constructor Create();
    class destructor Destroy();
  end;

implementation

{ TConnectionMongo }

class constructor TConnectionMongo.Create;
begin
  FMongoWire := GetInstance();
end;

class destructor TConnectionMongo.Destroy;
begin
  inherited;
  if (FMongoWire <> nil) then
    FreeAndNil(FMongoWire);
end;

class function TConnectionMongo.Exists: Boolean;
begin
  Result := (GetConnection <> nil);
end;

class function TConnectionMongo.GetConnection: TMongoWire;
begin
  Result := FMongoWire;
end;

class function TConnectionMongo.GetInstance(const pDbName: string;
  pServer: string; const pPort: Integer): TMongoWire;
begin
  if (Exists()) then
    GetConnection().Close();

  Result := TMongoWire.Create(pDbName);
  Result.Open(pServer, pPort);
end;

end.
