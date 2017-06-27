const
        INP = '';
        OUT = '';
        MAXN = trunc(1e5);
        MAXM = 2 * MAXN;
var
        res, m, n, n3, t, intTPLT, intCount, Count: Int64;
        Block: array[-MAXM..MAXM] of Boolean;
        a, Link: array[-MAXM..MAXM] of Int64;
        nD, Last, Num, Low: array[1..MAXN] of Int64;
procedure enter;
        var
                i, x, y: Longint;
        begin
        assign(input, INP);
        reset(input);
        readln(n, m);
        for i := 1 to m do
                begin
                readln(x, y);
                a[i] := x;
                Link[i] := Last[x];
                Last[x] := i;
                a[-i] := y;
                Link[-i] := Last[y];
                Last[y] := -i;
                end;
        close(input);
        end;
procedure visit(s: Longint);
        var
                k: Longint;
        begin
        n3 := n3 + 1;
        k := Last[s];
        nD[s] := 1;
        t := t + 1;
        Num[s] := t;
        Low[s] := n + 1;
        while k <> 0 do
                begin
                if not Block[k] then
                        begin
                        Block[-k] := true;
                        if Num[a[-k]] = 0 then
                                begin
                                visit(a[-k]);
                                nD[s] := nD[a[-k]] + nD[s];
                                if Num[s] < Low[a[-k]] then
                                        begin
                                        intCount := intCount + 1;
                                        Count := Count + nD[a[-k]] * (n - nD[a[-k]]) - 1;
                                        end;
                                if Low[a[-k]] < Low[s] then
                                        Low[s] := Low[a[-k]];
                                end
                        else
                        if Num[a[-k]] < Low[s] then
                                Low[s] := Num[a[-k]];
                        end;
                k := Link[k];
                end;
        end;
procedure process;
        var
                i: Longint;
        begin
        t := 0;
        Count := 0;
        intTPLT := 0;
        intCount := 0;
        for i := 1 to n do
        if Num[i] = 0 then
                begin
                n3 := 0;
                visit(i);
                intTPLT := intTPLT + 1;
                end;
        if intTPLT > 2 then
                begin
                res := 0;
                exit;
                end;
        if intTPLT = 2 then
                res := n3 * (n - n3) * (m - intCount)
        else
                res := (m - intCount) * (n * (n - 1) div 2 - m) + Count;
        end;
begin
        enter;
        process;
        writeln(res);
end.

