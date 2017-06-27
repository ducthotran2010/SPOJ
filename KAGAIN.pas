const
        inp = 'KAGAIN.inp';
        out = 'KAGAIN.out';
        maxN = 30 * 1000;
var
        t, n, i, j, res, L, R: longint;
        a: array[0..maxN + 1] of longint;
        pre, nex: array[0..maxN + 1] of longint;
procedure buildPre;
        var
                Limit, i: longint;
                Q: array[0..maxN] of longint;
        begin
        a[0] := 0;
        Q[0] := 0;
        Limit := 0;
        for i := 1 to n do
        if a[i] > a[i - 1] then
                begin
                pre[i] := i;
                Limit := Limit + 1;
                Q[Limit] := i;
                end
        else
                begin
                while a[Q[Limit]] >= a[i] do
                        Limit := Limit - 1;
                Limit := Limit + 1;
                pre[i] := pre[Q[Limit]];
                Q[Limit] := i;
                end;
        end;
procedure buildNex;
        var
                Limit, i: longint;
                Q: array[0..maxN] of longint;
        begin
        a[n + 1] := 0;
        Q[0] := 0;
        Limit := 0;
        for i := n downto 1 do
        if a[i] > a[i + 1] then
                begin
                nex[i] := i;
                Limit := Limit + 1;
                Q[Limit] := i;
                end
        else
                begin
                while a[Q[Limit]] >= a[i] do
                        Limit := Limit - 1;
                Limit := Limit + 1;
                nex[i] := nex[Q[Limit]];
                Q[Limit] := i;
                end;
        end;
begin
        assign(input, inp);
        reset(input);
        readln(t);
        for j := 1 to t do
                begin
                readln(n);
                for i := 1 to n do
                        read(a[i]);
                buildPre;
                buildNex;
                res := 0;
                L := 0;
                R := 0;
                for i := 1 to n do
                if (nex[i] - pre[i] + 1) * a[i] > res then
                        begin
                        res := (nex[i] - pre[i] + 1) * a[i];
                        L := pre[i];
                        R := nex[i];
                        end;
                writeln(res, #32, L, #32, R);
                end;
        close(input);
end.

