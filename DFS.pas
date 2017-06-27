const
        inp = 'DOTHI.inp';
        out = 'DOTHI.out';
        maxn = 1000;
var
        f: text;
        had: boolean;
        n, m, s, t, LimitT: longint;
        a: array[1..maxn,1..maxn] of boolean;
        Trace: array[1..maxn] of longint;
        visited: array[1..maxn] of boolean;
procedure input;
        var
                f: text;
                i, x, y: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m, s, t);
        for i := 1 to m do
                begin
                read(f, x, y);
                a[x,y] := true;
                a[y,x] := true;
                end;
        close(f);
        end;
procedure DFS(s: longint);
        var
                i: longint;
        begin
        visited[s] := true;
        LimitT := LimitT + 1;
        Trace[LimitT] := s;
        if s = t then
                begin
                for i := 1 to LimitT do
                        write(f, Trace[i], ' ');
                writeln(f);
                had := true;
                end;
        for i := 1 to n do
        if not visited[i] then
        if a[i,s] then
                DFS(i);
        LimitT := LimitT - 1;
        visited[s] := false;
        end;
begin
        input;
        LimitT := 0;
        had := false;
        assign(f, out);
        rewrite(f);
        DFS(s);
        if not had then
                writeln(f, -1);
        close(f);
end.