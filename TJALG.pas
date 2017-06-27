const
        inp = 'TJALG.inp';
        out = '';
        maxn = 10000;
        maxm = 100000;
var
        n, m, res, time, intLimitQ: longint;
        a: array[-maxm..maxm] of longint;
        Last, Numbering, Low, Queue: array[1..maxn] of longint;
        Link: array[1..maxm] of longint;
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
                read(f, x, y);
                a[i] := x;
                a[-i] := y;
                Link[i] := Last[x];
                Last[x] := i;
                end;
        close(f);
        end;
procedure DFS(s: longint);
        var
                k: longint;
        begin
        time := time + 1;
        Numbering[s] := time;
        Low[s] := time;
        intLimitQ := intLimitQ + 1;
        Queue[intLimitQ] := s;
        k := Last[s];
        while k <> 0 do
                begin
                if not Block[a[-k]] then
                if Numbering[a[-k]] = 0 then
                        begin
                        DFS(a[-k]);
                        if Low[s] > Low[a[-k]] then
                                Low[s] := Low[a[-k]];
                        end
                else
                if Low[s] > Numbering[a[-k]] then
                        Low[s] := Numbering[a[-k]];
                k := Link[k];
                end;
        if Low[s] = Numbering[s] then
                begin
                repeat
                        k := Queue[intLimitQ];
                        Block[k] := true;
                        intLimitQ := intLimitQ - 1;
                until s = k;
                res := res + 1;
                end;
        end;
procedure process;
        var
                i: longint;
        begin
        time := 0;
        intLimitQ := 0;
        for i := 1 to n do
        if Numbering[i] = 0 then
                DFS(i);
        writeln(res);
        end;
begin
        input;
        process;
end.
