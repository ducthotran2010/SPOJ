const
        inp = 'XLC1.inp';
        out = 'XLC1.out';
        maxN = 1000;
var
        n, intC: longint;
        a: array[1..maxN,1..maxN] of boolean;
        visited: array[1..maxN] of boolean;
        v: array[1..maxN] of longint;
procedure enter;
        var
                x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        while not eof do
                begin
                read(x);
                while not eoln do
                        begin
                        read(y);
                        a[x,y] := true;
                        end;
                readln;
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
        v[intC] := s;
        intC := intC - 1;
        end;
procedure process;
        var
                i: longint;
        begin
        intC := n;
        fillchar(visited, sizeof(visited), false);
        for i := 1 to n do
        if not visited[i] then
                visit(i);
        end;
procedure prinf;
        var
                i: longint;
        begin
        assign(output, out);
        rewrite(output);
        for i := 1 to n do
                write(v[i], ' ');
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.