program select_twodigit_by_sum;

var 
	i, s, sum: integer;

begin

	readln(s);
	
	for i := 10 to 99 do
		begin		
			sum := (i div 10) + i mod 10;
			if sum = s then
				writeln(i);
		end;

end.
