const
        inp = '';
        maxN = trunc(1e3);
        Base = trunc(1e9);
var
        i, n: longint;
        F, a: array[-1..maxN + 2] of longint;
begin
        assign(input, inp);
        reset(input);
        readln(n);
        a[1] := 0;
        a[n + 2] := 0;
        for i := 2 to n + 1 do
                read(a[i]);
        close(input);
        F[1] := 1;
        for i := 2 to n + 2 do
                begin
                F[i] := 0;
                if a[i] = 0 then
                        begin
                        if a[i - 1] in [0..1] then
                                F[i] := (F[i] + F[i - 1]) mod Base;
                        if a[i - 2] in [0..1] then
                                F[i] := (F[i] + F[i - 2]) mod Base;
                        if a[i - 3] = 0 then
                                F[i] := (F[i] + F[i - 3]) mod Base;
                        end
                else
                if a[i] = 1 then
                if a[i - 1] in [0..1] then
                        F[i] := (F[i] + F[i - 1]) mod Base;
                end;
        writeln(F[n + 2]);
end.
