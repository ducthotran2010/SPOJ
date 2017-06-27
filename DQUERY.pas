const
        INP = '';
        OUT = '';
        MAXN = trunc(3e4);
        MAXQ = trunc(2e5);
        MAXV = trunc(1e6);
type
        Node = record
                id, v, typ: Longint;
                end;
var
        n, t: Longint;
        Q: array[1..MAXV] of Longint;
        BIT: array[1..MAXN] of Longint;
        ans: array[1..MAXQ] of array of Longint;
        a: array[1..MAXN + MAXQ + MAXQ] of Node;
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
                a[i].typ := -1;
                end;
        readln(t);
        for i := 1 to t do
                begin
                readln(a[i + n].id, a[i + t + n].id);
                a[i + n].v := a[i + n].id;
                a[i + t + n].v := a[i + n].id;
                a[i + n].id := a[i + n].id - 1;
                a[i + n].typ := i;
                a[i + t + n].typ := i;
                end;
        close(input);
        end;
procedure init;
        var
                i, tmp: Longint;
        begin
        Q[a[1].v] := 1;
        a[1].v := 0;
        for i := 2 to n do
                begin
                tmp := a[i].v;
                a[i].v := Q[tmp];
                Q[tmp] := i;
                end;
        end;
procedure sort(l, r: longint);
        var
                tmp: Node;
                x, y, i, j, id: longint;
        begin
        i := l;
        j := r;
        id := random(r - l + 1) + l;
        x := a[id].id;
        y := a[id].typ;
        repeat
                while (a[i].id < x) or ((a[i].id = x) and (a[i].typ < y)) do i := i + 1;
                while (a[j].id > x) or ((a[j].id = x) and (a[j].typ > y)) do j := j - 1;
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

procedure updBIT(x: Longint);
        begin
        while x <= n do
                begin
                BIT[x] := BIT[x] + 1;
                x := x + x and -x;
                end;
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
procedure process;
        var
                i: Longint;
        begin
        for i := 1 to n + t + t do
        if a[i].typ = -1 then
                updBIT(a[i].v + 1)
        else
                begin
                setlength(ans[a[i].typ], length(ans[a[i].typ]) + 1);
                ans[a[i].typ][high(ans[a[i].typ])] := getBIT(a[i].v);
                end;
        end;
procedure prinf;
        var
                i: Longint;
        begin
        for i := 1 to t do
                writeln(ans[i][high(ans[i])] - ans[i][low(ans[i])]);
        end;
begin
        randomize;
        enter;
        init;
        sort(1, n + t + t);
        process;
        prinf;
end.
