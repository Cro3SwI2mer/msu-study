program into_area;

var 

i: integer;
x, y : real;

begin
	readln(i);
	while i > 0 do
		begin
			i := i-1;
			readln(x, y);
			if (x*x + y*y <= 1) and (abs(x) + abs(y) >= 1) then
				writeln('Yes')
			else
				writeln('No');
		end;
end.
