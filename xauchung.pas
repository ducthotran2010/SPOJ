const
        inp = 'xauchung.inp';
        out = 'xauchung.out';
        maxN = 2000;
var
        n, m: longint;
        x, y, res: ansistring;
procedure enter;
        begin
        assign(input, inp);
        reset(input);
        readln(x);
        readln(y);
        n := length(x);
        m := length(y);
        close(input);
        end;
function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;
procedure process;
        var
                i, j, k: longint;
        begin
        for i := 1 to n do
        for j := i + 1 to n do
        for k := 1 to m do
        if copy(x, i, j - i + 1) = copy(y, k, j - i + 1) then
        if j - i + 1 > length(res) then
                res := copy(x, i, j - i + 1);
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
