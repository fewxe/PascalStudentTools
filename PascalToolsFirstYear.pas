library PascalToolsFirstYear;

interface

uses UArrayTools;
uses UComplexTools;
uses UVector;


type
  ArrayTools = class
    public static procedure PrintArray<T>(arr: array of T; x: integer; y: integer);
    public static procedure PrintArray<T>(arr: array of T);
    public static procedure PrintArray<T>(arr: array [,] of T; x: integer; y: integer);
    public static procedure PrintArray<T>(arr: array [,] of T);
    public static function ReadArray<T>(arr: array of T; outX: integer; outY: integer; inputX: integer; inputY: integer): array of T;
    public static function ReadArray<T>(arr: array of T): array of T;
    public static function ReadArray<T>(arr: array [,] of T; outX: integer; outY: integer; inputX: integer; inputY: integer): array [,] of T;
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
    public function ToString(): string; override;
    static function operator implicit(s: string): Complex;
    static function operator implicit(a: TComplex): Complex;
    public function Sqrt(): Complex;
  end;

type
  Vector = class(TVector)
    public x, y, z: real;
    constructor Create(x, y, z: real);
    static function operator+(a, b: Vector): Vector;
    static function operator-(a, b: Vector): Vector;
    static function operator*(a, b: Vector): real;
    static function operator**(a, b: Vector): Vector;
    static function operator=(a, b: Vector): boolean;
    public function Abs(): real;
    public function ToString(): string; override;
    static function operator implicit(a: TVector): Vector;
  end;
  
type
  VectorComplex = class(TVectorComplex)
    public x, y, z: Complex;
    constructor Create(x, y, z: Complex);
    static function operator+(a, b: VectorComplex): VectorComplex;
    static function operator-(a, b: VectorComplex): VectorComplex;
    static function operator*(a, b: VectorComplex): Complex;
    static function operator**(a, b: VectorComplex): VectorComplex;
    static function operator=(a, b: VectorComplex): boolean;
    public function Abs(): Complex;
    public function ToString(): string; override;
    static function operator implicit(a: TVectorComplex): VectorComplex;
  end;
  
implementation

uses UArrayTools;
uses UComplexTools;
uses UVector;

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
  Result := TComplex(a) + TComplex(b);
end;

static function Complex.operator-(a, b: Complex): Complex;
begin
  Result := TComplex(a) - TComplex(b);
end;

static function Complex.operator*(a, b: Complex): Complex;
begin
  Result := TComplex(a) * TComplex(b);
end;

static function Complex.operator=(a, b: Complex): boolean;
begin
  Result := TComplex(a) = TComplex(b);
end;

static function Complex.operator/(a, b: Complex): Complex;
begin
  Result := TComplex(a) / TComplex(b);
end;

function Complex.Abs(): real;
begin
  Result := inherited Abs();
end;

function Complex.Prod(a: real): Complex;
begin
  Result := inherited Prod(a);
end;

function Complex.Conjugate(): Complex;
begin
  Result := inherited Conjugate();
end;

function Complex.Inv(): Complex;
begin
  Result := inherited Inv();
end;

function Complex.ToString(): string;
begin
  Result := inherited
end;

static function Complex.operator implicit(s: string): Complex;
begin
  Result := TComplex(s);
end;

static function Complex.operator implicit(a: TComplex): Complex;
begin
  Result := new Complex(a.re, a.im);
end;

function Complex.Sqrt(): Complex;
begin
  Result := inherited Sqrt();
end;


constructor Vector.Create(x, y, z: real);
begin
  inherited  
end;

static function Vector.operator+(a, b: Vector): Vector;
begin
  Result := TVector(a) + TVector(b)
end;

static function Vector.operator-(a, b: Vector): Vector;
begin
  Result := TVector(a) + TVector(b)
end;

static function Vector.operator*(a, b: Vector): real;
begin
  Result := TVector(a) * TVector(b)
end;

static function Vector.operator**(a, b: Vector): Vector;
begin
  Result := TVector(a) ** TVector(b)
end;

static function Vector.operator=(a, b: Vector): boolean;
begin
  Result := TVector(a) = TVector(b)
end;

function Vector.Abs(): real;
begin
  Result := inherited
end;

function Vector.ToString(): string;
begin
  Result := inherited
end;

static function Vector.operator implicit(a: TVector): Vector;
begin
  Result := new Vector(a.x, a.y, a.z)
end;


constructor VectorComplex.Create(x, y, z: Complex);
begin
  inherited Create
end;

static function VectorComplex.operator+(a, b: VectorComplex): VectorComplex;
begin
  Result := TVectorComplex(a) + TVectorComplex(b)
end;

static function VectorComplex.operator-(a, b: VectorComplex): VectorComplex;
begin
  Result := TVectorComplex(a) + TVectorComplex(b)
end;

static function VectorComplex.operator*(a, b: VectorComplex): Complex;
begin
  Result := TVectorComplex(a) * TVectorComplex(b)
end;

static function VectorComplex.operator**(a, b: VectorComplex): VectorComplex;
begin
  Result := TVectorComplex(a) ** TVectorComplex(b)
end;

static function VectorComplex.operator=(a, b: VectorComplex): boolean;
begin
  Result := TVectorComplex(a) = TVectorComplex(b)
end;

function VectorComplex.Abs(): Complex;
begin
  Result := inherited Abs()
end;

function VectorComplex.ToString(): string;
begin
  Result := inherited
end;

static function VectorComplex.operator implicit(a: TVectorComplex): VectorComplex;
begin
  Result := new VectorComplex(a.x, a.y, a.z)
end;

end.
