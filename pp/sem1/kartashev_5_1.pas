program calculator;

var 
	x, y: double;
	c: char;

begin

	readln(x, y);
	readln(c);

	case c of
		'+': writeln(x + y);
		'-': writeln(x - y);
		'*': writeln(x * y);
		'/': 
			begin
				if y = 0 then
					writeln('Division by zero!')
				else
					writeln(x / y);
			end;
			
		else writeln('Wrong input!');
	end;

end.

