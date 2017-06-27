const
        inp = 'HUNGARI.inp';
        out = '';
        maxN = 200;
        maxV = 1000 * 1000 + 1;
var
        n, res, start, finish: longint;
        c: array[1..maxN,1..maxN] of longint;
        Trace, Fx, Fy, matchX, matchY: array[1..maxN] of longint;
procedure enter;
        var
                i, j: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
        for j := 1 to n do
                c[i,j] := maxV;
        while not eof do
                readln(i, j, c[i,j]);
        close(input);
        end;
procedure init;
        var
                i, j: longint;
        begin
        fillchar(matchX, sizeof(matchX), 0);
        fillchar(matchY, sizeof(matchY), 0);
        for i := 1 to n do
                begin
                Fx[i] := maxV;
                for j := 1 to n do
                if c[i,j] < Fx[i] then
                        Fx[i] := c[i,j];
                end;
        for j := 1 to n do
                begin
                Fy[j] := maxV;
                for i := 1 to n do
                if c[i,j] - Fx[i] < Fy[j] then
                        Fy[j] := c[i,j] - Fx[i];
                end;
        end;
function GetC(i, j: longint): longint; inline;
        begin exit(c[i,j] - Fx[i] - Fy[j]); end;

procedure findPath;
        var
                Last, First, i, j: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        First := 0;
        Last := 1;
        Q[1] := start;
        repeat
                inc(First);
                i := Q[First];
                for j := 1 to n do
                if (Trace[j] = 0) and (GetC(i, j) = 0) then
                        begin
                        Trace[j] := i;
                        if matchY[j] = 0 then
                                begin
                                finish := j;
                                exit;
                                end;
                        inc(Last);
                        Q[Last] := j;
                        end;
        until First >= Last;
        end;
procedure SubX_AddY;
        var
                i, j, Delta: longint;
                visitedX, visitedY: set of byte;
        begin
        Delta := maxV;
        visitedX := [start];
        visitedY := [];
        for i := 1 to n do
        if trace[i] <> 0 then
                begin
                include(visitedX, matchY[i]);
                include(visitedY, i);
                end;
        for i := 1 to n do
        if i in visitedX then
                for j := 1 to n do
                if not (j in visitedY) then
                if GetC(i, j) < Delta then
                        Delta := GetC(i, j);
        for i := 1 to n do
                begin
                if i in visitedX then
                        Fx[i] := Fx[i] + Delta;
                if i in visitedY then
                        Fy[i] := Fy[i] - Delta;
                end;
        end;
procedure reSolve;
        var
                x, next: longint;
        begin
        repeat
                x := trace[finish];
                next := matchX[x];
                matchX[x] := finish;
                matchY[finish] := x;
                finish := next;
        until finish = 0;
        end;
procedure process;
        var
                i: longint;
        begin
        for i := 1 to n do
                begin
                start := i;
                finish := 0;
                repeat
                        findPath;
                        if finish = 0 then
                                SubX_addY;
                until finish <> 0;
                reSolve;
                end;
        end;
procedure prinf;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to n do
        if matchX[i] <> 0 then
                res := res + c[i,matchX[i]];
        writeln(res);
        for i := 1 to n do
        if matchX[i] <> 0 then
                writeln(i, ' ', matchX[i], ' ', c[i,matchX[i]]);
        end;
begin
        enter;
        init;
        process;
        prinf;
end.
