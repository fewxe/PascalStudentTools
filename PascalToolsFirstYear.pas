library PascalToolsFirstYear;

interface

uses crt;

function ReadArray(arr: array of integer): array of integer;

function ReadArray(
  arr: array of integer;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of integer;
  
  
function ReadArray(arr: array of real): array of real;

function ReadArray(
  arr: array of real;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of real;
  

function ReadArray(arr: array of string): array of string;

function ReadArray(
  arr: array of string;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of string;


function ReadArray(arr: array of char): array of char;

function ReadArray(
  arr: array of char;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of char;


function ReadArray(arr: array [,] of integer): array [,] of integer;

function ReadArray(
  arr: array [,] of integer;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of integer;


function ReadArray(arr: array [,] of real): array [,] of real;

function ReadArray(
  arr: array [,] of real;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of real;


function ReadArray(arr: array [,] of string): array [,] of string;

function ReadArray(
  arr: array [,] of string;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of string;


function ReadArray(arr: array [,] of char): array [,] of char;

function ReadArray(
  arr: array [,] of char;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of char;


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



// понеслась
function ReadOneDimensionalArray(
  arr: array of integer;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of integer;
begin
  var arr2: array of integer := new integer[arr.Length];
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
    arr2[i] := integer.Parse(str);
    GoToXY(outX, outY);
    write(s);
  end;
  s += ']';
  GoTOXY(outX, outY);
  Write(s);
  GoToXY(1, WhereY() + 1);
  Result := arr2;
end;


function ReadOneDimensionalArray(
  arr: array of real;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of real;
begin
  var arr2: array of real := new real[arr.Length];
  arr.CopyTo(arr2, 0);
  var s: string := '';
  GoToXY(outX, outY);
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
    arr2[i] := real.Parse(str);
    GoToXY(outX, outY);
    write(s);
  end;
  s += ']';
  GoTOXY(outX, outY);
  Write(s);
  GoToXY(1, WhereY() + 1);
  Result := arr2;
end;


function ReadOneDimensionalArray(
  arr: array of string;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of string;
begin
  var arr2: array of string := new string[arr.Length];
  arr.CopyTo(arr2, 0);
  var s: string := '';
  GoToXY(outX, outY);
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
    arr2[i] := str;
    GoToXY(outX, outY);
    write(s);
  end;
  s += ']';
  GoTOXY(outX, outY);
  Write(s);
  GoToXY(1, WhereY() + 1);
  Result := arr2;
end;


function ReadOneDimensionalArray(
  arr: array of char;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of char;
begin
  var arr2: array of char := new char[arr.Length];
  arr.CopyTo(arr2, 0);
  var s: string := '';
  GoToXY(outX, outY);
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
    arr2[i] := char.Parse(str);
    GoToXY(outX, outY);
    write(s);
  end;
  s += ']';
  GoTOXY(outX, outY);
  Write(s);
  GoToXY(1, WhereY() + 1);
  Result := arr2;
end;


function ReadArray(
  arr: array of integer;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of integer;
begin
  Result := ReadOneDimensionalArray(arr, outX, outY, inputX, inputY)
end;


function ReadArray(arr: array of integer): array of integer;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;


function ReadArray(
  arr: array of real;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of real;
begin
  Result := ReadOneDimensionalArray(arr, outX, outY, inputX, inputY)
end;

function ReadArray(arr: array of real): array of real;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;



function ReadArray(
  arr: array of string;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of string;
begin
  Result := ReadOneDimensionalArray(arr, outX, outY, inputX, inputY)
end;

function ReadArray(arr: array of string): array of string;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;


function ReadArray(
  arr: array of char;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of char;
begin
  Result := ReadOneDimensionalArray(arr, outX, outY, inputX, inputY)
end;

function ReadArray(arr: array of char): array of char;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;



function ReadArray(
  arr: array [,] of integer;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of integer;
begin
  var arr2: array [,] of integer := new integer[arr.RowCount(), arr.ColCount()];
  for var i: integer := 0 to arr.RowCount() - 1 do
  begin
    var arr3: array of integer := ReadOneDimensionalArray(arr.Row(i), outX, outY, inputX, inputY);
    for var j: integer := 0 to arr3.Length - 1 do
    begin
      arr2[i, j] := arr3[j];
    end;
    outY += 1;
  end;
  Result := arr2;
end;

function ReadArray(arr: array [,] of integer): array [,] of integer;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;



function ReadArray(
  arr: array [,] of real;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of real;
begin
  var arr2: array [,] of real := new real[arr.RowCount(), arr.ColCount()];
  for var i: integer := 0 to arr.RowCount() - 1 do
  begin
    var arr3: array of real := ReadOneDimensionalArray(arr.Row(i), outX, outY, inputX, inputY);
    for var j: integer := 0 to arr3.Length - 1 do
    begin
      arr2[i, j] := arr3[j];
    end;
    outY += 1;
  end;
  Result := arr2;
end;

function ReadArray(arr: array [,] of real): array [,] of real;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;



function ReadArray(
  arr: array [,] of string;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of string;
begin
  var arr2: array [,] of string := new string[arr.RowCount(), arr.ColCount()];
  for var i: integer := 0 to arr.RowCount() - 1 do
  begin
    var arr3: array of string := ReadOneDimensionalArray(arr.Row(i), outX, outY, inputX, inputY);
    for var j: integer := 0 to arr3.Length - 1 do
    begin
      arr2[i, j] := arr3[j];
    end;
    outY += 1;
  end;
  Result := arr2;
end;


function ReadArray(arr: array [,] of string): array [,] of string;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;


function ReadArray(
  arr: array [,] of char;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array [,] of char;
begin
  var arr2: array [,] of char := new char[arr.RowCount(), arr.ColCount()];
  for var i: integer := 0 to arr.RowCount() - 1 do
  begin
    var arr3: array of char := ReadOneDimensionalArray(arr.Row(i), outX, outY, inputX, inputY);
    for var j: integer := 0 to arr3.Length - 1 do
    begin
      arr2[i, j] := arr3[j];
    end;
    outY += 1;
  end;
  Result := arr2;
end;


function ReadArray(arr: array [,] of char): array [,] of char;
begin
  var outX: integer := crt.WhereX();
  var outY: integer := crt.WhereY();
  var inputX: integer := Round(crt.WindowWidth() / 2);
  var inputY: integer := crt.WindowHeight - 2;
  Result := ReadArray(arr, outX, outY, inputX, inputY);
end;
end.