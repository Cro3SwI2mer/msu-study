program three_digit_num;

var num, c : longint;

begin
	readln(num);
	if (num > 99) and (num < 1000) then
		begin
			while num > 0 do
				begin
					c := num mod 10;
					writeln(c);
					num := num div 10;
				end;
		end
	else
		writeln('Wrong number!');
end.
