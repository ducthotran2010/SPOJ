const
        maxN = 100000;
var
        n, i: longint;
        kq: int64;
        a: array[1..maxN + 2] of longint;
        l, r: array[0..(maxN div 2) + 2] of longint;
function count_inv(u, v: longint): int64;
        var
                x, y, z: int64;
                i, j, mid, nl, nr: longint;
        begin
        if (u >= v) then
                begin
                count_inv := 0;
                exit;
                end;
        mid := (v + u) div 2;
        x := count_inv(u, mid);
        y := count_inv(mid + 1, v);
        for i := u to mid do
                l[i - u] := a[i];
        for j := mid + 1 to v do
                r[j - (mid + 1)] := a[j];
        nl := mid - u + 1;
        nr := v - mid;
        r[nr] := maxlongint;
        z := 0;
        j := 0;
        for i := 0 to nl - 1 do
                begin
                for j := j to nr do
                        begin
                        if (l[i] > r[j]) then
                                a[u + i + j] := r[j]
                        else
                                break;
                        end;
                a[u + i + j] := l[i];
                z := z + j;
                end;
        for j := j to nr - 1 do
                a[u + nl + j] := r[j];
        count_inv:=x + y + z;
        end;
begin
        readln(n);
        for i := 1 to n do
                read(a[i]);
        kq := count_inv(1, n);
        writeln(kq);
end.

