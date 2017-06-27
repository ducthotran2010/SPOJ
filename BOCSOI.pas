const
        inp = 'BOCSOI.inp';
        out = 'BOCSOI.out';
        maxn = 5;
        inf = 111539786;
type
        arrSpecV = array [0..4] of longint;
var
        n: longint;
        a: arrSpecV;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
                read(f, a[i mod n]);
        close(f);
        end;
function Count(a: arrSpecV): longint; inline;
        var
                i, res, x, y: longint;
        begin
        res := -1;
        for i := 0 to n do
        if a[i] <> 0 then
                begin
                res := 0;
                break;
                end;
        if res = -1 then
                exit(1);
        for i := 1 to n do
        if a[i mod n] mod 2 = 1 then
        if a[(i + 1) mod n] mod 2 = 1 then
                begin
                a[i mod n] := a[i mod n] - 1;
                a[(i + 1) mod n] := a[(i + 1) mod n] - 1;
                res := (res + Count(a)) mod inf;
                a[i mod n] := a[i mod n] + 1;
                a[(i + 1) mod n] := a[(i + 1) mod n] + 1;
                end;
        for i := 1 to n do
        if a[i mod n] > 0 then
        if a[(i + 1) mod n] > 0 then
                begin
                x := a[i mod n];
                y := a[(i + 1) mod n];
                a[i mod n] := a[i mod n] div 2;
                a[(i + 1) mod n] := a[(i + 1) mod n] div 2;
                res := (res + Count(a)) mod inf;
                a[i mod n] := x;
                a[(i + 1) mod n] := y;
                end;
        exit(res);
        end;
begin
        input;
        writeln(Count(a));
end.