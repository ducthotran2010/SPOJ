const
        inp = 'ROBOT.inp';
        out = 'ROBOT.out';
        maxN = 1000;
        maxV = maxlongint - 1;
var
        k, n, m, Start, Finish, res: longint;
        a, b, trace, matchX, matchY, Fx, Fy: array[1..maxN] of longint;
        visitedX, visitedY: array[1..maxN] of boolean;
        c: array[1..maxN,1..maxN] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(m, n);
        for i := 1 to m do
                read(b[i]);
        for i := 1 to n do
                read(a[i]);
        close(input);
        end;
procedure init;
        var
                i, j: longint;
        begin
        fillchar(matchX, sizeof(matchX), 0);
        fillchar(matchY, sizeof(matchY), 0);
        k := m;
        if m < n then
                k := n;
        for i := 1 to k do
        for j := 1 to k do
                c[i,j] := maxV;
        for i := 1 to n do
        for j := 1 to m do
                c[i,j] := abs(a[i] - b[j]);
        for i := 1 to k do
                begin
                Fx[i] := maxV;
                for j := 1 to k do
                if c[i,j] < Fx[i] then
                        Fx[i] := c[i,j];
                end;
        for j := 1 to k do
                begin
                Fy[j] := maxV;
                for i := 1 to k do
                if c[i,j] - Fx[i] < Fy[j] then
                        Fy[j] := c[i,j] - Fx[i];
                end;
        end;

function GetV(i, j: longint): longint; inline;
        begin exit(c[i,j] - Fx[i] - Fy[j]); end;

procedure FindPath;
        var
                i, j, Last, First: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        Last := 1;
        First := 0;
        Q[1] := Start;
        repeat
                First := First + 1;
                i := Q[First];
                for j := 1 to k do
                if (Trace[j] = 0) and (GetV(i, j) = 0) then
                        begin
                        Trace[j] := i;
                        if matchY[j] = 0 then
                                begin
                                Finish := j;
                                exit;
                                end;
                        Last := Last + 1;
                        Q[Last] := matchY[j];
                        end;
        until Last <= First;
        end;
procedure SubX_AddY;
        var
                i, j, Delta: longint;
        begin
        Delta := maxV;
        fillchar(visitedX, sizeof(visitedX), false);
        fillchar(visitedY, sizeof(visitedY), false);
        visitedX[start] := true;
        for j := 1 to k do
        if Trace[j] <> 0 then
                begin
                visitedX[trace[j]] := true;
                visitedY[j] := true;
                end;
        for i := 1 to k do
        if visitedX[i] then
                for j := 1 to k do
                if not visitedY[j] then
                if GetV(i, j) < Delta then
                        Delta := GetV(i, j);
        for i := 1 to k do
                begin
                if visitedX[i] then
                        Fx[i] := Fx[i] + Delta;
                if visitedY[i] then
                        Fy[i] := Fy[i] - Delta;
                end;
        end;
procedure ApplyPath;
        var
                x, next: longint;
        begin
        repeat
                x := trace[Finish];
                next := matchX[x];
                matchX[x] := Finish;
                matchY[Finish] := x;
                Finish := next;
        until Finish = 0;
        end;
procedure process;
        var
                i: longint;
        begin
        for i := 1 to k do
                begin
                Start := i;
                Finish := 0;
                repeat
                        FindPath;
                        if Finish = 0 then
                                SubX_AddY;
                until Finish <> 0;
                ApplyPath;
                end;
        res := 0;
        for i := 1 to k do
        if c[i,matchX[i]] < maxV then
                res := res + c[i,matchX[i]];
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        init;
        process;
        prinf;
end.
