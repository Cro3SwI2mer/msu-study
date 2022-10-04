program gcd;

var
	a, b, mi, ma, hma, hmi: integer;

begin

	readln(a, b);
	
	if a <= b then
		begin
			mi := a;
			ma := b;
		end
	else
		begin
			mi := b;
			ma := a;
		end;
	
	repeat
		hma := ma;
		hmi := mi;
		ma := mi;
		mi := hma mod hmi;
	until mi = 0;
	
	writeln(ma);

end.	
