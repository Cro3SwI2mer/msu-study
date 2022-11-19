Algorithms and Algorithmic Languages
====================================

First term courses, read at the Faculty of Computational Mathematics and Cybernetics, Moscow State University.

- Lecture 1: Turing Machine
- Lecture 2: Normal Markov Algorithms
- Lecture 3: A little about theory of formal languages: Backus-Naur Form and Regular expressions; Pascal intro.
- [Lecture 4](#lecture-4)
- [Lecture 5](#lecture-5)
- [Lecture 6](#lecture-6) **TODO**
- [Lecture 7](#lecture-7)
- [Lecture 8](#lecture-8)
- [Lecture 9](#lecture-9)
- [Lecture 10](#lecture-10)
- [Lecture 11](#lecture-11)

Lecture 4
---------

## Tokens:
- Name
- Number
- String
- Separators
	- Comments: something inside ```{}```

``` 
<program> ::= <heading><block><end>
<end> ::= .
<heading> ::= [program<name>[(<name of thread>{, <name of thread>} ...)];]
```
**Threads:**
- input thread - input (equivalent to C: stdin)
- output thread - output (equivalent to C: stdout)

We will add threads dynamically, in the depth of calculation.

## Blocks
```
<block> ::= [<label section>]
			[<constants section>]
			[<types section>]
			[<variables section>]
			[<procedures and functions section>]
			[<operators section>]
```
Program -> Data processing (in ```<operators section>```) ->:
- Constants
- Variables

We can name operators in order to link to them from different parts of the program. This can be done in ```<label section>```. 

Example:
```
1: x := smth;
goto 1; {bad, better not to use}
```
Actually, we will not use this section.

### Constants section
```
const <name> = <constant>;
	 {<name> = <constant>;} ...
```
Examples:
```
n = 100;
pi = 3.14159;
t = 'abc'; {string constant}
k = n; {copy constant value to another variable}
```
Parameter - constant, but it can change.

### Variables section
```
<variables section> ::= <name> {, <name>} ... : <type>;
					   {<name> {, <name>} ... : <type>;} ...
```
Variables may have next **attributes:** (*required*, not required)
- Name
- Reference: if there is no reference, the variable does not exist (not stored in memory)
- Value
- *Type*
- *Class*: the way of its existence - generation and destruction
	- Static: memory is allocated before calculation starts
	- Automatic
	- Dynamic ("hand management"): generation -> memory allocation

Pascal is strongly (or strictly) typed language.

## Standard types

Two groups:
- Simple
- Complex: consist of simple or complex
- Reference

### Simple types

[Ordinal types](https://www.freepascal.org/docs-html/ref/refsu4.html)

#### 1. Integer number

`var x, y: integer;`. ranges: 
- shortint: [-128, ...,  127]
- byte: [0, ..., 255] = int8
- smallint: [-2^15, ..., 2^15 - 1] = int16
- word: [0, ..., 2^16 - 1]
- longint: [-2^31, ..., 2^31 - 1] = int32
- longword: [0, ..., 2^32 - 1]
- int64: [-2^63, ..., 2^63 - 1]
- qword: [0, ..., 2^64 - 1]

Examples:
```
x: int8; y: longint;
x + y => longint(x) + y; {automatic conversion}
```
```
var a, b: int16;
a + b => longint(a) + longint(b); {result should not be beyond the acceptable range}
```
`-1 mod 2` -> `-1` in `div`, `1` in `mod`

**Writing operations:**
- infix: x+y
- prefix: +xy
- postfix: xy+

Example: `(x+y) *multiply* (a-b)` tranfers to `xy+ab-*multiply*`

#### 2. Real numbers

`var x, y: real;`:
	- a: single;
	- b: double;
	- c: extended;

Examples:
- `A +- *inf* = +-*inf*`
- `+-1 / 0.0 = +-*inf*`
- `+*inf*-*inf* = *NaN* {Not a Number}` 
- `A +- *NaN* = *NaN* {Not a Number}`

**Forbidden: from real to integer**

Conversion functions:
- trunc(x): `trunc(8.7) = 8`
- round(x): `round(8.7) = 9` (round to closest even if x.5 - *bank round*, but in implementatin it is different - *like in school*)

`*NaN* = *NaN*` returns *false* - numbers cannot be compared

#### 3. Character

`var x, y: char;`: 8 bytes

Functions:
- chr(x): `chr(28)` - return 28 symbol of in the alphabet
- ord(x): `ord('A')` - return number of the symbol `'A'`

**Forbidden: char conversion to int** (use only above functions)
**Forbidden: +, -, *, / operations for chars**

- succ(x): `succ(x)` - return next element of ordinal type
- prev(x): `prev(x)` - return previous element of ordinal types

Some types will be discrete (for each element there exists prev and next) and not discrete.

#### 4. Logic type

`var x, y: boolean;`
	- `ord(*false*) = 0`
	- `succ(*false*) = *true*`

Functions:
- `not`
- `and`
- `or`
- `=`
- `<>`
- `>`
- `<`
- `>=`
- `<=`

Lecture 5
---------

Discrete types:
- integer
- char
- boolean
- real

### Simple types

#### 5. Restricted:
```
var x: integer; y: 1..100; c: '0'..'9'; t: true..true; p: '+'..'-';
```
`{$R+}` - control, default = off

#### 6. Enumerable:
```
var x, y: (mon, tue, wed, thu, fri, sat, sun);
```
```
type w: (mon, tue, wed, thu, fri, sat, sun);

var x, y: w;

y := w(4);
```
### Operators section
```
<operators section> ::= begin <operator>{; <operator>}... end.
```
Operators:
- Simple:
	1. goto
	2. empty
	3. assignment
	4. procedure 
- Complex:
	1. complex
	2. selection
	3. cycle
	4. connection

#### Assignment operator
```
<assignment operator> ::= <left part> := <right part>
<left part> ::= <function name> | <variable>
<right part> ::= <expression>
<expression> ::= [{+|-}] {not}... <term>
				 {<binary operation> {not}... <term>}...
<term> ::= <constant> | <variable> | <function pointer> | (<expression>)
<binary operation> ::= + | - | * | / | *div* | *mod* | *or* | *and* | = | <> | > | < | >= | <= | *in*
```
Examples:
```
var x: integer; y: real; z: char; a: boolean;

x+5*y - okay
succ(z) - okay
a *and* *not* a - okay
x+z - wrong
a *and* a *or* a - wrong (only simple logic expressins should be on both sides)
x := z - wrong - need filter, right associative
```
Types must be compatible according to the operation, applied to them, otherwise *SyntaxError*.

Operations priority (smaller number - higher priority):
1. not; +- (unary, right associative)
2. a *power* b
3. */ (left associative); *div* *mod* *and*
4. +- (left associative)
5. `=, <>, >, <, >=, <=, *in*`

Assignment compatibility:
1. types are equal or identical 
```
var x, y: 1..100; {first case}
var x, y: integer; {second case}
var x: integer; y: integer; {third case}
```
2. one type is restriction of other
3. both types are restriction of the same one
```
x: 1..100;
y: -10..20;
```
4. variable - real; expression - integer
5. structural compatibility (only for complex types)

#### Procedure operator

Two groups:
- Standard
	- input (equivalent to stdin)
	- output (equivalent to stdout)
- Custom

##### Input

standard input procedure -> read -> ln -> '(' -> name of input thread -> ',' -> variable -> ')' ->

Possibilities:
- read -> '('
- ln ->  (after ')')
- '(' -> variable
- variable -> ',' -> variable

Thread is text, which consists of lines with different lengths. **Empty `()` - bad: `read()` - wrong!**

Read (thread input) types:
- integer (and restricted)
- real
- character

Example:
```
var x: integer; y: real; z: char;

read(x, y, z);
```
Read(x) in 3 steps:
1. give symbol (trying to construct a valid token), otherwise InputOutputError
2. encoding into the longest of possible ranges
3. `<variable> := <value>`

For error control:
- 1, 2: {$I-}
- 3: {$R+}

Input/Output modes:
- with/without buffering (blocking input/output)
- with/without control
- with/without echo

eoln - end of line

##### Output:

standard output procedure -> write -> ln -> '(' -> name of output thread -> ',' -> expression -> ')' ->

Possibilities:
- write -> '('
- ln ->  (after ')')
- '(' -> expression
- expression -> ',' -> expression

Expression types:
- integer (or restricted)
- real
- character (or restricted)
- boolean
- string

Example:
```
var x: integer; y: real; z: char; t: boolean;

begin
	x := 10;
	y := -12.7;
	z := 'A';
	t := true;

	write(x+1, x+y, succ(z), t);
	write(x+y:8:2); {8 - total number of symbols, 2 - after '.'}
```
Write steps:
1. value (encoded in bits)
2. get token
3. output of all token's symbols

Boolean tokens:
- `TRUE`
- `FALSE`

Lecture 6
---------

Lecture 7
---------

Program 1

```
var
	x, s : integer;

begin
	read(x);
	s := 0;
	x := abs(x);
	repeat
		s := s + x mod 10;
		x := x div 10;
	until x = 0;
	write(s);
end.
```
Program 2

```
{pred = (exists '.') and 
		(sum of digits <= MaxInt)}

var
	c : char;
	s : integer;

begin
	s := -1; {no digits}
	repeat
		read(c);
		if (c <= '9') and (c >= '0') then
			begin
				if s = -1 then 
					begin
						s := 0;
					end
				s := s - ord('0') + ord(c);
			end
	until c = '.';
	if s = -1 then
		write('no digits')
	else
		write(s);	
end.
```
Program 3

```
var
	c : char;
	n, ncom : integer;

begin
	c := ' ';
	n := 0;
	ncom := 0;
	repeat {loop by lines}
		if not eoln then
			begin
				read(c);
				if c = ';' then
					begin
						ncom := ncom + 1;
					end
				while not eoln and (c <> '.') do
					begin
						read(c);
					end;
			end {c - last symbol or '.'}
		n := n + 1;
	until c = '.';
	write((ncom / n * 100):5:1);
end.
```
### Complex types

In Pascal there are four groups:
- array
- records
- set
- file

Abstract type:
1. elements have the same type
2. ordered (discrete)
3. nameless (x[i] or x(.i.))

#### 1. Array

Array may:
- be empty
- change number of elements

type array -> *array* -> '[' -> index type -> ']' -> of -> element type -> ';'

Example:
```
var
	x : array [-10..20] of real;
	y : array [char] of boolean;
	z : array [true..true] of integer;
```
Program 4

```
{pred = (foreach 1 <= i <= n : x is real) and 
		(sum of xi (1 <= i <= j) is real foreach partial sum (1 <= j <= n))}

const n := 10000;

var
	s, x : real;
	i : integer;

begin
	s := 0.0;
	for i := 1 to n do
		begin
			read(x);
			s := s + x;
		end;
	write(s); 
end.
```
Example: 2d array:

```
var
	x, y : array[1..100] of array['0'..'9'] of integer; {x[15]['5']}
	z[1..100, '0'..'9'] of integer; {equivalent entry}
```
Packed array:

```
var
	x : packed array[1..4] of char;
	y : array[1..4] of char;

x := 'abcd'; {possible}
x := 'abc';  {wrong}
y := 'abcd'; {wrong}
```
String array:

```
var
	x, y : string[10];

x := 'abc'; {can store from 0 tp 10 symbols}
y := '12'; 

if x > y then {can compare strings}
x := x + y;	  {can concatenate strings}
```
`k := pos(s1, s2)` - is *s1* included into *s2*. If yes, returns index of the first occurence. Example:

```
pos('ab', 'cab+abd') = 2
pos('', 'abc') = 1
pos('', '') = 1
pos('bc', x)
```
Program 5 (emulation of markov machine)

```
const nmax = 100;

var
	a, b : array[1..nmax] of string;
	st : array[1..nmax] of (ter, nter);
	w : string;
	i, n : 1..nmax;
	k : integer;

begin
	{input n; input a, b, st}
	read(w);
	repeat
		i := 0;
		repeat
			i := i + 1;
			k := pos(a[i], w);
			if k > 0 then
				 w := copy(w, 1, k-1) + b[i] + copy(w, k+length(a[i]), 255)
		until (i = n) or (k > 0);
	until (k = 0) or (st[i] = ter);
end.
```
2 methods to store strings: `String` and `PChar`.

Lecture 8
---------

### Procedures

```
<procedure description> ::= <header> <block> <end>
<end> ::= ;
<header> ::= procedure <name> [(<formal parameters>)];
<parameter form> ::= <section> {;<section>}...
<section> ::= [var] <name> {,<name>}...: <type name>
```
```
<procedure operator> ::= <name> [(<actual parameters>)]
<actual parameters> ::= <expression> {,<expression>}...
```
Semantics of procedure operator:
1. Search for a description
2. Pass parameters
3. Block's execution
4. Return

Correspondence of actual and formal parameters
3. In the following order
1. In number
2. In type:
	- without `var` - by assignment
	- with `var`:
		1. check expression is variable
		2. types should be equal (same name or names-synonyms)

Example:

```
var a, b : integer;

procedure P(x : integer; var y : integer; var a, c : integer;)
	begin
		a := -1;
		c := 2;
		x := 4;
		b := 0;
		y := a + b;
	end;

begin
	a := 1; {a -> |100| -> ?, 1} {|...| - memory cell}
	b := 2; {b -> |101| -> ?, 2, 0, -1}
	P(a + 2, b); {x -> |102| -> 3 (copy), 4 -> destroyed
				  y -> |101| -> b (reference) -> destroyed
				  a_p -> |103| -> ?, -1 -> destroyed
				  c_p -> |104| -> ?, 2 -> destroyed}
	write(a);
end.
```
Program's state - current observation point and all variables ("picture/photo" of a program).

```
procedure Q; forward; {implementation somewhere further in the program}

procedure P; begin Q end;
procedure Q; begin P end;
```
```
procedure P(var x, y);
	begin
		char(x) := 'A';
		real(x) := 3.14159;
	end;
```
```
var x : real; y : integer absolute x;
```

### Functions

Function description:

```
<function description> ::= <header> <block> <end>
<header> ::= function <name> [(<formal parameters>)]: <result type>;
```
Function call:
1. `y := F(x)`
2. `write(F(x))`
3. `P(F(x))`

Comparison of functions and procedures:

```
function sincos(x : real; var y : real) : real;
procedure sincos(x : real; var sin, cos : real);
```
Function signature:
- number of formal parameters
- types of formal parameters
- return type

Lecture 9
---------

### Recursion

Recursion: F -> G -> V -> F

Recursion depth:

```
n = 4 => Fact = 4 * Fact(3)
n = 3 => Fact = 3 * Fact(2)
n = 2 => Fact = 2 * Fact(1)
n = 1 => Fact = 1
```
Depth of the above factorial function is 4.

Another example: calculate sum of array elements:

```
function S(var x: array; n: integer): integer;
begin
	if n = 1 then s := x[1];
	else s := s(x, n-1) + x[n];
end;
```
### Side effects of functions

Remember program status:
- If after procedure call program status does not change, procedure does not do anything (empty procedure).
- If function changed something in program, it has side effect.

Example:

```
var a : integer;

function F(x : integer): integer;
begin
	a := a + 1;
	F := x * a;
end;

begin
	a := 1;
	write(F(a+1)+F(a-1)); {write(F(a-1)+F(a+1)) will return different result}
end.
```
**Side effects are bad, avoid them!**

### Tasks with a variable amount of input data

Example:

```
procedure P;
	var x: integer;
begin
	repeat 
		read(x);
		if x > 0 then
			begin
				P;
				write(x);
				x := 0;
			end
	until x = 0;
end;

begin
	P;
end.
```
### Complex types

#### 2. Record (structure)

Ordered named sequence of data (possibly of different types).

type records -> `record` -> field name (possible several, split by `,`) -> : type -> `;` -> variant part (not obligatory) -> end;

Examples:

```
type 
	Rec = record
		a, b : integer;
		x :	char;
		y : array[1..10] of integer;
	end;

var
	x, z : Rec;
	b, c : integer;

begin
	x := z;
	x.a := z.b;
	a := 0; {Error}
	x.y[3] := 0;
end.
```
```
type 
	Stud = record
		fio : string[30];
		pol : (f, m);
		group : 101..649;
		ex : record
			an, al, pr : 1..5;
		end
	end;

group = array[1..24] of stud;

procedure debtors(var x : group);
	var i: integer;
	begin
		writeln('Debtor: ', x[1].group);
		for i := 1 to 24 do
			if x[i].fio <> '' then
				begin
					if (x[i].ex.an<2) or (x[i].ex.al<2) or (x[i].ex.pr<2) then
						begin
							writeln(x[i].fio);
						end
				end
	end;
```
### Operators section

#### Connection operator 

connection operator -> `with` -> list of variable records -> `do` -> operator -> list of variables values -> list of valid selectors (split by `,`) ->

Example:

```
begin
	for i := 1 to 24 do
		begin
			with x[i], ex do
				if fio <> '' then
					begin
						if (an < 3) or (al < 3) or (pr < 3) then
							begin
								writeln(fio);
							end
					end
		end;
end.
```
### Complex types

#### 3. Set

Restrictions:
1. Size <= 256
2. All elements have the same type, which is base, and their serial numbers in their discrete types must be between 0 and 255
3. All elements are constants (cannot be changed)

Example:

```
var
	k : integer;
	s, y : set of char;
	z : set of '0'...'9';
	a : set of 0..99;
	b : set of 300..310; {Error}

begin {$R-} {turn control off}
	x := y;
	z := a; {Syntax error, different base type}
	z := x; {Check}
	k := 100;
	x := [];
	a := [5, 1, 0..20, k-2];
end.
```
Set is unordered collection of constants.

Operations:
- unification -> x + y
- intersection -> x * y
- x \ y -> x - y
- boolean operations

Lecture 10
----------

### Memory classes

1. 
2. 
3. 
4. **External** (file)

### Complex types

#### 4. File

[File handlling functions](https://www.freepascal.org/docs-html/rtl/system/filefunctions.html)

Example:

```
program A(input, output, F);

type F = file of integer;

var F1, F2 : Fint;

begin
	Assign(F1, 'C:/temp/a.int');
	Reset(F1);
	Assign(output, 'LPT');
end.
```
Access method:
1. Consistent
2. Direct

`Reset(F1);` - opens file *F1* for reading. [Reset](https://www.freepascal.org/docs-html/rtl/system/reset.html)

`var FileMode : integer = {0, 1, 2 - one of this}` [FileMode](https://www.freepascal.org/docs-html/rtl/system/filemode.html)

Example: [{$I-}](https://www.freepascal.org/docs-html/prog/progsu38.html)

```
{$I-} Reset(F1); 
R := IOResult;
if k <> 0 then
	begin
		if k = 2 then {file does not exist}
		else if k = 104 {reading is prohibited}
		{$I+}
	end
```

Task 1:

```
function SumPosGtLast(var F: Fint): integer;
	var x, Last, s : integer;
begin
	Reset(F);
	s := -1; {empty}
	if not eof(F) then
		begin
			s := 0;
			repeat 
				read(F, Last); 
			until eof(F);
			Reset(F);
			repeat 
				read(F, x);
				if (x > 0) and (x > Last) then
					begin
						s := s + x;
					end
			until eof(F);
		end
	SumPosGtLast := s;

end;
```
File modes:
1. Only reading
2. Writing and reading

Task 2:

```
procedure CopyPos(var F, G: Fint);
	var x : integer;
begin
	Reset(F); ReWrite(G);
	while not eof(F) do
		begin
			read(F, x);
			if x > 0 then
				begin
					write(G, x);
				end
		end;
	Close(G); {or Flush(G);}
	Close(F); {better not to write as we were not writing to F}
end;
```
Stream modes:
1. With/without buffering

### Reference

[Pointers](https://www.freepascal.org/docs-html/ref/refse15.html#x42-620003.4)

reference type -> `^` -> type name -> `;` ->

Example:

```
type
	Ri = ^integer; {RRi = ^^integer; - syntax error}
	RRi = ^Ri;

var
	a, b : integer;
	x, y : Ri;
	p, q : RRi;

begin
	{a -> |100| -> ?}
	{b -> |101| -> ?}
	{x -> |102| -> |?|}
	{y -> |103| -> |?|}
	{p -> |104| -> |?|}
	{q -> |105| -> |?|}
	a := 1;
	{a -> |100| -> 1}
	b := a + 1;
	{b -> |101| -> 2}
	x := y;
	{x := @a; => x -> |102| -> |100| - prohibited in standard, but not in FPC}
	new(x);
	y := x;
	{x -> |102| -> |106| -> ? (same for y)}
	{y -> |103| -> |106| -> ? (same for x)}
	x^ := 3;
	{x -> |103| -> |106| -> 3}
	new(x);
	x^ := -2;
	{x -> |102| -> |107| -> -2}
	new(x); new(p);
	{x -> |102| -> |108| -> ?}
	{p -> |104| -> |109| -> |?|}
	p^ := x;
	{p -> |104| -> |109| -> |108|}
end.
```
Lecture 11
----------

### Queue

[Doubly linked list](https://en.wikipedia.org/wiki/Doubly_linked_list):
`x <- | | <-> | | <-> | | <-> |.|` - each element knows previous and next element

[Linked list](https://en.wikipedia.org/wiki/Linked_list):
`x <- | | --> | | --> | | --> |.|` - each elements knows only next element

#### Bad implementation

Implementation:

```
type
	Link = ^elem;
	elem = record
		n : integer;
		next : Link;
	end;

	Queue = Link;

var x, y : Queue;
```
Let's find length of Queue:

```
function Len(x : Queue) : integer;
	var n : integer;
begin
	n := 0;
	while x <> nil do begin
		n := n+1; x := x^.next;
	end;
	Len := n;
end;
```
Let's insert element in Queue:

```
procedure InQueue(var x : Queue, y : integer);
	var p, q : Link;
begin
	new(p); p^.n := y; p^.next = nil;
	if x = nil then begin
		x := p;
	end
	else begin
		q := x;
		while q^.next <> nil do begin
			q := q^.next;
		end;
		q^.next = p;
	end
end;
```
Let's delete first element from Queue

```
function FromQueue(var x : Queue) : Link;
	var
begin
	FromQueue := x;
	if x <> nil then begin
		x := x^.next;
	end
end;
```
Recursive implementations:

```
function Len(x : Queue) : integer;
begin
	Len := 0;
	if x <> nil then Len := 1 + Len(x^.next)
end;
```

#### Better implementation

Better Queue implementation:

```
type
	Link = ^elem;
	elem = record
		n : integer;
		next : Link;
	end;

	Queue = record
		H, K : Link;
		Len : integer;
	end;

var x : Queue;

begin
	x.H := nil; {K := nil;}
	x.Len := 0;
	{procedure InitQueue(var x : Queue);}
```

New Len implementation:

```
function Len(x : Queue) : integer;
begin
	Len := x.Len;
end;
```
New InQueue implementation:

```
procedure InQueue(var x : Queue; y : integer);
	var p : Link;
begin
	new(p); p^.n := y; p^.next := nil;
	x.K^.next := p; x.K := p; x.Len := x.Len + 1;
end;
```
New FromQueue implementation:

```
function FromQueue(var x : Queue) : Link;
begin
	FromQueue := x.H;
	if x.H <> nil then begin
		x.H := x.H^.next; x.Len := x.Len - 1;
	end
end;
```

### Dequeue

In Queue we can push back, pop front.
In Dequeue we can push back, push front, pop back, pop front. 

### List

### Stack

Quite important d.s., all computers implement it at hardware level.
