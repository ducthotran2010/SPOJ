const
        inp = '';
        out = '';
        maxN = 200;
var
        n, res, s, f, L, R, M: longint;
        a: array[1..maxn,1..maxn] of longint;
        c: array[1..maxn,1..maxn] of boolean;
        trace, matchX, matchY, Fx, Fy: array[1..maxn] of longint;
procedure enter;
        var
                i, j: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
        for j := 1 to n do
                begin
                read(a[i,j]);
                if a[i,j] > R then
                        R := a[i,j];
                if a[i,j] < L then
                        L := a[i,j];
                end;
        close(input);
        end;
procedure init;
        var
                i, j: longint;
        begin
        fillchar(matchX, sizeof(matchX), 0);
        fillchar(matchY, sizeof(matchY), 0);
        for i := 1 to n do
        for j := 1 to n do
                c[i,j] := a[i,j] <= M;
        end;
procedure findPath;
        var
                First, Last, i, j: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        Last := 0;
        First := 0;
        for i := 1 to n do
        if matchX[i] = 0 then
                begin
                inc(Last);
                Q[Last] := i;
                end;
        while Last > First do
                begin
                inc(First);
                i := Q[First];
                for j := 1 to n do
                if (trace[j] = 0) and c[i,j] and (matchY[j] <> i) then
                        begin
                        trace[j] := i;
                        if matchY[j] = 0 then
                                begin
                                f := j;
                                exit;
                                end;
                        inc(Last);
                        Q[Last] := matchY[j];
                        end;
                end;
        end;
procedure reSolvePath(f: longint);
        var
                x, next: longint;
        begin
        repeat
                x := trace[f];
                next := matchX[x];
                matchX[x] := f;
                matchY[f] := x;
                f := next;
        until f = 0;
        end;
procedure Solve;
        begin
        repeat
                f := 0;
                findPath;
                if f <> 0 then
                        reSolvePath(f);
        until f = 0;
        end;
function check: boolean;
        var
                i: longint;
        begin
        for i := 1 to n do
        if matchX[i] = 0 then
                exit(false);
        exit(true);
        end;
begin
        L := maxlongint;
        R := -maxlongint;
        enter;
        repeat
                m := (l + r) shr 1;
                init;
                Solve;
                if check then
                        begin
                        r := m - 1;
                        res := m;
                        end
                else
                        l := m + 1;
        until L > R;
        writeln(res);
end.