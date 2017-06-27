const
        INP = '';
        OUT = '';
        MAXN = trunc(3e4);
        MAXQ = trunc(2e5);
type
        Node = record
                L, R, v, id: Longint;
                end;
var
        n, t: Longint;
        ans: array[1..MAXQ] of Longint;
        BIT: array[1..MAXN] of Longint;
        a: array[1..MAXN + MAXQ] of Node;
procedure enter;
        var
                i: Longint;
        begin
        assign(input, INP);
        reset(input);
        readln(n);
        for i := 1 to n do
                begin
                read(a[i].v);
                a[i].id := i;
                a[i].L := maxlongint;
                end;
        readln(t);
        for i := 1 to t do
                begin
                readln(a[i + n].L, a[i + n].R, a[i + n].v);
                a[i + n].L := a[i + n].L - 1;
                a[i + n].id := i;
                end;
        close(input);
        end;
procedure sort(l, r: longint);
        var
                tmp: Node;
                x, y, i, j, id: longint;
        begin
        i := l;
        j := r;
        id := random(r - l + 1) + l;
        x := a[id].v;
        y := a[id].L;
        repeat
                while (a[i].v > x) or ((a[i].v = x) and (a[i].L < y)) do i := i + 1;
                while (a[j].v < x) or ((a[j].v = x) and (a[j].L > y)) do j := j - 1;
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

function getBIT(x: Longint): Longint;
        var
                res: Longint;
        begin
        res := 0;
        while x > 0 do
                begin
                res := res + BIT[x];
                x := x - x and -x;
                end;
        exit(res);
        end;
procedure updBIT(x: Longint);
        begin
        while x <= n do
                begin
                BIT[x] := BIT[x] + 1;
                x := x + x and -x;
                end;
        end;
procedure process;
        var
                i: Longint;
        begin
        for i := 1 to n + t do
        if a[i].L <> maxlongint then
                ans[a[i].id] := getBIT(a[i].R) - getBIT(a[i].L)
        else
                updBIT(a[i].id);
        end;
procedure prinf;
        var
                i: Longint;
        begin
        for i := 1 to t do
                writeln(ans[i]);
        end;
begin
        randomize;
        enter;
        sort(1, n + t);
        process;
        prinf;
end.