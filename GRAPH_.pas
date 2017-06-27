const
        inp = '';
        out = '';
        maxn = 10000;
        maxm = 50000;
var
        n, m, res1, res2, intTime: longint;
        low, last, nC, arrAT: array[1..maxn] of longint;
        a, link: array[-maxm..maxm] of longint;
        block: array[-maxm..maxm] of boolean;
        mark: array[1..maxn] of boolean;
procedure input;
        var
                f: text;
                i, x, y: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m);
        for i := 1 to m do
                begin
                readln(f, x, y);
                a[i] := x;
                Link[i] := Last[x];
                Last[x] := i;
                a[-i] := y;
                Link[-i] := Last[y];
                Last[y] := -i;
                end;
        close(f);
        end;
procedure Visit(s: longint);
        var
                k: longint;
        begin
        nC[s] := 0;
        intTime := intTime + 1;
        arrAT[s] := intTime;
        Low[s] := n + 1;
        k := last[s];
        while k <> 0 do
                begin
                if not block[k] then
                        begin
                        block[-k] := true;
                        nC[s] := nC[s] + 1;
                        if arrAT[a[-k]] = 0 then
                                begin
                                Visit(a[-k]);
                                if Low[a[-k]] >= arrAT[s] then
                                if not mark[s] then
                                        begin
                                        mark[s] := true;
                                        res1 := res1 + 1;
                                        end;
                                if Low[a[-k]] > arrAT[s] then
                                        res2 := res2 + 1;
                                if Low[a[-k]] < Low[s] then
                                        Low[s] := Low[a[-k]];
                                end
                        else
                        if arrAT[a[-k]] < Low[s] then
                                Low[s] := arrAT[a[-k]];
                        end;
                k := Link[k];
                end;
        end;
procedure process;
        var
                i: longint;
        begin
        res1 := 0;
        res2 := 0;
        intTime := 0;
        for i := 1 to n do
        if arrAT[i] = 0 then
                begin
                Visit(i);
                if nC[i] < 2 then
                if mark[i] then
                        begin
                        mark[i] := false;
                        res1 := res1 - 1;
                        end;
                end;
        writeln(res1, ' ', res2);
        end;
begin
        input;
        process;
end.