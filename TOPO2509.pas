const
        inp = '';
        out = '';
        maxN = 100;
var
        n, m, intSN: longint;
        a: array[1..maxN,1..maxN] of boolean;
        d: array[1..maxN] of longint;
        visited: array[1..maxN] of boolean;
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
procedure visit(s: longint);
        var
                i: longint;
        begin
        visited[s] := true;
        for i := 1 to n do
        if a[s,i] then
        if not visited[i] then
                visit(i);
        d[s] := intSN;
        intSN := intSN - 1;
        end;
procedure process;
        var
                i: longint;
        begin
        intSN := n;
        for i := 1 to n do
        if not visited[i] then
                visit(i);
        for i := 1 to n do
                writeln(d[i]);
        end;
begin
        enter;
        process;
end.