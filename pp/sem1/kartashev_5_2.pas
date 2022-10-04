program arabic_to_roman;

var
	k: longint;

begin

	readln(k);

	if (k < 1) or (k > 39) then
		writeln(0)
	else
	
	begin
		while k >= 10 do
			begin
				write('X');
				k := k - 10;
			end;
	
		if k > 0 then
			begin
				if k = 9 then
					write('IX')
				else
					begin
						if k >= 5 then
							begin
								write('V');
								k := k - 5;
								while k > 0 do
									begin
										write('I');
										k := k - 1;
									end;
							end	
						else
							begin
								if k = 4 then
									write('IV')
								else
									begin
										while k > 0 do
											begin
												write('I');
												k := k - 1;
											end;
									end
							end	
					end
			end
		else
			write();
		writeln();
	end

end.
