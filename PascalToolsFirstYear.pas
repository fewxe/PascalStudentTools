library PascalToolsFirstYear;

interface

uses UArrayTools;


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


implementation
uses UArrayTools;

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
end.