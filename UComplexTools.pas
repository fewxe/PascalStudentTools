unit UComplexTools;


type
  TComplex = class
    re, im: real;
    
    constructor(re, im: real);
    begin
      Self.re := re;
      Self.im := im;
    end;
    
    static function operator+(a, b: TComplex): TComplex;
    begin
      Result := new TComplex(a.re + b.re, a.im + b.im);
    end;
    
    static function operator-(a, b: TComplex): TComplex;
    begin
      Result := new TComplex(a.re - b.re, a.im - b.im);
    end;
    
    static function operator*(a, b: TComplex): TComplex;
    begin
      Result := new TComplex((a.re * b.re - a.im * b.im), (a.re * b.im + a.im * b.re));
    end;
    
    static function operator=(a, b: TComplex): boolean;
    begin
      Result := (a.re = b.re) and (a.im = b.im);
    end;
    
    public function Abs(): real;
    begin
      Result := PABCSystem.Sqrt(Sqr(self.re) + Sqr(self.im));
    end;
    
    public function Prod(a: real): TComplex;
    begin
      Result := new TComplex(a * self.re, a * self.im);
    end;
    
    public function Conjugate(): TComplex;
    begin
      Result := new TComplex(self.re, -self.im)
    end;
    
    public function Inv(): TComplex;
    begin
      var q: real := Sqr(self.re) + Sqr(self.im);
      if (q = 0) then 
        raise new Exception('Division by zero');
      Result := new TComplex(self.re / q, self.im / q);
    end;
    
    static function operator/(a, b: TComplex): TComplex;
    begin
      if (b.re = 0) and (b.im = 0) then
        raise new Exception('Division by zero');
      Result := a * b.Conjugate().Inv();
    end;
    
    static function operator implicit(s: string): TComplex;
    begin
      s := s.Trim();
      var signPos: integer;
      for var i: integer := 1 to s.Length do
        if (s[i] in ['+', '-']) then
        begin
          signPos := i;
          break;
        end;
        
      if signPos = 0 then
        raise new Exception('Invalid complex number format.');
        
      var reString: string := s.Substring(0, signPos - 1);
      var imString: string := s.Substring(signPos, s.Length - signPos - 1);
      
      if imString.EndsWith('i') then
        imString := imString.Substring(0, imString.Length - 1);
 
      Result := new TComplex(reString.ToReal(), imString.ToReal());
    end;
    
    public function Sqrt(): TComplex;
    begin
      var r: real := PABCSystem.Sqrt(self.re * self.re + self.im * self.im);
      var u: real := PABCSystem.Sqrt((r + re) / 2);
      var v: real := PABCSystem.Sqrt((r - re) / 2);
      if self.im < 0 then
        v := -v;
      Result := new TComplex(u, v);
    end;
    
    public function ToString(): string; override;
    begin
      var str: string;
      if (self.re <> 0) then str += self.re.ToString();
      if (self.im <> 0) then
      begin
        if (self.im > 0) then
        begin
          if (self.re <> 0) then str += '+';
        end
        else str += '-';
        str += PABCSystem.Abs(self.im).ToString() + 'i';
      end;
      Result := str;
    end;
  end;
end.