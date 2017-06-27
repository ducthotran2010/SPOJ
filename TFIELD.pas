const
        inp = 'TFIELD.INP';
        out = 'TFIELD.OUT';
        maxn = 1000;
type
        arrSpecV = record
                c: longint;
                s: real;
                end;
var
        res: real;
        m, k: longint;
        a: array[0..maxn] of arrSpecV;
        x, y: array[0..maxn + 1] of longint;
        kind: array[1..maxn] of real;
procedure input;
        var
                f: text;
                i, n, j: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, m, k);
        for i := 1 to m do
                begin
                read(f, n, a[i].c);
                for j := 1 to n do
                        read(f, x[j], y[j]);
                x[n + 1] := x[1];
                y[n + 1] := y[1];
                x[0] := x[n];
                y[0] := y[n];
                a[i].s := 0;
                for j := 1 to n do
                        a[i].s := a[i].s + (x[j + 1] - x[j - 1]) * y[j];
                a[i].s := -a[i].s/2;
                end;
        close(f);
        end;
procedure sort(l, r: longint);
        var
                i, j: longint;
                x: real;
                tmp: arrSpecV;
        begin
        i := l;
        j := r;
        x := a[(l + r) div 2].s;
        repeat
                while a[i].s < x do i := i + 1;
                while a[j].s > x do j := j - 1;
                if i <= j then
                        begin
                        tmp := a[i];
                        a[i] := a[j];
                        a[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;
procedure process;
        var
                i, j: longint;
        begin
        a[0].s := 0;
        for i := m downto 1 do
                kind[a[i].c] := kind[a[i].c] + a[i].s - a[i - 1].s;
        j := 1;
        for i := 1 to maxn do
        if kind[i] > kind[j] then
                j := i;
        res := kind[j];
        for i := m downto 1 do
        if a[i].c<> j then
        if k <> 0 then
                begin
                res := res + a[i].s - a[i - 1].s;
                k := k - 1;
                end;
        end;
procedure prinf;
        var
                f: text;
        begin
        assign(f, out);
        rewrite(f);
        writeln(f, res:0:1);
        close(f);
        end;
begin
        input;
        sort(1, m);
        process;
        prinf;
end.
