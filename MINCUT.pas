const
        inp = 'MINCUT.inp';
        out = 'MINCUT.out';
        maxn = 1000;
var
        fi, g: text;
        res: longint;
        i, j, n, m, k, x, y, u, v: longint;
        a, f: array[0..maxn,0..maxn] of longint;
function sum(i, j, k, z: longint): longint;
        begin
        exit(F[k,z] - F[i - 1,z] - F[k,j - 1] + F[i - 1, j - 1]);
        end;
procedure process;
        var
                i: longint;
        begin
        for i := x to u - 1 do
        if abs(sum(x, y, i, v) - sum(i + 1, y, u, v)) < res then
                res := abs(sum(x, y, i, v) - sum(i + 1, y, u, v));
        for i := y to v - 1 do
        if abs(sum(x, y, u, i) - sum(x, i + 1, u, v)) < res then
                res := abs(sum(x, y, u, i) - sum(x, i + 1, u, v));
        end;
begin
        assign(fi, inp);
        reset(fi);
        readln(fi, m, n, k);
        for i := 1 to m do
        for j := 1 to n do
                begin
                read(fi, a[i,j]);
                f[i,j] := f[i - 1,j] + f[i,j - 1] - f[i - 1,j - 1] + a[i,j];
                end;
        assign(g, out);
        rewrite(g);
        for i := 1 to k do
                begin
                read(fi, x, y, u, v);
                res := maxlongint;
                process;
                writeln(g, res);
                end;
        close(g);
        close(fi);
end.



