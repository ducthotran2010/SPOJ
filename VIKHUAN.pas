const
        inp = 'VIKHUAN.inp';
        out = 'VIKHUAN.out';
        maxN = 1000;
var
        n, p, m: longint;
        c, v: array[1..maxN] of longint;
        a: array[1..maxN,1..maxN] of longint;
        visited: array[1..maxN] of boolean;
procedure enter;
        var
                i, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        readln(p);
        m := 0;
        while not seekeoln do
                begin
                m := m + 1;
                read(c[m]);
                end;
        for x := 1 to n do
        for y := 1 to n do
                a[x,y] := 0;
        for i := 1 to n - 1 do
                begin
                readln(x, y, a[x,y]);
                a[y,x] := a[x,y];
                end;
        close(input);
        end;
procedure visit(s, val: longint);
        var
                i: longint;
        begin
        visited[s] := true;
        v[s] := val;
        for i := 1 to n do
        if not visited[i] then
        if a[i,s] <> 0 then
                visit(i, val + a[i,s]);
        end;
procedure process;
        var
                i: longint;
        begin
        for i := 1 to m do
                c[i] := v[c[i]];
        end;
procedure sort(l, r: longint);
        var
                i, j, tmp, x: longint;
        begin
        i := l;
        j := r;
        x := c[(l + r) div 2];
        repeat
                while c[i] < x do i := i + 1;
                while c[j] > x do j := j - 1;
                if i <= j then
                        begin
                        tmp := c[i];
                        c[i] := c[j];
                        c[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(c[m shr 1 + 1]);
        close(output);
        end;
begin
        enter;
        visit(p, 0);
        process;
        sort(1, m);
        prinf;
end.