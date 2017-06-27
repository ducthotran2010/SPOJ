const
        inp = 'LUONG.inp';
        out = 'LUONG.out';
        maxN = 1000;
var
        s, n, m, A, i0: longint;
        c, F: array[1..maxN,1..maxN] of longint;
        Trace, Delta, P: array[1..maxN] of longint;

function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;

procedure enter;
        var
                x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for x := 1 to n do
        for y := 1 to n do
                read(c[x,y]);
        for x := 1 to n do
                read(P[x]);
        close(input);
        end;
function FoundPath: longint;
        var
                Last, First, x, y: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(Trace, sizeof(Trace), 0);
        Last := 1;
        First := 0;
        Q[1] := A;
        Delta[A] := maxlongint;
        repeat
                inc(First);
                x := Q[First];
                for y := 1 to n do
                if Trace[y] = 0 then
                        begin
                        if c[x,y] > F[x,y] then
                                begin
                                Trace[y] := x;
                                Delta[y] := min(Delta[x], c[x,y] - F[x,y]);
                                end
                        else
                        if F[y,x] > 0 then
                                begin
                                Trace[y] := -x;
                                Delta[y] := min(Delta[x], F[y,x]);
                                end;
                        if Trace[y] <> 0 then
                                begin
                                if P[y] > 0 then
                                        exit(y);
                                inc(Last);
                                Q[Last] := y;
                                end;
                        end;
        until First >= Last;
        exit(0);
        end;
procedure IncFlow;
        var
                x, y, IncValue: longint;
        begin
        y := i0;
        IncValue := Delta[i0];
        repeat
                x := Trace[y];
                if y > 0 then
                        F[x,y] := F[x,y] + IncValue
                else
                        begin
                        y := -y;
                        F[y,x] := F[y,x] - IncValue;
                        end;
                y := x;
        until x = A;
        end;
function chooseF: longint;
        var
                i: longint;
        begin
        for i := s to n do
        if P[i] < 0 then
                begin
                s := i + 1;
                exit(i);
                end;
        exit(0);
        end;
procedure prinf;
        var
                x, y, res: longint;
        begin
        res := 0;
        S := 1;
        A := chooseF;
        for x := 1 to n do
                res := res + F[A,x];
        for x := 1 to n do
        for y := 1 to n do
        if F[x,y] <> 0 then
                writeln(x, #32, y, #32, F[x,y]);
        writeln('Max FLow: ', res);
        end;
function choosedF: longint;
        var
                i: longint;
        begin
        for i := s to n do
        if P[i] < 0 then
                begin
                s := i + 1;
                exit(i);
                end;
        exit(0);
        end;
begin
        enter;
        S := 1;
        A := chooseF;
        repeat
                i0 := FoundPath;
                if i0 <> 0 then
                        IncFlow
                else
                        begin
                        A := chooseF;
                        if A = 0 then
                                break;
                        end;
        until false;
        prinf;
end.