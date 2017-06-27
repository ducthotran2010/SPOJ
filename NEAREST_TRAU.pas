const
        inp = 'NEAREST.inp';
        out = 'NEAREST2.out';
        maxN = 1000;
var
        n: longint;
        res: real;
        x, y: array[1..maxN] of real;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(x[i], y[i]);
        close(input);
        end;
procedure process;
        var
                i, j: longint;
        begin
        res := maxlongint;
        for i := 1 to n do
        for j := i + 1 to n do
        if sqrt(sqr(x[i] - x[j]) + sqr(y[i] - y[j])) < res then
                res := sqrt(sqr(x[i] - x[j]) + sqr(y[i] - y[j]));
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res:0:3);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
