const
        inp = 'CAUKHOP.inp';
        out = '';
        maxn = 10000;
        maxm = 100000;
var
        Time, res1, res2, m, n: longint;
        a, link: array[-maxm..maxm] of longint;
        block: array[-maxm..maxm] of boolean;
        mark: array[1..maxn] of boolean;
        last, nC, num, low: array[1..maxn] of longint;
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
                read(f, x, y);
                a[i] := x;
                link[i] := last[x];
                last[x] := i;
                a[-i] := y;
                link[-i] := last[y];
                last[y] := -i;
                end;
        close(f);
        end;
procedure visit(s: longint);
        var
                k: longint;
        begin
        Time := Time + 1;
        Num[s] := Time;
        Low[s] := n + 1;
        nC[s] := 0;
        k := last[s];
        while k <> 0 do
                begin
                if not block[k] then
                        begin
                        block[-k] := true;
                        nC[s] := nC[s] + 1;
                        if Num[a[-k]] = 0 then
                                begin
                                visit(a[-k]);
                                if Low[a[-k]] > Num[s] then
                                        res2 := res2 + 1;
                                if Low[a[-k]] >= Num[s] then
                                if not Mark[s] then
                                        begin
                                        Mark[s] := true;
                                        res1 := res1 + 1;
                                        end;
                                if Low[a[-k]] < Low[s] then
                                        Low[s] := Low[a[-k]];
                                end
                        else
                        if Num[a[-k]] < Low[s] then
                                Low[s] := Num[a[-k]];
                        end;
                k := link[k];
                end;
        end;
procedure process;
        var
                i: longint;
        begin
        Time := 0;
        for i := 1 to n do
        if Num[i] = 0 then
                begin
                visit(i);
                if mark[i] then
                if nC[i] < 2 then
                        begin
                        mark[i] := false;
                        res1 := res1 - 1;
                        end;
                end;
        writeln('Khop  Cau');
        writeln(res1:4, res2:5);
        end;
begin
        input;
        process;
end.