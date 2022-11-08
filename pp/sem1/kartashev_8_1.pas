program array_of_indexes;

var
	n, i : integer;
	inp, res : array[1..100] of integer;

begin
	writeln('Input number of elements in array:');
	readln(n);
	if (n <= 0) or (n > 100) then
		writeln('Wrong input!')
	else
		begin
			writeln('Input array elements:');
			for i := 1 to n do
				begin
					read(inp[i]);
					if inp[i] = 0 then
						res[i] := 1
					else
						res[i] := 0;
				end;
			writeln('Indexes:');
			for i := 1 to n do
				begin
					if res[i] = 1 then
						write(i, ' ');
				end;
			writeln('');
		end
end.
