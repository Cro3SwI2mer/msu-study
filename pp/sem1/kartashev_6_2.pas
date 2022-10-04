program search_fibonacci_number;

var
	a, b, m: integer;

begin

	readln(m);
	a := 0;
	b := 1;
	while (a <= m) and (b <= m) do
		begin
			if a <= b then
				a := a + b
			else
				b := a + b;
		end;
	if a > b then
		writeln(a)
	else
		writeln(b);

end.
