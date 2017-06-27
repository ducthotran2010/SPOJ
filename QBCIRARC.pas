const
        inp = '';
        out = '';
        maxN = 1000;
        maxM = 2000 * 10;
var
        ExistC: boolean;
        NumCycle, Limit, res, n, m: longint;
        a: array[-maxM..maxM] of longint;
        Match, Last, Stack: array[1..maxN] of longint;
        Link, Count: array[1..maxM] of longint;
        Visited, InCycle: array[1..maxN] of boolean;
        SC: array[0..maxN] of longint;
        Block: array[1..maxM] of boolean;
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
                a[i] := x;
                a[-i] := y;
                Link[i] := Last[x];
                Last[x] := i;
                end;
        close(input);
        end;
procedure visit(s: longint);
        var
                k, i: longint;
        begin
        if SC[0] <> 0 then
                exit;
        visited[s] := true;
        InCycle[s] := true;
        k := Last[s];
        while k <> 0 do
                begin
                if not visited[a[-k]] then
                        begin
                        Limit := Limit + 1;
                        Stack[Limit] := k;
                        visit(a[-k]);
                        Limit := Limit - 1;
                        end
                else
                if InCycle[a[-k]] then
                        begin
                        Limit := Limit + 1;
                        Stack[Limit] := k;
                        i := Limit;
                        SC[0] := 0;
                        while a[Stack[i]] <> a[-k] do
                                begin
                                inc(SC[0]);
                                SC[SC[0]] := Stack[i];
                                i := i - 1;
                                end;
                        inc(SC[0]);
                        SC[SC[0]] := Stack[i];
                        Limit := Limit - 1;
                        end;
                k := Link[k];
                end;
        InCycle[s] := false;
        end;
procedure DFS(s: longint);
        var
                k: longint;
        begin
        if ExistC then
                exit;
        Visited[s] := true;
        InCycle[s] := true;
        k := Last[s];
        while k <> 0 do
                begin
                if not Block[k] then
                        begin
                        if not Visited[a[-k]] then
                                DFS(a[-k])
                        else
                        if InCycle[a[-k]] then
                                begin
                                ExistC := true;
                                exit;
                                end;
                        end;
                k := Link[k];
                end;
        InCycle[s] := false;
        end;
procedure process;
        var
                i, j: longint;
        begin
        //Find min-Cycle
        SC[0] := 0;
        for i := 1 to n do
        if not visited[i] then
                visit(i);
        //Check
        res := 0;
        for i := SC[0] downto 1 do
                begin
                Block[SC[i]] := true;
                ExistC := False;
                fillchar(visited, sizeof(visited), false);
                for j := 1 to n do
                if not visited[j] then
                        DFS(j);
                if not ExistC then
                        begin
                        res := res + 1;
                        Match[a[SC[i]]] := a[-SC[i]];
                        end;
                Block[SC[i]] := false;
                end;

        end;
procedure prinf;
        var
                i: longint;
        begin
        if res = 0 then
                writeln(-1)
        else
                begin
                writeln(res);
                for i := 1 to n do
                if Match[i] <> 0 then
                        writeln(i, ' ', Match[i]);
                end;
        end;

begin
        enter;
        process;
        prinf;
end.
