const
        maxN = 100;
var
        i, j, n, res, tmp: longint;
        a, H: array[1..maxN] of longint;
begin
        readln(n);
        for i := 1 to n do
                read(a[i]);
        for i := 1 to n - 1 do
        for j := i + 1 to n do
        if a[i] > a[j] then
                begin
                tmp := a[i];
                a[i] := a[j];
                a[j] := tmp;
                end;
        for i := 1 to n do
                H[i] := 1;
        res := 1;
        for i := 2 to n do
        for j := 1 to i - 1 do
        if H[j] <= A[i] then
        if H[i] < H[j] + 1 then
                begin
                H[i] := H[j] + 1;
                if H[i] > res then
                        res := H[i];
                end;
        writeln(res);
end.
