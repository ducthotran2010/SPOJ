const
        MAXN = 500000;
var
        x: Longint;
        a: array[0..MAXN] of Longint;
        d: array[0..3012500] of Boolean;
procedure init;
        var
                i, max: Longint;
        begin
        a[0] := 0;
        d[0] := true;
        for i := 1 to MAXN do
                begin
                a[i] := a[i - 1] - i;
                if (a[i] < 0) or d[a[i]] then
                        a[i] := a[i - 1] + i;
                d[a[i]] := true;
                end;
        end;
begin
        init;
        repeat
                readln(x);
                if x <> -1 then
                        writeln(a[x]);
        until x = -1;
end.