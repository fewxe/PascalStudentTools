library PascalToolsFirstYear;

interface

uses crt;

function ReadArray<T>(arr: array of T): array of T;

function ReadArray<T>(
  arr: array of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of T;

function ReadArray<T>(arr: array [,] of T): array [,] of T;

function ReadArray<T>(
  arr: array [,] of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of T;

procedure PrintArray<T>(arr: array of T);

procedure PrintArray<T>(
  arr: array of T; 
  x: integer; 
  y: integer);

procedure PrintArray<T>(arr: array [,] of T);

procedure PrintArray<T>(
  arr: array [,] of T; 
  x: integer; 
  y: integer);



implementation

uses crt;


procedure PrintOneDimensionalArray<T>(
  arr: array of T; 
  x: integer;
  y: integer);
begin
  GoToXY(x, y);
  Write('[');
  for var i: integer := 0 to arr.Length - 1 do
  begin
    crt.GoToXY(crt.WhereX() + 1, y);
    Write(arr[i].ToString());
    if (i < arr.Length - 1) then 
      Write(',');
  end;
  crt.GoToXY(crt.WhereX() + 1, y);
  Writeln(']');
  crt.GoToXY(1, crt.WhereY() + 1);
end;


procedure PrintArray<T>(
  arr: array of T; 
  x: integer; 
  y: integer);
begin
  PrintOneDimensionalArray(arr, x, y);
end;


procedure PrintArray<T>(arr: array of T);
begin
  var x: integer := crt.WhereX();
  var y: integer := crt.WhereY();
  PrintArray(arr, x, y);
end;


procedure PrintArray<T>(
  arr: array [,] of T; 
  x: integer; 
  y: integer);
begin
  foreach var i: array of T in arr.Rows() do
  begin
    PrintOneDimensionalArray(i, x, y);
    y += 1;
  end;
  GoToXY(1, y);
end;


procedure PrintArray<T>(arr: array [,] of T);
begin
  var x: integer := crt.WhereX();
  var y: integer := crt.WhereY();
  PrintArray(arr, x, y);
end;


function ReadOneDimensionalArray<T>(
  arr: array of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of T;
begin
  var arr2: array of T := new T[arr.Length];
  arr.CopyTo(arr2, 0);
  var s: string := '';
  s += '[';
  for var i: integer := 0 to arr2.Length - 1 do
  begin
    GoToXY(inputX, inputY);
    Write('input: ');
    var str: string := ReadString();
    crt.GotoXY(1, WhereY() - 1);
    crt.ClearLine();
    s += str;
    if (i <> arr2.Length - 1) then 
      s += ', ';
    arr2[i] := T(Convert.ChangeType(str, typeof(T)));
    GoToXY(outX, outY);
    write(s);
  end;
  s += ']';
  GoTOXY(outX, outY);
  Write(s);
  GoToXY(1, WhereY() + 1);
  Result := arr2;
end;


function ReadArray<T>(
  arr: array of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of T;
begin
  Result := ReadOneDimensionalArray(arr, outX, outY, inputX, inputY)
end;


function ReadArray<T>(arr: array of T): array of T;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;


function ReadArray<T>(
  arr: array [,] of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of T;
begin
  var arr2: array [,] of T := new T[arr.RowCount(), arr.ColCount()];
  for var i: integer := 0 to arr.RowCount() - 1 do
  begin
    var arr3: array of T := ReadOneDimensionalArray(arr.Row(i), outX, outY, inputX, inputY);
    for var j: integer := 0 to arr3.Length - 1 do
    begin
      arr2[i, j] := arr3[j];
    end;
    outY += 1;
  end;
  Result := arr2;
end;


function ReadArray<T>(arr: array [,] of T): array [,] of T;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;
end.