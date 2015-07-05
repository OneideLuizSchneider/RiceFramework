unit Rice.MongoBuilder4D;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.StrUtils,
  System.Rtti,
  System.TypInfo;

type

  INoSQL = interface
    ['{B622BAC1-8A43-476E-A40B-B293BE6CF91E}']
    function ToString(): string;
  end;

  INoSQLCriteria = interface(INoSQL)
    ['{2126A0CD-1ABD-4929-B991-60D8A073FACF}']
    function GetCriteria(): string;
    property Criteria: string read GetCriteria;
  end;

  INoSQLClause = interface(INoSQL)
    ['{842024F9-8DAB-4DC4-B4E0-FD06ABC61AD2}']
    function GetCriterias(): TList<INoSQLCriteria>;
    property Criterias: TList<INoSQLCriteria> read GetCriterias;
  end;

  INoSQLValue = interface(INoSQL)
    ['{82358A20-9D4B-4D0D-92C8-D62BB4B8A40D}']
    function GetValue(): TValue;

    property Value: TValue read GetValue;
  end;

  INoSQLWhere = interface(INoSQLClause)
    ['{45584D6F-5BD6-4C62-97C7-7096E8611D15}']
    function Column(const pColumn: string): INoSQLWhere; overload;

    function andOperator(pWhere: INoSQLWhere): INoSQLWhere;
    function orOperator(pWhere: INoSQLWhere): INoSQLWhere;

    function gt(const pValue: TValue): INoSQLWhere; overload;
    function gt(pValue: INoSQLValue): INoSQLWhere; overload;

    function lt(const pValue: TValue): INoSQLWhere; overload;
    function lt(pValue: INoSQLValue): INoSQLWhere; overload;

    function gte(const pValue: TValue): INoSQLWhere; overload;
    function gte(pValue: INoSQLValue): INoSQLWhere; overload;

    function lte(const pValue: TValue): INoSQLWhere; overload;
    function lte(pValue: INoSQLValue): INoSQLWhere; overload;

    function ne(const pValue: TValue): INoSQLWhere; overload;
    function ne(pValue: INoSQLValue): INoSQLWhere; overload;

    function Equal(const pValue: TValue): INoSQLWhere; overload;
    function Equal(pValue: INoSQLValue): INoSQLWhere; overload;
  end;

  INoSQLInsert = interface(INoSQL)
    ['{365AEE24-7471-4677-B44B-A79D24BC40F3}']
    function ColumnValue(const pColumn: string; const pValue: TValue)
      : INoSQLInsert; overload;
    function ColumnValue(const pColumn: string; pValue: INoSQLValue)
      : INoSQLInsert; overload;
  end;

  INoSQLUpdate = interface(INoSQL)
    ['{99E5FD5C-A0D5-4036-87D4-3E4D0D5BC6E2}']
    function Where(pWhere: INoSQLWhere): INoSQLUpdate;

    function Multi(pOpation: Boolean): INoSQLUpdate;

    function ColumnValue(const pColumn: string; const pValue: TValue)
      : INoSQLUpdate; overload;
    function ColumnValue(const pColumn: string; pValue: INoSQLValue)
      : INoSQLUpdate; overload;
  end;

  IQuery = interface(INoSQL)
    ['{B622BAC1-8A43-476E-A40B-B293BE6CF91E}']
    function Criteria(const pWhere: INoSQLWhere): IQuery; overload;
    function Criteria(const pUpdate: INoSQLUpdate): IQuery; overload;
  end;

  MongoDB = class sealed
  strict private
{$HINTS OFF}
    constructor Create;
{$HINTS ON}
  public
    class function Query(): IQuery; overload; static;
    class function Query(const pWhere: INoSQLWhere): IQuery; overload; static;
    class function Query(const pUpdate: INoSQLUpdate): IQuery; overload; static;

    class function Where(): INoSQLWhere; overload; static;
    class function Where(const pColumn: string): INoSQLWhere; overload; static;

    class function Insert(): INoSQLInsert; overload; static;
    class function Update(): INoSQLUpdate; overload; static;

    class function Value(const pValue: TValue): INoSQLValue;
  end;

implementation

