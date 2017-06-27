const
        inp = 'MTWALK.inp';
        out = '';
        maxn = 100;
var
        n, res, maxv, minv: longint;
        a, b: array[0..maxn + 1,0..maxn + 1] of longint;
        d: array[0..maxn + 1,0..maxn + 1] of boolean;
procedure input;
        var
                f: text;
                i, j: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
        for j := 1 to n do
                begin
                read(f, a[i,j]);
                if a[i,j] > maxv then
                        maxv := a[i,j];
                if a[i,j] < minv then
                        minv := a[i,j];
                end;
        close(f);
        end;
function check(Limit: longint): boolean;
        var
                found: boolean;
                m1, m2, e, i, j: longint;
        procedure turn(i, j, k, z: longint);
                begin
                if not found then
                if d[i + k,j + z] then
                        begin
                        d[i + k,j + z] := false;
                        if not d[n,n] then
                                begin
                                found := true;
                                exit;
                                end;
                        turn(i + k, j + z, 0, -1);
                        turn(i + k, j + z, -1, 0);
                        turn(i + k, j + z, 0, 1);
                        turn(i + k, j + z, 1, 0);
                        end;
                end;
        begin
        found := false;
        for m1 := minv to maxv do
                begin
                m2 := m1 + Limit;
                fillchar(d, sizeof(d), false);
                for i := 1 to n do
                for j := 1 to n do
                if m1 <= a[i,j] then
                if a[i,j] <= m2 then
                        d[i,j] := true;
                if not d[1,1] then
                        continue;
                if not d[n,n] then
                        continue;
                turn(1, 1, 0, 1);
                turn(1, 1, 1, 0);
                if found then
                        exit(true);
                end;
        exit(false);
        end;
procedure process;
        var
                l, r, m: longint;
        begin
        l := minv;
        r := maxv;
        res := 110;
        repeat
                m := (l + r) shr 1;
                if check(m) then
                        begin
                        r := m - 1;
                        res := m;
                        end
                else
                        l := m + 1;
        until r < l;
        writeln(res);
        end;
begin
        maxv := 0;
        minv := 110;
        input;
        process;
end.
