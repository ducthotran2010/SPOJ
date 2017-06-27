const
        inp = 'PIRATES.inp';
        out = 'PIRATES.out';
        maxN = 500;
        Xi = 1;
        Start = 2;
        Finish = 3;
        Non = 4;
        Lx: array[1..4] of longint = (1, -1, 0, 0);
        Ly: array[1..4] of longint = (0, 0, 1, -1);
type
        Node = record
                x, y: longint;
                end;
var
        S, F: Node;
        n, m, maxV, res: longint;
        a, typ: array[1..maxN,1..maxN] of longint;
        visited: array[1..maxN, 1..maxN] of boolean;
        Q: array[1..maxN * maxN] of Node;
        Step: array[1..maxN * maxN] of longint;
procedure enter;
        var
                c: char;
                i, j: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to n do
                begin
                for j := 1 to m do
                        begin
                        read(c);
                        if c = 'X' then
                                typ[i,j] := Xi
                        else
                        if c = '.' then
                                typ[i,j] := Non
                        else
                        if c = 'F' then
                                begin
                                typ[i,j] := Finish;
                                F.x := i;
                                F.y := j;
                                end
                        else
                                begin
                                typ[i,j] := Start;
                                S.x := i;
                                S.y := j;
                                end;
                        end;
                readln;
                end;
        close(input);
        end;
procedure init;
        var
                x: Node;
                i, j, First, Last: longint;
        begin
        First := 0;
        Last := 0;
        fillchar(visited, sizeof(visited), false);
        for i := 1 to n do
        for j := 1 to m do
        if typ[i,j] = Xi then
                begin
                inc(Last);
                Q[Last].x := i;
                Q[Last].y := j;
                a[i,j] := 0;
                visited[i,j] := true;
                end;
        while First < Last do
                begin
                inc(First);
                x := Q[First];
                if a[x.x,x.y] > maxV then
                        maxV := a[x.x,x.y];
                for i := 1 to 4 do
                if (x.x + Lx[i] > 0) and (x.x + Lx[i] <= n) then
                if (x.y + Ly[i] > 0) and (x.y + Ly[i] <= m) then
                if not visited[x.x + Lx[i],x.y + Ly[i]] then
                        begin
                        inc(Last);
                        Q[Last].x := x.x + Lx[i];
                        Q[Last].y := x.y + Ly[i];
                        a[Q[Last].x,Q[Last].y] := a[x.x,x.y] + 1;
                        visited[Q[Last].x,Q[Last].y] := true;
                        end;
                end;
        end;
function FindPath(midV: longint): boolean;
        var
                x: Node;
                i, First, Last: longint;
        begin
        fillchar(visited, sizeof(visited), false);
        First := 0;
        Last := 1;
        Q[1].x := S.x;
        Q[1].y := S.y;
        if a[S.x,S.y] >= midV then
        while First < Last do
                begin
                inc(First);
                x := Q[First];
                for i := 1 to 4 do
                if (x.x + Lx[i] > 0) and (x.x + Lx[i] <= n) then
                if (x.y + Ly[i] > 0) and (x.y + Ly[i] <= m) then
                if not visited[x.x + Lx[i],x.y + Ly[i]] then
                if a[x.x + Lx[i],x.y + Ly[i]] >= midV then
                        begin
                        inc(Last);
                        Q[Last].x := x.x + Lx[i];
                        Q[Last].y := x.y + Ly[i];
                        visited[Q[Last].x,Q[Last].y] := true;
                        if Typ[Q[Last].x,Q[Last].y] = Finish then
                                exit(true);
                        end;
                end;
        exit(false);
        end;
procedure process;
        var
                L, R, m: longint;
        begin
        L := 0;
        R := maxV;
        res := 0;
        repeat
                m := (L + R) shr 1;
                if FindPath(m) then
                        begin
                        res := m;
                        l := m + 1;
                        end
                else
                        r := m - 1;
        until L > R;
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
        init;
        process;
        prinf;
end.
