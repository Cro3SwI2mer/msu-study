program days_in_month;

type 
	month = (jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, december);

var
   num: integer;
   d: 28..31;
   m: month;

begin

	write('Write number of month from 1 to 12: ');
	readln(num);
	dec(num);
	m := jan;
	inc(m, num);

	case m of
		jan, mar, may, jul, aug, oct, december: d:= 31;
		feb: d:= 28;
		apr, jun, sep, nov: d:= 30;
	end;

	writeln(d);

end.
