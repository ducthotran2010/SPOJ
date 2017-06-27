const
        inp = '';
        out = '';
        maxN = 1000 * 100;
type
        Node = record
                l, v: longint;
                end;
var
        n: longint;
        a: array[1..maxN] of Node;
        Used: array[0..maxN + 1] of boolean;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                begin
                read(a[i].v);
                a[i].l := i;
                end;
        close(input);
        end;
procedure sort(l, r: longint);
        var
                x, y, i, j: longint;
                tmp: Node;
        begin
        i := l;
        j := r;
        x := a[(l+r) shr 1].v;
        y := a[(l+r) shr 1].l;
        repeat
                while (a[i].v < x) or ((a[i].v = x) and (a[i].l < y)) do inc(i);
                while (a[j].v > x) or ((a[j].v = x) and (a[j].l > y)) do dec(j);
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
procedure process;
        var
                i, Count: longint;
        begin
        Count := 0;
        for i := 1 to n do
        if not Used[a[i].l] then
                begin
                Used[a[i].l - 1] := true;
                Used[a[i].l] := true;
                Used[a[i].l + 1] := true;
                Count := Count + 1;
                end;
        writeln(Count);
        end;
begin
        enter;
        sort(1, n);
        process;
end.