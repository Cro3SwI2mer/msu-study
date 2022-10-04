Program First;

var 
	x: real;
begin
	write('Input number: ');
	readln(x);
	x := frac(x);
	x := x * 10;
	x := trunc(x);
	writeln(x:1:0);
end.
