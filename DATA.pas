const
        inp = '';
        maxN = trunc(1e5);
var
        i, n: longint;
        a: array[1..maxN] of longint;
procedure DaoMang(l, r: longint);
        var
                tmp, i: longint;
        begin
        for i := l to (l + r) shr 1 do
                begin
                tmp := a[i];
                a[i] := a[l + r - i];
                a[l + r - i] := tmp;
                end;
        end;
function check: longint;
        var
                j: longint;
        begin
        for j := 2 to n do
        if a[j] <= a[j - 1] then
                exit(-1);
        exit(i);
        end;
begin
        readln(n);
        for i := 1 to n do
                read(a[i]);
        for i := 2 to n do
        if a[i] < a[i - 1] then
                break;
        DaoMang(1, n);
        DaoMang(1, n - i + 1);
        DaoMang(n - i + 2, n);
        writeln(check);
end.