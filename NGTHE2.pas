const
        inp = 'NGTHE2.inp';
        maxN = trunc(1e5);
type
        Node = record
                id, v: longint;
                end;
var
        res: int64;
        i, n, j, idLast: longint;
        a: array[1..maxN] of Node;
        BIT: array[0..maxN] of int64;

function min(a, b: int64): int64; inline;
        begin if a < b then min := a else min := b; end;
function getBIT(u: longint): int64;
        var
                res: int64;
        begin
        res := 0;
        while u > 0 do
                begin
                res := res + BIT[u];
                u := u - u and -u;
                end;
        exit(res);
        end;
procedure update(u: longint);
        begin
        while u <= n do
                begin
                BIT[u] := BIT[u] + 1;
                u := u + u and -u;
                end;
        end;
procedure sort(l, r: longint);
        var
                tmp: Node;
                x, i, j: longint;
        begin
        i := l;
        j := r;
        x := a[(l + r) div 2].v;
        repeat
                while a[i].v < x do i := i + 1;
                while a[j].v > x do j := j - 1;
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

begin
        //assign(input, inp);
        //reset(input);
        readln(n);
        for i := 1 to n do
                begin
                read(a[i].v);
                a[i].id := i;
                end;
        //close(input);
        sort(1, n);
        res := 0;
        j := 1;
        idLast := 1;
        for i := 2 to n do
                begin
                if a[i].v <> a[i - 1].v then
                        begin
                        idLast := i - 1;
                        while j <= idLast do
                                begin
                                update(a[j].id);
                                j := j + 1;
                                end;
                        end;
                res := res + min(idLast, getBIT(n) - getBIT(a[i].id));
                end;
        writeln(res);
end.