const
        inp = 'LINEGAME.inp';
        maxn = 1000 * 1000;
var
        n: longint;
        a: array[1..maxN] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i:= 1 to n do
                read(a[i]);
        close(input);
        end;

function max(a, b: int64): int64;
        begin if a > b then max := a else max := b; end;

procedure process;
        var
                i, j: longint;
                f1, f2, tmp: int64;
        begin
        f2 := 0;
        f1 := a[1];
        f2 := f1 - a[2];
        f1 := max(a[2], f1);
        for i := 3 to n do
                begin
                tmp := f1;
                f1 := max(f2 + a[i], f1);
                f2 := max(tmp - a[i], f2);
                end;
        writeln(max(f2, f1));
        end;
begin
        enter;
        if n > 1 then
                process
        else
                writeln(a[1]);
end.
