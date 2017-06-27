const
        inp = '';
        out = '';
        maxN = 30;
        maxE = 1 shl (maxN shr 1);
type
        arr = record
                x, y: longint;
                end;
var
        A, B, n, res, SumX, SumY, n2, Limit: longint;
        x, y: array[1..maxN] of longint;
        Q: array[1..maxE] of arr;
        F: array[1..maxE] of longint;

operator = (a, b: arr)c: boolean; inline;
        begin exit((a.x = b.x) and (a.y = b.y)); end;

procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(x[i], y[i]);
        readln(A, B);
        close(input);
        end;
procedure init;
        begin
        res := 0;
        SumX := 0;
        SumY := 0;
        Limit := 0;
        n2 := N shr 1;
        end;
procedure try(i: longint);
        var
                j: longint;
        begin
        for j := 0 to 1 do
                begin
                SumX := SumX + x[i] * j;
                SumY := SumY + y[i] * j;
                if i < n2 then
                        try(i + 1)
                else
                        begin
                        inc(Limit);
                        Q[Limit].x := SumX;
                        Q[Limit].y := SumY;
                        end;
                SumX := SumX - x[i] * j;
                SumY := SumY - y[i] * j;
                end;
        end;
procedure sort(l, r: longint);
        var
                i, j: longint;
                tmp, x: arr;
        begin
        i := l;
        j := r;
        x := Q[(l + r) div 2];
        repeat
                while (Q[i].x < x.x) or ((Q[i].x = x.x) and (Q[i].y < x.y)) do i := i + 1;
                while (Q[j].x > x.x) or ((Q[j].x = x.x) and (Q[j].y > x.y)) do j := j - 1;
                if i <= j then
                        begin
                        tmp := Q[i];
                        Q[i] := Q[j];
                        Q[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;
procedure process;
        var
                i, Delta: longint;
        begin
        Delta := 0;
        for i := 2 to Limit do
                begin
                if Q[i] = Q[i - Delta - 1] then
                        begin
                        inc(F[i - Delta - 1]);
                        inc(Delta);
                        end;
                Q[i - Delta] := Q[i];
                end;
        Limit := Limit - Delta;
        for i := 1 to Limit do
                inc(F[i]);
        end;
function BinarySearch(x, y: longint): longint;
        var
                L, R, m: longint;
        begin
        L := 1;
        R := Limit;
        repeat
                m := (L + R) shr 1;
                if Q[m].x > x then
                        R := m - 1
                else
                if Q[m].x < x then
                        L := m + 1
                else
                        begin
                        if Q[m].y > y then
                                R := m - 1
                        else
                        if Q[m].y < y then
                                L := m + 1
                        else
                                exit(F[m]);
                        end;
        until L > R;
        exit(0);
        end;
procedure try2nd(i: longint);
        var
                j: longint;
        begin
        for j := 0 to 1 do
                begin
                SumX := SumX + x[i] * j;
                SumY := SumY + y[i] * j;
                if i < n then
                        try2nd(i + 1)
                else
                        res := res + BinarySearch(A - SumX, B - SumY);
                SumX := SumX - x[i] * j;
                SumY := SumY - y[i] * j;
                end;
        end;
begin
        enter;
        init;
        try(1);
        sort(1, Limit);
        process;
        try2nd(n2 + 1);
        writeln(res);
end.
