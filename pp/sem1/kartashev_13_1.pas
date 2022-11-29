program calculate_expression;

uses complexn;

var
	res, a, b, c, d, e, f : complex;

begin

	a.re := 17; a.im := 31;
	b.re := 7; b.im := 1;
	c.re := 12; c.im := 0;
	d.re := 1; d.im := 1;
	e.re := 0.25; e.im := 0;
	f.re := 0; f.im := 1;

	res := addc(mulc(e, addc(divc(a, b), divc(c, d))), f);
	
	writeln('result: ', res.re:5:2, ' + ', res.im:5:2, 'i');

end.
