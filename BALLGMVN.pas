const
        inp = '';
        out = '';
        maxn = 1000;
type
        typLine = record
                a, b, c: real;
                end;
var
        f: text;
        n: longint;
        found: boolean;
	Dx, Dy, Xx, Xy: array[1..maxn] of longint;
procedure input;
	var
		f: text;
		i: longint;
	begin
	assign(f, inp);
	reset(f);
	readln(f, n);
	for i := 1 to n do
		read(f, Xx[i], Xy[i]);
	for i := 1 to n do
		read(f, Dx[i], Dy[i]);
	close(f);
	end;
procedure process;
	var
		i, j, k: longint;
                d1, d2: typLine;
	function check: boolean;
		var
			D, Dx, Dy: real;
		begin
		D := d1.a * d2.b - d2.a * d1.b;
		if D = 0  then
			begin
			Dx := d2.b * d1.c - d1.b * d2.c;
			Dy := d1.a * d2.c - d2.a * d1.c;
			exit(Dx = Dy);
			end
		else
			exit(false);
		end;
	function createline(x1, y1, x2, y2: longint): typLine;
		var
			d: typLine;
		begin
		d.a := y2 - y1;
		d.b := x1 - x2;
		d.c := x2 * y1 - x1 * y2;
		exit(d);
		end;
        begin
	for i := 1 to n do
		begin
		for j := 1 to n do
		for k := j + 1 to n do
			begin
			d1 := createline(Xx[i], Xy[i], Dx[j], Dy[j]);
			d2 := createline(Xx[i], Xy[i], Dx[k], Dy[k]);
                        if Check then
                                begin
                                writeln(f, i, ' ',j + n, ' ', k + n);
                                close(f);
                                halt;
                                end;
			end;
		end;

	for i := 1 to n do
		begin
                for j := 1 to n do
                for k := j + 1 to n do
			begin
			d1 := createline(Dx[i], Dy[i], Xx[j], Xy[j]);
			d2 := createline(Dx[i], Dy[i], Xx[k], Xy[k]);
                        if Check then
                                begin
                                writeln(f, i + n, ' ', j, ' ', k);
                                close(f);
                                halt;
                                end;
			end;
		end;
        end;
begin
        found := false;
	input;
        assign(f, out);
        rewrite(f);
        if n <= 100 then
        process
        else
                writeln(f, -1);
        if not found then
                writeln(f, -1);
        close(f);
end.
