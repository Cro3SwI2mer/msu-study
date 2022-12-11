program merging_ordered_lists;

type
	elem = record
		value : integer;
		next : ^elem;
		prev : ^elem;
	end;

	linked_list = ^elem;

var
	s1, s2, i : integer;
	l1, l2 : linked_list;

procedure insert_elem(var l : linked_list; x : integer);
	var
		p, q : linked_list;
	begin
		new(p); p^.value := x; p^.next := nil; p^.prev := nil;
		if l = nil then
			begin
				l := p;
			end
		else
			begin
				q := l;
				while (q^.next <> nil) and (q^.value < p^.value) do
					begin
						q := q^.next;
					end;
				if q^.next = nil then
					begin
						if q^.value < p^.value then
							begin
								q^.next := p; 
								p^.prev := q;
							end
						else
							begin
								if q^.prev <> nil then q^.prev^.next := p;
								p^.prev := q^.prev;
								p^.next := q;
								q^.prev := p;
							end;
					end
				else
					begin
						if q^.value < p^.value then
							begin
								if q^.next <> nil then q^.next^.prev := p;
								p^.next := q^.next;
								p^.prev := q;
								q^.next := p;
							end
						else
							begin
								if q^.prev <> nil then q^.prev^.next := p;
								p^.prev := q^.prev;
								p^.next := q;
								q^.prev := p;
							end;
					end;
				if p^.prev = nil then l := p;
			end;
	end;

procedure merge_lists(var l1, l2 : linked_list);
	var
		c2 : linked_list;
	begin
		c2 := l2;
		if c2 <> nil then
			begin
				insert_elem(l1, c2^.value);
				while c2^.next <> nil do
					begin
						c2 := c2^.next; insert_elem(l1, c2^.value);
					end;
			end;
	end;

procedure print_list(var l : linked_list);
	var
		p : linked_list;
	begin
		p := l;
		if p <> nil then
			begin
				write(p^.value); write(' ');
				while (p^.next <> nil) do
					begin
						p := p^.next; write(p^.value); write(' ');
					end;
				writeln('');
			end
		else
			writeln('empty list');
	end;

procedure delete_list(var l : linked_list);
	var
		p : linked_list;
	begin
		while l^.next <> nil do
			begin
				l := l^.next; p := l^.prev;
				p^.next := nil; l^.prev := nil;
				dispose(p);
			end;
		l^.prev := nil;
		dispose(l);
	end;

begin
	
	randomize;
	
	write('Input L1 size: '); readln(s1);
	write('Input L2 size: '); readln(s2);
	
	for i := 1 to s1 do
		begin
			insert_elem(l1, random(98) + 1);
		end;
	for i := 1 to s2 do
		begin
			insert_elem(l2, random(98) + 1);
		end;

	write('L1 elements: '); print_list(l1);
	write('L2 elements: '); print_list(l2);
	
	merge_lists(l1, l2);
	write('Merged lists: '); print_list(l1);

	delete_list(l1); delete_list(l2);
	
end.
