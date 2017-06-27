var
        n: int64;
        i: longint;
        F, a: array[0..100] of int64;
begin
        readln(n);
        for i := 1 to n do
                read(a[i]);
        F[0] := 1;
        for i := 1 to n do
        if a[i] <= F[i - 1] then
                F[i] := F[i - 1] + a[i]
        else
                begin
                F[i] := F[i - 1];
                break;
                end;
        writeln(F[i]);
end.