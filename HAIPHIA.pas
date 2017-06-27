const
        inp = 'HAIPHIA.inp';
        out = '';
        maxn = 100;
var
        m, n, res: longint;
        a: array[1..maxn,1..maxn] of boolean;
        matchX, matchY, trace: array[1..maxn] of longint;
procedure enter;
        var
                x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(m, n);
        while not eof do
                begin
                readln(x, y);
                a[x,y] := true;
                end;
        close(input);
        end;
function findFinish: longint;
        var
                f, l, i, j: longint;
                Q: array[1..maxn] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        l := 0;
        for i := 1 to m do
        if matchX[i] = 0 then
                begin
                l := l + 1;
                Q[l] := i;
                end;
        f := 0;
        while l > f do
                begin
                f := f + 1;
                i := Q[f];
                for j := 1 to n do
                if a[i,j] and (Trace[j] = 0) and (matchX[i] <> j) then
                        begin
                        Trace[j] := i;
                        if matchY[j] = 0 then
                                exit(j);
                        l := l + 1;
                        Q[l] := matchY[j];
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
                i0: longint;
        begin
        repeat
                i0 := findFinish;
                if i0 <> 0 then
                        reSolve(i0);
        until i0 = 0;
        end;
procedure prinf;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to m do
        if matchX[i] <> 0 then
                res := res + 1;
        writeln(res);
        for i := 1 to m do
        if matchX[i] <> 0 then
                writeln(i, ' ', matchX[i]);
        end;
begin
        enter;
        process;
        prinf;
end.