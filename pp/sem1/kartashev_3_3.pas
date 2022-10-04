Program Trapezoid_Area;

var

	b1, b2, h, res: real;

begin

	write('First base: ');
	readln(b1);
	write('Second base: ');
	readln(b2);
	write('Height: ');
	readln(h);

	res := h * (b1 + b2) / 2; 
	writeln('Trapezoid area: ', res);

end.

