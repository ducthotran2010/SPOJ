const
        inp = 'MATCH2.inp';
        out = '';
        maxN = 200;
        maxV = 1000 * 1000;
var
        m, n, s, f, res: longint;
        c: array[1..maxN, 1..maxN] of longint;
        trace, matchX, matchY, Fx, Fy: array[1..maxN] of longint;
procedure enter;
        var
                i, j: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to n do
        for j := 1 to m do
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
                for j := 1 to m do
                if c[i,j] < Fx[i] then
                        Fx[i] := c[i,j];
                end;
        for i := 1 to m do
                begin
                Fy[i] := maxV;
                for j := 1 to n do
                if c[j,i] - Fx[j] < Fy[i] then
                        Fy[i] := c[j,i] - Fx[j];
                end;
        end;

function GetV(i, j: longint): longint; inline;
        begin exit(c[i,j] - Fx[i] - Fy[j]); end;

procedure findPath;
        var
                First, Last, i, j: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        First := 0;
        Last := 1;
        Q[1] := s;
        repeat
                inc(First);
                i := Q[First];
                for j := 1 to m do
                if (trace[j] = 0) and (GetV(i, j) = 0) then
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
        until First >= Last;
        end;
procedure reCaculateDelta;
        var
                Delta, i, j: longint;
                visitedX, visitedY: set of byte;
        begin
        visitedX := [s];
        visitedY := [];
        Delta := maxV;
        for i := 1 to m do
        if trace[i] <> 0 then
                begin
                include(visitedX, matchY[i]);
                include(visitedY, i);
                end;
        for i := 1 to n do
        if i in visitedX then
                for j := 1 to m do
                if not (j in visitedY) then
                if GetV(i, j) < Delta then
                        Delta := GetV(i, j);
        for i := 1 to m do
                begin
                if i in visitedX then
                        Fx[i] := Fx[i] + Delta;
                if i in visitedY then
                        Fy[i] := Fy[i] - Delta;
                end;
        end;
procedure reSolvePath;
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
procedure Hungari;
        var
                i: longint;
        begin
        for i := 1 to n do
                begin
                s := i;
                f := 0;
                repeat
                        findPath;
                        if f = 0 then
                                reCaculateDelta;
                until f <> 0;
                reSolvePath;
                end;
        end;
procedure prinf;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to n do
        if matchX[i] <> 0 then
        if c[i,matchX[i]] < maxV then
                res := res + c[i,matchX[i]];
        writeln(res);
        for i := 1 to n do
        if matchX[i] <> 0 then
        if c[i,matchX[i]] < maxV then
                writeln(i, ' ', matchX[i], ' ', c[i,matchX[i]]);
        end;
begin
        enter;
        init;
        Hungari;
        prinf;
end.
