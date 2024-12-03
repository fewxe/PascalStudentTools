unit UVector;
uses UComplexTools;

type
  TVector = class
    public x, y, z: real;
    
    constructor Create(x, y, z: real);
    begin
      Self.x := x;
      Self.y := y;
      Self.z := z;
    end;
    
    static function operator+(a, b: TVector): TVector;
    begin
      Result := new TVector(a.x + b.x, a.y + b.y, a.z + b.z);
    end;
    
    static function operator-(a, b: TVector): TVector;
    begin
      Result := new TVector(a.x - b.x, a.y - b.y, a.z - b.z);
    end;
    
    // Cкалярное произведение
    static function operator*(a, b: TVector): real;
    begin
      Result := a.x * b.x + a.y * b.y + a.z * b.z;
    end;
    
    // Векторное произведение
    static function operator**(a, b: TVector): TVector;
    begin
      Result := new TVector(
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
      );
    end;
    
    static function operator=(a, b: TVector): boolean;
    begin
      Result := (a.x = b.x) and (a.y = b.y) and (a.z = b.z);
    end;
    
    public function Abs(): real;
    begin
      Result := Sqrt(Self * Self)
    end;
    
    public function ToString(): string; override;
    begin
      Result := $'x={Self.x} y={Self.y} z={Self.z}';
    end;
  end;
  
  
  type
  TVectorComplex = class
    public x, y, z: TComplex;
    
    constructor Create(x, y, z: TComplex);
    begin
      Self.x := x;
      Self.y := y;
      Self.z := z;
    end;
    
    static function operator+(a, b: TVectorComplex): TVectorComplex;
    begin
      Result := new TVectorComplex(a.x + b.x, a.y + b.y, a.z + b.z);
    end;
    
    static function operator-(a, b: TVectorComplex): TVectorComplex;
    begin
      Result := new TVectorComplex(a.x - b.x, a.y - b.y, a.z - b.z);
    end;
    
    // Cкалярное произведение
    static function operator*(a, b: TVectorComplex): TComplex;
    begin
      Result := a.x * b.x + a.y * b.y + a.z * b.z;
    end;
    
    // Векторное произведение
    static function operator**(a, b: TVectorComplex): TVectorComplex;
    begin
      Result := new TVectorComplex(
        a.y * b.z - a.z * b.y,
        a.z * b.x - a.x * b.z,
        a.x * b.y - a.y * b.x
      );
    end;
    
    static function operator=(a, b: TVectorComplex): boolean;
    begin
      Result := (a.x = b.x) and (a.y = b.y) and (a.z = b.z);
    end;
    
    public function Abs(): TComplex;
    begin
      Result := (self * self).Sqrt();
    end;
    
    public function ToString(): string; override;
    begin
      Result := $'x={Self.x} y={Self.y} z={Self.z}';
    end;
  end;

end.  
