# PascalStudentTools 

## Установка

Скачать последнюю версию .dll файлика из Releases



## Импорт библиотеки

Чтобы импортировать библиотеку в ваш код, добавьте следующую строку в начало вашего файла:

```pascal
{$reference 'C:\PATH\TO\DLL\PascalToolsFirstYear.dll'}
```
Это позволит вам использовать функции, определённые в библиотеке, такие как ReadArray и PrintArray.

## Использование функций

### 1. ReadArray

Функция ReadArray позволяет заполнить массив значениями, введёнными пользователем. Она принимает в качестве обязятелького параметра динамический массив и возвращает его заполненным. Массив может быть как одномерный так и двумерным.

***В дальнейшем под T будем подразумевать типы integer, real, string и char***

**Сигнатура:**

*Использовании стандартных значений X и Y для вывода и ввода:*
```pascal
function ReadArray(var arr: array of integer): array of integer;
```

*Использовании собственных значений X и Y для вывода и ввода:*
```pascal
function ReadArray(
  arr: array of T;
  outX: integer;
  outY: integer;
  inputX: integer;
  inputY: integer): array of T;
```


### 2. PrintArray

Функция PrintArray выводит элементы массива на экран. Она принимает массив в качестве параметра и отображает его содержимое.

**Сигнатура:**

*Использовании стандартных значений X и Y для вывода:*
```pascal
procedure PrintArray(arr: array of T);
```

*Использовании собственных значений X и Y для вывода:*
```pascal
procedure PrintArray(arr: array of T, x: integer, y: integer);
```

## Пример использования

```pascal
program Example;

{$reference 'C:\PATH\TO\DLL\PascalToolsFirstYear.dll'}

begin
  
  // Создание двумерного массива 2х2
  var a: array [,] of integer := new integer[2, 2]; 
  
  // Печать массива до заполнения
  PrintArray(a, 15, 10);
  
  // Чтение значений в массив
  a := ReadArray(a);
  
  // Печать массива после заполнения
  PrintArray(a);

  // Создание одномерного массива 
  var b: array of integer := new integer[3]; 
  
  // Печать массива до заполнения
  PrintArray(b);
  
  // Чтение значений в массив
  b := ReadArray(a, 10, 10, 10, 10);
  
  // Печать массива после заполнения
  PrintArray(b);
end.
```