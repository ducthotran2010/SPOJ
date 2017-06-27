const
        inp = 'MESSAGE.inp';
        out = '';
        maxn = 1000 * 10;
        maxm = 1000 * 100;
var
        n, m, res, time, LimitQ: longint;
        link, a: array[-maxm..maxm] of longint;
        Q, last, num, low: array[1..maxn] of longint;
        Block: array[1..maxn] of boolean;
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
                link[i] := last[x];
                last[x] := i;
                a[-i] := y;
                end;
        close(f);
        end;
procedure visit(s: longint);
        var
                k: longint;
        begin
        Time := Time + 1;
        Num[s] := Time;
        Low[s] := Time;
        LimitQ := LimitQ + 1;
        Q[LimitQ] := s;
        k := last[s];
        while k <> 0 do
                begin
                if not Block[a[-k]] then
                if Num[a[-k]] = 0 then
                        begin
                        visit(a[-k]);
                        if Low[a[-k]] < Low[s] then
                                Low[s] := Low[a[-k]];
                        end
                else
                if Low[s] > Num[a[-k]] then
                        Low[s] := Num[a[-k]];
                k := Link[k];
                end;
        if Num[s] = Low[s] then
                begin
                repeat
                        k := Q[LimitQ];
                        write(k, ' ');
                        Block[k] := true;
                        LimitQ := LimitQ - 1;
                until s = k;
                writeln;
                res := res + 1;
                end;
        end;
procedure process;
        var
                i: longint;
        begin
        LimitQ := 0;
        res := 0;
        Time := 0;
        for i := 1 to n do
        if Num[i] = 0 then
                visit(i);
        writeln(res);
        end;
begin
        input;
        process;
end.
