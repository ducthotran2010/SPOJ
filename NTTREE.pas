const
        inp = '';
        out = '';
        maxN = 10000;
var
        n: longint;
        res: qword;
        Link, a: array[-maxN..maxN] of longint;
        Last: array[1..maxN] of longint;
        nC, Count, w: array[1..maxN] of qword;
        Visited: array[1..maxN] of boolean;
procedure enter;
        var
                i, x, y, v: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n - 1 do
                begin
                readln(x, y, v);
                x := x + 1;
                y := y + 1;
                a[i] := x;
                Link[i] := Last[x];
                Last[x] := i;
                a[-i] := y;
                Link[-i] := Last[y];
                Last[y] := -i;
                w[i] := v;
                end;
        close(input);
        end;
procedure DFS(s: longint);
        var
                k: longint;
        begin
        nC[s] := 1;
        visited[s] := true;
        k := Last[s];
        while k <> 0 do
                begin
                if not visited[a[-k]] then
                        begin
                        DFS(a[-k]);
                        nC[s] := nC[s] + nC[a[-k]];
                        Count[abs(k)] := nC[a[-k]] * (n - nC[a[-k]]);
                        end;
                k := Link[k];
                end;
        visited[s] := false;
        end;
procedure process;
        var
                i: longint;
        begin
        DFS(1);
        res := 0;
        for i := 1 to n - 1 do
                res := res + Count[i] * w[i];
        writeln(res);
        end;
begin
        enter;
        process;
end.