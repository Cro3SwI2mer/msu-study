Program NumSum;
var
	x, res: Longint;
begin
	write('Number: ');
	readln(x);
	res := 0;
	while x > 0 do
		begin
			res := res + x mod 10;
			x := x div 10;
		end;
	writeln('Sum: ', res);
end.
