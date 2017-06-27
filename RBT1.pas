const
        inp = 'RBT1.inp';
        out = 'RBT1.out';
        maxM = 100;
        maxN = 100 * 1000;
type
        Node = record
                l: longint;
                v: extended;
                end;
var
        n: longint;
        a: array[1..maxN] of Node;
procedure enter;
        var
                input: text;
                i, j, t: longint;
                x, y: array[0..maxM + 1] of longint;
        begin
        assign(input, inp);
        reset(input);
        readln(input, t);
        for i := 1 to t do
                begin
                read(input, n);
                for j := 1 to n do
                        read(input, x[j], y[j]);
                a[i].v := 0;
                x[0] := x[n];
                y[0] := y[n];
                x[n + 1] := x[1];
                y[n + 1] := y[1];
                for j := 1 to n do
                        a[i].v := a[i].v + (x[j - 1] - x[j + 1]) * y[j];
                a[i].v := abs(a[i].v) / 2;
                a[i].l := i;
                end;
        n := t;
        close(input);
        end;
procedure sort(l, r: longint);
        var
                i, j: longint;
                x: extended;
                tmp: Node;
        begin
        i := l;
        j := r;
        x := a[random(r - l + 1) + l].v;
        repeat
                while a[i].v < x do inc(i);
                while a[j].v > x do dec(j);
                if i <= j then
                        begin
                        tmp := a[i];
                        a[i] := a[j];
                        a[j] := tmp;
                        inc(i);
                        dec(j);
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;
procedure prinf;
        var
                i: longint;
        begin
        assign(output, out);
        rewrite(output);
        for i := n downto 1 do
                write(a[i].l, #32);
        close(output);
        end;
begin
        randomize;
        enter;
        sort(1, n);
        prinf;
end.
