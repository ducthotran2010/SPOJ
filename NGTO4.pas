const
        maxN = 1000 * 1000;
var
        t, i, n: longint;
        F: array[0..maxN] of longint;
        a: array[1..4] of longint = (2, 3, 5, 7);
procedure init;
        var
                i, j: longint;
        begin
        for i := 0 to maxN do
                F[i] := maxlongint - 1;
        for i := 1 to 4 do
                F[a[i]] := 1;
        for i := 4 to maxN do
        for j := 1 to 4 do
        if i - a[j] > 0 then
        if F[i] > F[i - a[j]] + 1 then
                F[i] := F[i - a[j]] + 1;
        end;
begin
        init;
        readln(t);
        for i := 1 to t do
                begin
                readln(n);
                if F[n] = maxlongint - 1 then
                        writeln(-1)
                else
                        writeln(F[n]);
                end;
end.
