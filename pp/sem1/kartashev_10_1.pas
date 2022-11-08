program counting_occurrences;

label 0;

type
	stroka = string[20];

const
	v = 'aeiou';

var
	s : stroka;
	k : 0..20;
	i, j, vlen : integer;

begin
	write('Input s: ');
	readln(s);
	if length(s) < 20 then
		begin
			writeln('s length is not equal to 20!');
			goto 0;
		end
	else
		k := 0;
		vlen := length(v);
		for i := 1 to 20 do
			begin
				for j := 1 to vlen do
					begin
						if s[i] = v[j] then
							begin
								k := k + 1;
								break;
							end
						else
							continue;
					end;
			end;
		writeln(k);
0: end.