type

  TNoSQL = class(TInterfacedObject, INoSQL)
  strict protected
    function DoToString(): string; virtual; abstract;
  public
    function ToString(): string; override;
  end;

  TNoSQLCriteria = class(TNoSQL, INoSQLCriteria)
  private
    FCriteria: string;
    function GetCriteria(): string;
    function DoToString(): string; override;
  public
    constructor Create(const pCriteria: string);
    property Criteria: string read GetCriteria;
  end;

  TNoSQLClause = class(TNoSQL, INoSQLClause)
  strict private
    FCriterias: TList<INoSQLCriteria>;
    function GetCriterias(): TList<INoSQLCriteria>;
  strict protected
    OwnerString: TFunc<string>;
    function DoToString(): string; override;
  public
    constructor Create(const pOwnerString: TFunc<string>);
    destructor Destroy; override;
    property Criterias: TList<INoSQLCriteria> read GetCriterias;
  end;

  TNoSQLValue = class(TNoSQL, INoSQLValue)
  strict private
    FValue: TValue;
    function GetValue(): TValue;
  strict protected
    function DoToString(): string; override;
  public
    constructor Create(const pValue: TValue);

    property Value: TValue read GetValue;
  end;

  TNoSQLWhere = class(TNoSQLClause, INoSQLWhere)
  strict private
    FColumn: string;
    procedure AddExpression(const pCriteria: TNoSQLCriteria);
  strict protected
    function DoToString(): string; override;
  public
    function Column(const pColumn: string): INoSQLWhere;

    function andOperator(pWhere: INoSQLWhere): INoSQLWhere;
    function orOperator(pWhere: INoSQLWhere): INoSQLWhere;

    function gt(const pValue: TValue): INoSQLWhere; overload;
    function gt(pValue: INoSQLValue): INoSQLWhere; overload;

    function lt(const pValue: TValue): INoSQLWhere; overload;
    function lt(pValue: INoSQLValue): INoSQLWhere; overload;

    function gte(const pValue: TValue): INoSQLWhere; overload;
    function gte(pValue: INoSQLValue): INoSQLWhere; overload;

    function lte(const pValue: TValue): INoSQLWhere; overload;
    function lte(pValue: INoSQLValue): INoSQLWhere; overload;

    function ne(const pValue: TValue): INoSQLWhere; overload;
    function ne(pValue: INoSQLValue): INoSQLWhere; overload;

    function Equal(const pValue: TValue): INoSQLWhere; overload;
    function Equal(pValue: INoSQLValue): INoSQLWhere; overload;
  end;

  TNoSQLInsert = class(TNoSQL, INoSQLInsert)
  strict private
    FColumns: TStringList;
    FValues: TList<INoSQLValue>;
  strict protected
    function DoToString(): string; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function ColumnValue(const pColumn: string; const pValue: TValue)
      : INoSQLInsert; overload;
    function ColumnValue(const pColumn: string; pValue: INoSQLValue)
      : INoSQLInsert; overload;
  end;

  TNoSQLUpdate = class(TNoSQL, INoSQLUpdate)
  strict private
    FColumns: TStringList;
    FValues: TList<INoSQLValue>;
    FMulti: Boolean;
    FWhere: INoSQLWhere;
  strict protected
    function DoToString(): string; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function Where(pWhere: INoSQLWhere): INoSQLUpdate;
    function Multi(pOption: Boolean): INoSQLUpdate;

    function ColumnValue(const pColumn: string; const pValue: TValue): INoSQLUpdate; overload;
    function ColumnValue(const pColumn: string; pValue: INoSQLValue): INoSQLUpdate; overload;
  end;

  TQuery = class(TNoSQLClause, IQuery)
  strict protected
    function DoToString(): string; override;
  public
    function Criteria(const pWhere: INoSQLWhere): IQuery; overload;
    function Criteria(const pUpdate: INoSQLUpdate): IQuery; overload;
  end;

  { TNoSQL }

function TNoSQL.ToString: string;
begin
  Result := DoToString();
end;

{ TCriteria }

constructor TNoSQLCriteria.Create(const pCriteria: string);
begin
  FCriteria := pCriteria;
end;

function TNoSQLCriteria.DoToString: string;
begin
  Result := EmptyStr;
end;

function TNoSQLCriteria.GetCriteria: string;
begin
  Result := FCriteria;
end;

{ TClause }

constructor TNoSQLClause.Create(const pOwnerString: TFunc<string>);
begin
  FCriterias := TList<INoSQLCriteria>.Create;
  OwnerString := pOwnerString;
end;

destructor TNoSQLClause.Destroy;
begin
  FreeAndNil(FCriterias);
  inherited;
end;

function TNoSQLClause.DoToString: string;
begin
  Result := EmptyStr;
end;

function TNoSQLClause.GetCriterias: TList<INoSQLCriteria>;
begin
  Result := FCriterias
end;

{ TNoSQLValue }

