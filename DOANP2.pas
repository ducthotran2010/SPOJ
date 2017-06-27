const
        INP = 'DOANP2.inp';
        OUT = '';
        MAXN = trunc(1e5);
type
        Node = record
                L, R: Int64;
                end;
var
        res: Int64;
        n, i, e: Longint;
        a: array[0..MAXN] of Node;

function min(a, b: Int64): Int64; inline;
        begin if a < b then min := a else min := b; end;

procedure sort(l, r: longint);
        var
                tmp: Node;
                x, y, i, j, id: longint;
        begin
        i := l;
        j := r;
        id := random(r - l + 1) + l;
        x := a[id].R;
        y := a[id].L;
        repeat
                while (a[i].R < x) or ((a[i].R = x) and (a[i].L < y)) do i := i + 1;
                while (a[j].R > x) or ((a[j].R = x) and (a[j].L > y)) do j := j - 1;
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
procedure process(n: Longint);
        var
                i, j: Longint;
        begin
        a[0].R := -maxlongint;
        j := 1;
        for i := 2 to n do
        if a[i].L < a[j].R then
                begin
                if (a[j].L <= a[i].L) and (a[i].L < a[j].R) then
                        a[j].R := a[i].R
                else
                        begin
                        a[j].L := a[i].L;
                        if a[j].L < a[j - 1].R then
                                begin
                                if a[j].L < a[j - 1].L then
                                        a[j - 1].L := a[j].L;
                                a[j].L := min(a[j].R, a[j - 1].R);
                                end;
                        end;
                if a[j].R < a[i].R then
                        a[j].R := a[i].R;
                end
        else
                begin
                j := j + 1;
                a[j] := a[i];
                end;
        e := j;
        end;
begin
        randomize;
        assign(input, INP);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(a[i].L, a[i].R);
        close(input);
        sort(1, n);
        process(n);
        process(e);
        res := 0;
        for i := 1 to e do
                res := res + a[i].R - a[i].L;
        writeln(res);
end.