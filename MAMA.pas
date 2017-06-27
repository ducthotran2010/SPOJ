const
        inp = 'MAMA.inp';
        maxN = trunc(1e5);
        Base = trunc(1e9);
type
        Node = record
                v, id: int64;
                end;
        Indexed = record
                v, c: int64;
                end;
var
        res: int64;
        x: Indexed;
        i, n: longint;
        a: array[1..maxN] of Node;
        BIT: array[1..maxN] of Indexed;
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
function getBIT(x: longint): Indexed;
        var
                res: Indexed;
        begin
        res.c := 0;
        res.v := 0;
        while x > 0 do
                begin
                res.c := res.c + BIT[x].c;
                res.v := res.v + BIT[x].v;
                x := x - x and -x;
                end;
        exit(res);
        end;
procedure update(x, y: longint);
        begin
        while x <= n do
                begin
                BIT[x].c := BIT[x].c + 1;
                BIT[x].v := BIT[x].v + y;
                x := x + x and -x;
                end;
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
        for i := n downto 1 do
                begin
                x := getBIT(a[i].id);
                res := (res + x.v - a[i].v * x.c) mod Base;
                update(a[i].id, a[i].v);
                end;
        writeln(res);
end.