constructor TNoSQLValue.Create(const pValue: TValue);
begin
  FValue := pValue
end;

function TNoSQLValue.DoToString: string;
begin
  Result := FValue.ToString;

  case FValue.Kind of
    tkUString, tkWChar, tkLString, tkWString, tkString, tkChar:
      Result := '"' + Result + '"';
    tkInteger, tkInt64:
      Result := Result;
    tkUnknown:
      Result := 'Null';
    tkFloat:
      Result := ReplaceText(Result, ',', '.');
  end;
end;

function TNoSQLValue.GetValue: TValue;
begin
  Result := FValue;
end;

{ TWhere }

procedure TNoSQLWhere.AddExpression(const pCriteria: TNoSQLCriteria);
begin
  Criterias.Add(pCriteria);
end;

function TNoSQLWhere.andOperator(pWhere: INoSQLWhere): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$and" : [{ "' + FColumn + '": {' +
    pWhere.ToString + ' }}] '));
  Result := Self;
end;

function TNoSQLWhere.Column(const pColumn: string): INoSQLWhere;
begin
  FColumn := pColumn;
  Result := Self;
end;

function TNoSQLWhere.DoToString: string;
var
  I: Integer;
  vSb: TStringBuilder;
begin
  Result := EmptyStr;

  vSb := TStringBuilder.Create;
  try
    if Assigned(OwnerString) then
    begin
      vSb.Append(OwnerString);
      vSb.AppendLine;
    end;

    for I := 0 to Pred(Criterias.Count) do
    begin
      vSb.Append(Criterias[I].Criteria);
      if ((Criterias.Count - 1) <> I) then
        vSb.Append(', ');
    end;

    Result := vSb.ToString;
  finally
    FreeAndNil(vSb);
  end;
end;

