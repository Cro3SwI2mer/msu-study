program operations_on_the_matrix;

type
	vector = array[1..5] of real;
	matrix = array[1..5] of vector;

var
	minp, mout : matrix;
	minelem, maxelem : real;
	i, j, imin, jmin, imax, jmax : integer;

begin
	randomize;
	for i := 1 to 5 do
		begin
			for j := 1 to 5 do
				begin
					minp[i, j] := random;
				end;
		end;
	maxelem := -1;
	for i := 1 to 5 do
		begin
			for j := 1 to 5 do
				begin
					if minp[i, j] > maxelem then
						begin
							maxelem := minp[i, j];
							imax := i;
							jmax := j;
						end
				end;
		end;
	minelem := 2;
	for i := 2 to 5 do
		begin
			for j := 1 to i-1 do
				begin
					if minp[i, j] < minelem then
						begin
							minelem := minp[i, j];
							imin := i;
							jmin := j;
						end		
				end;
		end;
	mout[1] := minp[5]; mout[5] := minp[1];
	for i := 2 to 4 do
		begin
			mout[i] := minp[i];
		end;
	writeln('a) ', maxelem:3:2, ' ', imax, ' ', jmax);
	writeln('b) ', minelem:3:2, ' ', imin, ' ', jmin);
	writeln('c)');
	for i := 1 to 5 do
		begin
			for j := 1 to 5 do
				begin
					write(mout[i, j]:3:2, ' ');
				end;
			writeln('');
		end;
end.
