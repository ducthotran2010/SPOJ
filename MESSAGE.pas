const
        inp = '';
        out = '';
        maxN = 800;
var
        n, m, res, time, newSCC, numSCC, LimitQ: longint;
        a, b: array[1..maxN,1..maxN] of boolean;
        Q, num, low, SCC: array[1..maxN] of longint;
procedure enter;
        var
                i, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to m do
                begin
                readln(x, y);
                a[x,y] := true;
                end;
        close(input);
        end;
procedure DFST(s: longint);
        var
                i: longint;
        begin
        time := time + 1;
        LimitQ := LimitQ + 1;
        num[s] := time;
        low[s] := time;
        Q[LimitQ] := s;
        for i := 1 to n do
        if a[s,i] then
                begin
                if SCC[i] = 0 then
                if num[i] = 0 then
                        begin
                        DFST(i);
                        if low[i] < low[s] then
                                low[s] := low[i];
                        end
                else
                if num[i] < low[s] then
                        low[s] := num[i];
                end;
        if num[s] = low[s] then
                begin
                numSCC := numSCC + 1;
                repeat
                        i := Q[LimitQ];
                        SCC[i] := numSCC;
                        LimitQ := LimitQ - 1;
                until i = s;
                end;
        end;
procedure Tarjan;
        var
                i: longint;
        begin
        time := 0;
        numSCC := 0;
        LimitQ := 0;
        fillchar(num, sizeof(num), 0);
        fillchar(low, sizeof(low), 0);
        fillchar(SCC, sizeof(SCC), 0);
        for i := 1 to n do
        if num[i] = 0 then
                DFST(i);
        end;
procedure init;
        var
                i, j: longint;
        begin
        for i := 1 to n do
        for j := 1 to n do
        if a[i,j] then
        if SCC[i] <> SCC[j] then
                b[SCC[i],SCC[j]] := true;
        end;
procedure process;
        var
                i, j: longint;
        begin
        res := 0;
        fillchar(num, sizeof(num), 0);
        for i := 1 to numSCC do
        for j := 1 to numSCC do
        if b[j,i] then
                num[i] := num[i] + 1;
        for i := 1 to numSCC do
        if num[i] = 0 then
                res := res + 1;
        writeln(res);
        end;
begin
        enter;
        Tarjan;
        init;
        process;
end.