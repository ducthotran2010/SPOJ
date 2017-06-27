const
        inp = '';
        maxn = 10000;
        maxv = 30000;
        OpenH = 1;
        CloseH = -1;
type
        arr = record
                x, y1, y2, typ: longint;
                end;
var
        n, res, Lx, Rx, intTyp: longint;
        a: array[1..maxn * 2] of arr;
        ITc, ITp: array[1..maxv * 8] of longint;
procedure input;
        var
                f: text;
                i, x1, x2, y1, y2: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
                begin
                readln(f, x1, y1, x2, y2);
                a[i].x := x1;
                a[i].y1 := y1;
                a[i].y2 := y2;
                a[i].typ := OpenH;
                a[i + n].x := x2;
                a[i + n].y1 := y1;
                a[i + n].y2 := y2;
                a[i + n].typ := CloseH;
                end;
        close(f);
        end;
procedure sort(l, r: longint);
        var
                i, j, x: longint;
                tmp: arr;
        begin
        i := l;
        j := r;
        x := a[(l + r) shr 1].x;
        repeat
                while a[i].x < x do i := i + 1;
                while a[j].x > x do j := j - 1;
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
procedure update(l, r, k: longint);
        var
                m: longint;
        begin
        if (l > Rx) or (r < Lx) then
                exit;
        if Lx <= l then
        if r <= Rx then
                begin
                ITc[k] := ITc[k] + intTyp;
                if intTyp = OpenH then
                        ITp[k] := r - l + 1
                else
                if ITc[k] = 0 then
                        ITp[k] := ITp[k * 2] + ITp[k * 2 + 1];
                exit;
                end;
        m := (l + r) shr 1;
        update(l, m, k * 2);
        update(m + 1, r, k * 2 + 1);
        if ITc[k] = 0 then
                ITp[k] := ITp[k * 2] + ITp[k * 2 + 1];
        end;
procedure process;
        var
                i, x0: longint;
        begin
        x0 := 0;
        res := 0;
        for i := 1 to n do
                begin
                res := res + (a[i].x - x0) * ITp[1];
                x0 := a[i].x;
                Lx := a[i].y1;
                Rx := a[i].y2 - 1;
                intTyp := a[i].typ;
                update(0, maxv, 1);
                end;
        writeln(res);
        end;
begin
        input;
        n := n shl 1;
        sort(1, n);
        process;
end.
