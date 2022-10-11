program prime_numbers;

label 1, 2;

var
	n, i, j : longint;
	check : boolean;

begin

	readln(n);
2:  if n < 2 then goto 1;
	for i := 2 to n do
		begin
			check := true;
			for j := 2 to i do
				begin
					if (i mod j = 0) and (i <> j) then
						begin
							check := false;
							break;
						end
					else
						continue;
				end;
			if check then
				write(i, ' ')
			else
				continue;
		end;
	writeln('');

1: end.
