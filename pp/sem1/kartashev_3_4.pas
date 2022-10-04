Program In_Circle;

var

	x, y, r, res: real;

begin

	write('Point: ');
	readln(x, y);
	write('Radius: ');
	readln(r);
	res := sqrt(x * x + y * y) - r;

	if res <= 0 then

	writeln('Yes')

	else

	writeln('No');

end.
