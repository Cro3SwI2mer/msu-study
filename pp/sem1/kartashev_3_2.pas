Program Distance;

var

	x1, y1, x2, y2, diffx, diffy, res: real;

begin

	write('Input first point: ');
	readln(x1, y1);
	write('Input second point: ');
	readln(x2, y2);

	diffx := x2 - x1;
	diffy := y2 - y1;

	res := sqrt(diffx * diffx + diffy * diffy);
	writeln('Distance: ', res);

end.
