program mycosx;

var
	x, eps : real;
	res, curr, num, den : real;
	n, i, j : integer;

begin
	
	write('Input number of test cases: ');
	readln(n);
	for i := 1 to n do
		begin
			write('Input x: ');
			readln(x);
			write('Input eps: ');
			readln(eps);
			if (x < 0) or (x > 3) then
				begin
					writeln('Wrong input: x out of range!');
					break;
				end
			else
				begin
					res := 0;
					j := 0;
					num := 1;
					den := 1;
					curr := num / den;
					res := res + curr;
					while abs(curr) >= eps do
						begin
							j := j + 2;
							den := den * (j-1) * j;
							num := -1 * num * x * x;
							curr := num / den;
							res := res + curr;
						end;
					writeln(cos(x), res);
				end
		end;

end.
