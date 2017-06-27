var
        n, k: Longint;
        d: array[1..100000] of Boolean;
        f: array[0..100000] of Int64;
procedure enter;
        var
                x: Longint;
                i: Longint;
        begin
        readln(n, k);
        for i := 1 to k do
                begin
                read(x);
                d[x] := true;
                end;
        end;
procedure solve;
        var
                i: Longint;
        begin
        F[0] := 0;
        F[1] := 1;
        for i := 2 to n do
        if not d[i] then
                F[i] := (F[i - 1] + F[i - 2]) mod 14062008;
        writeln(F[n]);
        end;
begin
        enter;
        solve;
end.