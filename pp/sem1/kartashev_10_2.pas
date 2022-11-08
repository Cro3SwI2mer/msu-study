program sequence_of_words;

label 1;

const
	n = 10;
	k = 5;

var
	s, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10 : string;
	i, j, cms, count, start, stop : integer;
	vec : array[1..10] of integer;
	words : array[1..10] of string;
	cmp : boolean;

begin

	readln(s);
	count := 1; start := 1; stop := 1;
	cms := 0;
	for i := 1 to length(s) do
		begin
			if s[i] = ',' then cms := cms + 1;
		end;
	if cms > 9 then
		begin
			writeln('Wrong input: number of words > 10!');
			goto 1;
		end
	else
	begin
	
	for i := 1 to length(s) do
		begin
			if (s[i] <> ',') and (s[i] <> '.') then
				begin
					stop := stop + 1;
				end
			else
				begin
					if (s[i] = ',') then
						begin
							case count of
								1: s1 := copy(s, start, stop - start);
								2: s2 := copy(s, start, stop - start);
								3: s3 := copy(s, start, stop - start);
								4: s4 := copy(s, start, stop - start);
								5: s5 := copy(s, start, stop - start);
								6: s6 := copy(s, start, stop - start);
								7: s7 := copy(s, start, stop - start);
								8: s8 := copy(s, start, stop - start);
								9: s9 := copy(s, start, stop - start);
								10: s10 := copy(s, start, stop - start);
							end;
							count := count + 1;
							start := stop + 1;
							stop := stop + 1;
						end
					else
						begin
							if (s[i] = '.') then
								begin
									case count of
										1: s1 := copy(s, start, stop - start);
										2: s2 := copy(s, start, stop - start);
										3: s3 := copy(s, start, stop - start);
										4: s4 := copy(s, start, stop - start);
										5: s5 := copy(s, start, stop - start);
										6: s6 := copy(s, start, stop - start);
										7: s7 := copy(s, start, stop - start);
										8: s8 := copy(s, start, stop - start);
										9: s9 := copy(s, start, stop - start);
										10: s10 := copy(s, start, stop - start);
									end;
									start := stop + 1;
									stop := stop + 1;
									break;
								end
						end
				end
		end;
	
	write('a) ');
	for i := count downto 1 do
		begin
			case i of
				1: write(s1);
				2: write(s2);
				3: write(s3);
				4: write(s4);
				5: write(s5);
				6: write(s6);
				7: write(s7);
				8: write(s8);
				9: write(s9);
				10: write(s10);
			end;
			write(' ');
		end;
	writeln('');
	
	for i := 1 to count do
		begin
			case i of
				1: words[i] := s1;
				2: words[i] := s2;
				3: words[i] := s3;
				4: words[i] := s4;
				5: words[i] := s5;
				6: words[i] := s6;
				7: words[i] := s7;
				8: words[i] := s8;
				9: words[i] := s9;
				10: words[i] := s10;
			end;
		end;
	for i := 1 to count do
		vec[i] := 1;
	for i := 1 to count do
		begin
			for j := 1 to count do
				begin
					cmp := words[i] > words[j];
					if cmp then
						begin
							vec[i] := vec[i] + 1;
						end
					
				end;
		end;
		
	write('b) ');
	for i := 1 to count do
		begin
			for j := 1 to count do
				begin
					if (vec[j] = i) then
						begin
							write(words[j], ' ');
						end
				end;
		end;
	writeln('');

	end;
	
1: end.
