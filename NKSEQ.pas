const
        INP = '';
        OUT = '';
        MAXN = 2 * trunc(1e5);
var
        n, res, n2: Longint;
        a, F: array[0..MAXN] of Longint;
        L: array[0..20,1..MAXN] of Longint;
procedure enter;
        var
                i: Longint;
        begin
        readln(n);
        for i := 1 to n do read(a[i]);
        end;
procedure init;
        var
                i: Longint;
        begin
        F[0] := 0;
        n2 := n shl 1;
        for i := 1 to n do a[i + n] := a[i];
        for i := 1 to n2 do
                F[i] := F[i - 1] + a[i];
        end;
function min(a, b: Longint): Longint;
        begin if a < b then min := a else min := b end;
procedure initRMQ;
        var
                i, j: Longint;
        begin
        for i := 1 to n2 do L[0, i] := F[i];
        for i := 1 to trunc(ln(n2)/ln(2)) do
        for j := 1 to n2 - (1 shl i) + 1 do
                L[i, j] := min(L[i - 1, j], L[i - 1, j + 1 shl (i - 1)]);
        end;
function getV(i, j: Longint): Longint;
        var
                k: Longint;
        begin
        k := j - i + 1;
        k := trunc(ln(k) / ln(2));
        getV := min(L[k, i], L[k, j - (1 shl k) + 1]);
        end;
procedure solve;
        var
                i: Longint;
        begin
        res := 0;
        for i := 1 to n do
        if F[i - 1] <= getV(i, i + n - 1) then
                res := res + 1;
        writeln(res);
        end;
begin
        enter;
        init;
        initRMQ;
        solve;
end.

