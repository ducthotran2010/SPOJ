const
        inp = 'CASO.inp';
        maxN = trunc(1e5);
var
        i, n: longint;
        res, count: int64;
        a: array[1..maxN + 1] of int64;
procedure sort(l, r: longint);
        var
                i, j: longint;
                x, tmp: int64;
        begin
        i := l;
        j := r;
        x := a[(l + r) div 2];
        repeat
                while a[i] < x do i := i + 1;
                while a[j] > x do j := j - 1;
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
        readln(n);
        for i := 1 to n do
                read(a[i]);
        sort(1, n);
        a[n + 1] := 0;
        count := 1;
        for i := 2 to n + 1 do
                begin
                if a[i] <> a[i - 1] then
                        begin
                        res := res + count * (count - 1) div 2;
                        count := 0;
                        end;
                count := count + 1;
                end;
        writeln(res);
end.