function TNoSQLWhere.Equal(const pValue: TValue): INoSQLWhere;
begin
  Result := Equal(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.Equal(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create('"' + FColumn + '": ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.gt(const pValue: TValue): INoSQLWhere;
begin
  Result := gt(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.gt(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$gt" : ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.gte(const pValue: TValue): INoSQLWhere;
begin
  Result := gte(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.gte(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$gte" : ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.lt(const pValue: TValue): INoSQLWhere;
begin
  Result := lt(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.lt(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$lt" : ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.lte(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$lte" : ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.lte(const pValue: TValue): INoSQLWhere;
begin
  Result := lte(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.ne(pValue: INoSQLValue): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$ne" : ' + pValue.ToString));
  Result := Self;
end;

function TNoSQLWhere.ne(const pValue: TValue): INoSQLWhere;
begin
  Result := ne(TNoSQLValue.Create(pValue));
end;

function TNoSQLWhere.orOperator(pWhere: INoSQLWhere): INoSQLWhere;
begin
  AddExpression(TNoSQLCriteria.Create(' "$or" : [{ "' + FColumn + '": {' +
    pWhere.ToString + ' }}] '));
  Result := Self;
end;

{ TQuery }

function TQuery.Criteria(const pWhere: INoSQLWhere): IQuery;
begin
  Criterias.Add(TNoSQLCriteria.Create('{ ' + pWhere.ToString + ' }'));
  Result := Self;
end;

function TQuery.Criteria(const pUpdate: INoSQLUpdate): IQuery;
begin
  Criterias.Add(TNoSQLCriteria.Create('{ ' + pUpdate.ToString + ' }'));
  Result := Self;
end;

function TQuery.DoToString: string;
var
  I: Integer;
  vSb: TStringBuilder;
begin
  Result := EmptyStr;

  vSb := TStringBuilder.Create;
  try
    if Assigned(OwnerString) then
    begin
      vSb.Append(OwnerString);
      vSb.AppendLine;
    end;

    for I := 0 to Pred(Criterias.Count) do
    begin
      vSb.Append(Criterias[I].Criteria);
    end;

    Result := vSb.ToString;
  finally
    FreeAndNil(vSb);
  end;
end;

{ NoSQL }

constructor MongoDB.Create;
begin
  raise Exception.Create('Not Instance :p');
end;

class function MongoDB.Query: IQuery;
begin
  Result := TQuery.Create(nil);
end;

class function MongoDB.Insert: INoSQLInsert;
begin
  Result := TNoSQLInsert.Create;
end;

class function MongoDB.Query(const pWhere: INoSQLWhere): IQuery;
begin
  Result := TQuery.Create(nil);
  Result.Criteria(pWhere);
end;

class function MongoDB.Query(const pUpdate: INoSQLUpdate): IQuery;
begin
  Result := TQuery.Create(nil);
  Result.Criteria(pUpdate);
end;

class function MongoDB.Update: INoSQLUpdate;
begin
  Result := TNoSQLUpdate.Create;
end;

class function MongoDB.Value(const pValue: TValue): INoSQLValue;
begin
  Result := TNoSQLValue.Create(pValue);
end;

class function MongoDB.Where: INoSQLWhere;
begin
  Result := TNoSQLWhere.Create(nil);
end;

class function MongoDB.Where(const pColumn: string): INoSQLWhere;
begin
  Result := MongoDB.Where();
  Result.Column(pColumn);
end;

{ TNoSQLInsert }

procedure TNoSQLInsert.AfterConstruction;
begin
  inherited AfterConstruction;
  FColumns := TStringList.Create;
  FValues := TList<INoSQLValue>.Create;
end;

procedure TNoSQLInsert.BeforeDestruction;
begin
  FreeAndNil(FColumns);
  FreeAndNil(FValues);
  inherited BeforeDestruction;
end;

function TNoSQLInsert.ColumnValue(const pColumn: string; pValue: INoSQLValue)
  : INoSQLInsert;
begin
  if pColumn.IsEmpty then
    raise Exception.Create('The column can not be empty!');
  FColumns.Add(pColumn);
  FValues.Add(pValue);
  Result := Self;
end;

function TNoSQLInsert.ColumnValue(const pColumn: string; const pValue: TValue)
  : INoSQLInsert;
begin
  Result := ColumnValue(pColumn, TNoSQLValue.Create(pValue));
end;

function TNoSQLInsert.DoToString: string;
var
  I: Integer;
  vSb: TStringBuilder;
begin
  Result := EmptyStr;

  if (FColumns.Count <> FValues.Count) then
    raise Exception.Create('Columns count and Values count must be equal!');

  vSb := TStringBuilder.Create;
  try
    vSb.AppendLine.Append('{ ');

    for I := 0 to Pred(FColumns.Count) do
    begin
      vSb.Append('"' + FColumns[I] + '" : ' + FValues[I].ToString);
      if (I <> (FColumns.Count - 1)) then
        vSb.Append(', ');
    end;

    vSb.Append(' }');

    Result := vSb.ToString;
  finally
    FreeAndNil(vSb);
  end;
end;

{ TNoSQLUpdate }

procedure TNoSQLUpdate.AfterConstruction;
begin
  inherited AfterConstruction;
  FColumns := TStringList.Create;
  FValues := TList<INoSQLValue>.Create;
end;

procedure TNoSQLUpdate.BeforeDestruction;
begin
  FreeAndNil(FColumns);
  FreeAndNil(FValues);
  inherited BeforeDestruction;
end;

function TNoSQLUpdate.ColumnValue(const pColumn: string; const pValue: TValue)
  : INoSQLUpdate;
begin
  Result := ColumnValue(pColumn, TNoSQLValue.Create(pValue));
end;

function TNoSQLUpdate.ColumnValue(const pColumn: string; pValue: INoSQLValue)
  : INoSQLUpdate;
begin
  if pColumn.IsEmpty then
    raise Exception.Create('The column can not be empty!');
  FColumns.Add(pColumn);
  FValues.Add(pValue);
  Result := Self;
end;

function TNoSQLUpdate.DoToString: string;
var
  I: Integer;
  vSb: TStringBuilder;
begin
  Result := EmptyStr;

  if (FColumns.Count <> FValues.Count) then
    raise Exception.Create('Columns count and Values count must be equal!');

  vSb := TStringBuilder.Create;
  try
    vSb.AppendLine.Append('{ ');

    vSb.AppendLine.Append('{ ' + FWhere.ToString + ' }, { "$set": {');

    for I := 0 to Pred(FColumns.Count) do
    begin
      vSb.Append('"' + FColumns[I] + '" : ' + FValues[I].ToString);
      if (I <> (FColumns.Count - 1)) then
        vSb.Append(', ');
    end;

    vSb.AppendLine.Append(' } } ');

    if (FMulti) then
      vSb.AppendLine.Append(', {"multi" : true} ');

    vSb.Append(' }');

    Result := vSb.ToString;
  finally
    FreeAndNil(vSb);
  end;
end;

function TNoSQLUpdate.Multi(pOption: Boolean): INoSQLUpdate;
begin
  FMulti := pOption;
  Result := Self;
end;

function TNoSQLUpdate.Where(pWhere: INoSQLWhere): INoSQLUpdate;
begin
  FWhere := pWhere;
  Result := Self;
end;

end.
