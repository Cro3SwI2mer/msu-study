program some_strange_multiply;

var
	i, j, n : integer;
	res, curr, help : real;

begin

	write('Miss multiplier: ');
	readln(n);
	res := 1;
	help := -20;
	for i:= 1 to 6 do
		begin
			help := help + 20;
			if i = n then
				continue
			else
				begin
					curr := 0;
					for j := 1 to 20 do
						begin
							curr := curr + 1 / (help + j);
						end;
					res := res * curr;
				end
		end;
	writeln(res);
	
end.

