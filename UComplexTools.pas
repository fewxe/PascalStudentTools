unit UComplexTools;


type 
  TComplex = class
    re, im: real;
    
    constructor Create(re, im: real);
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
      Result := new TComplex((a.re*b.re-a.im*b.im), (a.re*b.im+a.im*b.re));
    end;
    
    static function operator=(a,b: TComplex): boolean;
    begin
      Result := (a.re = b.re) and (a.im = b.im);
    end;
    
    public function Abs(): real;
    begin
      Result := Sqrt(Sqr(self.re)+Sqr(self.im));
    end;
    
    public function Prod(a: real): TComplex;
    begin
      Result := new TComplex(a*self.re, a*self.im);
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
      Result := new TComplex(self.re/q, self.im/q);
    end;
    
    static function operator/(a, b: TComplex): TComplex;
    begin
      if (b.re = 0) and (b.im = 0) then
        raise new Exception('Division by zero');
      Result := a * b.Conjugate().Inv();
    end;
    
    public function ToString(): string;
    begin
      var str: string;
      if (self.re <> 0) then str += self.re.ToString();
      
      if (self.im <> 0) then
        if (self.im > 0) then
          str += '+' + PABCSystem.Abs(self.im).ToString() + 'i' 
        else
          str += '-' + PABCSystem.Abs(self.im).ToString() + 'i';
      Result := str;
    end;
  end;
end.