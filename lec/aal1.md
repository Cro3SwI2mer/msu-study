Algorithms and Algorithmic Languages
====================================

First term courses, read at the Faculty of Computational Mathematics and Cybernetics, Moscow State University.

- Lecture 1: Turing Machine
- Lecture 2: Normal Markov Algorithms
- Lecture 3: A little about theory of formal languages: Backus-Naur Form and Regular expressions; Pascal intro.
- [Lecture 4](#lecture-4)
- [Lecture 5](#lecture-5)

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

#### 1. Integer number

`var x, y: integer;`. ranges: 
- smallint: [-128, ...,  128]
- byte: [0, ..., 255] = int8
- shortint: [-2^15, ..., 2^15 - 1] = int16
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
- Complex

#### 3. Assignment operator
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

#### 4. Procedure operator

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
