const
        inp = '';
        out = '';
        maxN = 5000;
var
        n, res: longint;
        F: array[0..maxN] of longint;
procedure enter;
        var
                i, x: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        F[0] := 0;
        for i := 1 to n do
                begin
                readln(x);
                F[i] := F[i - 1] + x;
                end;
        close(input);
        end;

function check(Lx, Rx: longint): boolean;
        var
                L, R, m, v1, v2: longint;
        begin
        L := Lx;
        R := Rx;
        repeat
                m := (l + r) shr 1;
                v1 := F[m] - F[Lx - 1];
                v2 := F[Rx] - F[m];
                if v1 < v2 then
                        l := m + 1
                else
                if v1 > v2 then
                        r := m - 1
                else
                        exit(true);
        until l > r;
        exit(false);
        end;
procedure process;
        var
                i, j: longint;
        begin
        res := 0;
        for i := 1 to n - 1 do
        for j := n downto i + 1 do
                begin
                if j - i + 1 < res then
                        break;
                if n - i + 1 < res then
                        exit;
                if (F[j] - F[i - 1]) and 1 = 0 then
                if check(i,j) then
                if j - i + 1 > res then
                        res := j - i + 1;
                end;
        end;
begin
        enter;
        process;
        writeln(res);
end.
