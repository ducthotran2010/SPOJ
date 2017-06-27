const
        inp = '';
        out = '';
        maxn = 100;
var
        n, m, res, intTime, intNum: longint;
        a: array[1..maxn,1..maxn] of boolean;
        d, arrTimeAccess, Low: array[1..maxn] of longint;
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
                a[x,y] := true;
                a[y,x] := true;
                end;
        close(f);
        end;
procedure dfs(s: longint);
        var
                i: longint;
        begin
        d[s] := 1;
        for i := 1 to n do
        if a[i,s] then
        if d[i] = 0 then
                begin
                dfs(i);
                d[s] := d[s] + d[i];
                end;
        end;
procedure visit(s: longint);
        var
                i: longint;
        begin
        intTime := intTime + 1;
        arrTimeAccess[s] := intTime;
        Low[s] := n + 1;
        for i := 1 to n do
        if a[s,i] then
                begin
                a[i,s] := false;
                if arrTimeAccess[i] = 0 then
                        begin
                        visit(i);
                        if Low[i] > arrTimeAccess[s] then
                                res := res + d[i] * (n - d[i]);
                        if Low[i] < Low[s] then
                                Low[s] := Low[i];
                        end
                else
                if Low[s] > arrTimeAccess[i] then
                        Low[s] := arrTimeAccess[i];
                end;
        end;
procedure process;
        var
                i: longint;
        begin
        dfs(1);
        res := 0;
        intTime := 0;
        for i := 1 to n do
        if arrTimeAccess[i] = 0 then
                visit(i);
        writeln(res);
        end;
begin
        input;
        process;
end.