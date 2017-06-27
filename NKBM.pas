const
        inp = '';
        out = '';
        maxN = 1000;
var
        res, n, m: longint;
        a: array[1..maxN,1..maxN] of boolean;
        matchX, matchY, trace: array[1..maxN] of longint;
procedure enter;
        var
                i, k, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m, k);
        for i := 1 to k do
                begin
                readln(x, y);
                a[x,y] := true;
                end;
        close(input);
        end;
function FindPath: longint;
        var
                i, j, Last, First: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        Last := 0;
        First := 0;
        for i := 1 to n do
        if matchX[i] = 0 then
                begin
                Last := Last + 1;
                Q[Last] := i;
                end;
        while Last > First do
                begin
                First := First + 1;
                i := Q[First];
                for j := 1 to m do
                if trace[j] = 0 then
                if a[i,j] then
                if matchY[j] <> i then
                        begin
                        trace[j] := i;
                        if matchY[j] = 0 then
                                exit(j);
                        Last := Last + 1;
                        Q[Last] := matchY[j];
                        end;
                end;
        exit(0);
        end;
procedure reSolve(f: longint);
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
procedure process;
        var
                finish: longint;
        begin
        repeat
                finish := findPath;
                if finish <> 0 then
                        reSolve(finish);
        until finish = 0;
        end;
procedure prinf;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to n do
        if matchX[i] <> 0 then
                res := res + 1;
        writeln(res);
        end;
begin
        enter;
        process;
        prinf;
end.