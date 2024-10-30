library PascalToolsFirstYear;

interface

uses UArrayTools;
uses UComplexTools;


type
  ArrayTools = class
    
    public static procedure PrintArray<T>(
      arr: array of T; 
      x: integer; 
      y: integer);
    
    public static procedure PrintArray<T>(arr: array of T);
    
    public static procedure PrintArray<T>(
      arr: array [,] of T; 
      x: integer; 
      y: integer);
    
    public static procedure PrintArray<T>(arr: array [,] of T);
    
    public static function ReadArray<T>(
      arr: array of T;
      outX: integer;
      outY: integer;
      inputX: integer;
      inputY: integer): array of T;
    
    public static function ReadArray<T>(arr: array of T): array of T;
    
    public static function ReadArray<T>(
      arr: array [,] of T;
      outX: integer;
      outY: integer;
      inputX: integer;
      inputY: integer): array [,] of T;
    
    public static function ReadArray<T>(arr: array [,] of T): array [,] of T;
  end;

type
  Complex = class(TComplex)
    public re, im: real;
    constructor Create(re, im: real);
    static function operator+(a, b: Complex): Complex;
    static function operator-(a, b: Complex): Complex;
    static function operator*(a, b: Complex): Complex;
    static function operator=(a, b: Complex): boolean;
    static function operator/(a, b: Complex): Complex;
    public function Abs(): real;
    public function Prod(a: real): Complex;
    public function Conjugate(): Complex;
    public function Inv(): Complex;
    public function ToString(): string;
    static function operator explicit(a: Complex): string;
    static function operator implicit(r: real): Complex;
  end;

implementation

uses UArrayTools;
uses UComplexTools;

class procedure ArrayTools.PrintArray<T>(arr: array of T);
begin
  UArrayTools.TArrayTools.PrintArray(arr);
end;

class procedure ArrayTools.PrintArray<T>(arr: array of T; x: integer; y: integer);
begin
  UArrayTools.TArrayTools.PrintArray(arr, x, y);
end;

class procedure ArrayTools.PrintArray<T>(arr: array [,] of T);
begin
  UArrayTools.TArrayTools.PrintArray(arr);
end;

class procedure ArrayTools.PrintArray<T>(arr: array [,] of T; x: integer; y: integer);
begin
  UArrayTools.TArrayTools.PrintArray(arr, x, y);
end;

class function ArrayTools.ReadArray<T>(
      arr: array of T;
      outX: integer;
      outY: integer;
      inputX: integer;
      inputY: integer): array of T;
begin
  Result := UArrayTools.TArrayTools.ReadArray(arr, outX, outY, inputX, inputY);
end;

class function ArrayTools.ReadArray<T>(
      arr: array [,] of T;
      outX: integer;
      outY: integer;
      inputX: integer;
      inputY: integer): array [,] of T;
begin
  Result := UArrayTools.TArrayTools.ReadArray(arr, outX, outY, inputX, inputY);
end;

class function ArrayTools.ReadArray<T>(arr: array of T): array of T;
begin
  Result := UArrayTools.TArrayTools.ReadArray(arr);
end;

class function ArrayTools.ReadArray<T>(arr: array [,] of T): array [,] of T;
begin
  Result := UArrayTools.TArrayTools.ReadArray(arr);
end;


constructor Complex.Create(re, im: real);
begin
  inherited
end;

static function Complex.operator+(a, b: Complex): Complex;
begin
  var t: TComplex := TComplex(a) + TComplex(b);
  Result := new Complex(t.re, t.im);
end;

static function Complex.operator-(a, b: Complex): Complex;
begin
  var t: TComplex := TComplex(a) - TComplex(b);
  Result := new Complex(t.re, t.im);
end;

static function Complex.operator*(a, b: Complex): Complex;
begin
  var t: TComplex := TComplex(a) * TComplex(b);
  Result := new Complex(t.re, t.im);
end;

static function Complex.operator=(a, b: Complex): boolean;
begin
  Result := TComplex(a) = TComplex(b);
end;

static function Complex.operator/(a, b: Complex): Complex;
begin
  var t: TComplex := TComplex(a) / TComplex(b);
  Result := new Complex(t.re, t.im);
end;

function Complex.Abs(): real;
begin
  Result := inherited Abs();
end;

function Complex.Prod(a: real): Complex;
begin
  var t: TComplex := inherited Prod(a);
  Result := new Complex(t.re, t.im);
end;

function Complex.Conjugate(): Complex;
begin
  var t: TComplex := inherited Conjugate();
  Result := new Complex(t.re, t.im);
end;

function Complex.Inv(): Complex;
begin
  var t: TComplex := inherited Inv();
  Result := new Complex(t.re, t.im);
end;

function Complex.ToString(): string;
begin
  Result := inherited 
end;

static function Complex.operator explicit(a: Complex): string;
begin
  Result := a.ToString();
end;

static function Complex.operator implicit(r: real): Complex;
begin
  Result := new Complex(r, 0);
end; 

end.
