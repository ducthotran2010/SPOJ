const
        inp = 'VDLC.inp';
        out = 'VDLC.out';
        maxN = 150;
        maxV = 20 * 1000;
        Lx: array[1..2] of longint = (0, 1);
        Ly: array[1..2] of longint = (1, 0);
var
        m, n, S, F, res, intMax: longint;
        a: array[0..maxN + 1,0..maxN + 1] of longint;
        b, Link: array[-maxN * maxN * 2..maxN * maxN * 2] of longint;
        Q, Step: array[1..maxN * maxN * 2] of longint;
        LastS: array[1..maxV] of longint;
        Visited: array[1..maxV] of boolean;
procedure enter;
        var
                i, j, x1, x2, y1, y2: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        intMax := 1;
        for i := 1 to n do
        for j := 1 to n do
                begin
                read(a[i,j]);
                if intMax > a[i,j] then
                        intMax := a[i,j];
                end;
        readln(x1, y1, x2, y2);
        S := a[x1,y1];
        F := a[x2,y2];
        close(input);
        end;
procedure process;
        var
                i, j, k: longint;
        begin
        for i := 0 to n + 1 do
                begin
                a[i,0] := -1;
                a[0,i] := -1;
                a[i,n + 1] := -1;
                a[n + 1,i] := -1;
                end;
        m := 0;
        for i := 1 to n do
        for j := 1 to n do
        for k := 1 to 2 do
        if a[i + Lx[k],j + Ly[k]] <> - 1 then
                begin
                inc(m);
                b[m] := a[i,j];
                Link[m] := LastS[a[i,j]];
                LastS[a[i,j]] := m;
                b[-m] := a[i + Lx[k],j + Ly[k]];
                Link[-m] := LastS[a[i + Lx[k],j + Ly[k]]];
                LastS[a[i + Lx[k],j + Ly[k]]] := -m;
                end;
        end;
function BFS: longint;
        var
                u, k, First, Last: longint;
        begin
        First := 0;
        Last := 1;
        Q[1] := S;
        if S = F then
                exit(1);
        Step[1] := 1;
        visited[S] := true;
        while First < Last do
                begin
                inc(First);
                u := Q[First];
                k := LastS[u];
                while k <> 0 do
                        begin
                        if not visited[b[-k]] then
                                begin
                                inc(Last);
                                Q[Last] := b[-k];
                                Step[Last] := Step[First] + 1;
                                if Q[Last] = F then
                                        exit(Step[Last]);
                                visited[b[-k]] := true;
                                end;
                        k := Link[k];
                        end;
                end;
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        process;
        res := BFS;
        prinf;
end.
