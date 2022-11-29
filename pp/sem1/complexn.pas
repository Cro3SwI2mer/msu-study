unit complexn;

interface

type
	complex = record
		re, im : real;
	end;

function addc(x, y : complex): complex;
function subc(x, y : complex): complex;
function mulc(x, y : complex): complex;
function divc(x, y : complex): complex;

implementation

function addc(x, y : complex): complex;
begin
	addc.re := x.re + y.re;
	addc.im := x.im + y.im;
end;

function subc(x, y : complex): complex;
begin
	subc.re := x.re - y.re;
	subc.im := x.im - y.im;
end;

function mulc(x, y : complex): complex;
begin
	mulc.re := x.re * y.re - x.im * y.im;
	mulc.im := x.re * y.im + x.im * y.re; 
end;

function divc(x, y : complex): complex;
begin
	divc.re := (x.re * y.re + x.im * y.im) / (y.re * y.re + y.im * y.im);
	divc.im := (x.im * y.re - x.re * y.im) / (y.re * y.re + y.im * y.im);
end;

end.
