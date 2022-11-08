program students;

label r1, r2, r3;

var
	st : array[1..30] of integer;
	eng : set of 1..30;
	fre : set of 1..30;
	ger : set of 1..30;
	help : set of 1..30;
	i, stud : integer;

begin
	randomize;
	eng := []; fre := []; ger := [];
	for i := 1 to 30 do st[i] := 0;
	for i := 1 to 20 do
		begin
			r1: stud := random(29) + 1;
			help := [stud];
			if stud in eng then 
				begin
					goto r1;
				end
			else
				eng := eng + help;
		end;
	for i := 1 to 15 do
		begin
			r2: stud := random(29) + 1;
			help := [stud];
			if stud in fre then
				begin
					goto r2;
				end
			else
				fre := fre + help;
		end;
	for i := 1 to 10 do
		begin
			r3: stud := random(29) + 1;
			help := [stud];
			if stud in ger then 
				begin	
					goto r3;
				end
			else
				ger := ger + help;
		end;
	for i := 1 to 30 do
		begin
			if i in eng then st[i] := st[i] + 1;
			if i in fre then st[i] := st[i] + 1;
			if i in ger then st[i] := st[i] + 1;
		end;
	write('Know 3 languages: ');
	for i := 1 to 30 do
		begin
			if st[i] = 3 then write(i, ' ');
		end;
	writeln('');
	write('Know 0 languages: ');
	for i := 1 to 30 do
		begin
			if st[i] = 0 then write(i, ' ');
		end;
	writeln('');
end.
