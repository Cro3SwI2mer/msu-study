program find_zero_of_function;

label 1;

type
	myfunc = Function(x : double) : double;
	mynum = double;

var
	f : myfunc;
	num : integer;
	a, b, eps : mynum;
	res : mynum;

function f1(x : mynum) : mynum;
	begin
		f1 := x - 1.0;
	end;

function f2(x : mynum) : mynum;
	begin
		f2 := x * x * x - 3.0;
	end;

function f3(x : mynum) : mynum;
	begin
		f3 := cos(x);
	end;

function root(func : myfunc; a, b, eps : mynum) : mynum;
	var
		med : mynum;
	begin
		med := (a + b) / 2;
		if ((b - a) < eps) then
			begin
				root := med;
			end
		else
			begin
				if (func(med) > 0) then
					begin
						root := root(func, a, med, eps);
					end
				else
					begin
						root := root(func, med, b, eps);
					end
			end
	end;

begin
	a := 0.0; b := 2.0;
	write('Input epsilon: '); readln(eps);
	if eps < 0 then
		begin
			writeln('Wrong input!');
			goto 1;
		end
	else
		begin
			write('Input function number: '); readln(num);
			case num of
				1: f := @f1;
				2: f := @f2;
				3: f := @f3;
			else
				begin
					writeln('Wrong input!');
					goto 1;
				end
			end;
			res := root(f, a, b, eps);
			writeln(res);
		end;
1: end.
