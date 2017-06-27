const
        inp = 'FAIRPLAY.inp';
        out = 'FAIRPLAY.out';
        maxn = 100000;
type
        SValue = record
                l, v: longint;
                end;
var
        n, res: longint;
        a: array[1..maxN * 2] of Svalue;
        Q: array[1..maxN * 2 + 1] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        res := n;
        for i := 1 to n do
                begin
                read(f, a[i].v);
                a[i].l := 1;
                end;
        for i := 1 to n do
                begin
                read(f, a[i + n].v);
                a[i + n].l := 2;
                end;
        close(f);
        end;
procedure sort(l, r: longint);
        var
                tmp: SValue;
                c, x, y, i, j: longint;
        begin
        i := l;
        j := r;
        c := random(r - l + 1) + l;
        x := a[c].v;
        y := a[c].l;
        repeat
                while (a[i].v > x) or ((a[i].v = x) and (a[i].l > y)) do inc(i);
                while (a[j].v < x) or ((a[j].v = x) and (a[j].l < y)) do dec(j);
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
                First, Last, i: longint;
        begin
        Last := 0;
        First := 1;
        for i := 1 to n do
                begin
                if a[i].l = 2 then
                        begin
                        Last := Last + 1;
                        Q[Last] := a[i].v;
                        continue;
                        end;
                if (First > Last) or (Q[First] <= a[i].v) then
                        res := res - 1;
                if  First <= Last then
                        First := First + 1;
                end;
        end;
procedure prinf;
        var
                f: text;
                i: longint;
        begin
        assign(f, out);
        rewrite(f);
        writeln(f, res);
        close(f);
        end;
begin
        randomize;
        input;
        n := 2 * n;
        sort(1, n);
        process;
        prinf;
end.
