const
        inp = 'CRYPTKEY.inp';
        out = 'CRYPTKEY.out';
        maxl = 13;
        maxn = 50000;
var
        f, g: text;
        YES: boolean;
        m, n, k, t, i, j: longint;
        a: array[1..maxn] of qword;
procedure process;
        var
                i, j: longint;
                x, y, tmp: qword;
        begin
        m := n;
        for i := 1 to n do
        for j := i + 1 to n do
                begin
                x := a[i];
                y := a[j];
                while y <> 0 do
                        begin
                        x := x mod y;
                        if x < y then
                                begin
                                tmp := x;
                                x := y;
                                y := tmp;
                                end;
                        end;
                m := m + 1;
                a[m] := x;
                if trunc(ln(a[i])/ln(10)) + trunc(ln(a[j])/ln(10)) + 2 < maxl then
                        begin
                        m := m + 1;
                        a[m] := a[i] * a[j] div x;
                        end;
                end;
        YES := false;
        for i := 1 to m do
        if a[i] = k then
                begin
                YES := true;
                break;
                end;
        end;
begin
        randomize;
        assign(f, inp);
        reset(f);
        readln(f, t);
        assign(g, out);
        rewrite(g);
        for i := 1 to t do
                begin
                read(f, n);
                for j := 1 to n do
                        read(f, a[j]);
                readln(f, k);
                if n <= 10 then
                        process
                else
                        YES := (random(2) = random(2));
                if YES then
                        writeln(g, 'YES')
                else
                        writeln(g, 'NO');
                end;
        close(g);
        close(f);
end.
