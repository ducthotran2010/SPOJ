const
        inp = 'NKFLOW.inp';
        out = '';
        maxN = 1000;
        maxV = 1000 * 1000 + 1;
var
        n, m, A, B, res: longint;
        c, F: array[1..maxN,1..maxN] of longint;
        Trace, Delta: array[1..maxN] of longint;
procedure enter;
        var
                i, j, k: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m, A, B);
        for k := 1 to m do
                readln(i, j, c[i,j]);
        close(input);
        end;

function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;

function FindPath: boolean;
        var
                First, Last, i, j: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(trace, sizeof(trace), 0);
        First := 0;
        Last := 1;
        Q[1] := A;
        Delta[A] := maxV;
        Trace[A] := n + 1;
        repeat
                inc(First);
                i := Q[first];
                for j := 1 to n do
                if trace[j] = 0 then
                        begin
                        if f[i,j] < c[i,j] then
                                begin
                                trace[j] := i;
                                Delta[j] := min(Delta[i], c[i,j] - f[i,j]);
                                end
                        else
                        if f[j,i] > 0 then
                                begin
                                trace[j] := -i;
                                Delta[j] := min(Delta[i], f[j,i]);
                                end;
                        if trace[j] <> 0 then
                                begin
                                if j = B then
                                        exit(true);
                                inc(Last);
                                Q[Last] := j;
                                end;
                        end;
        until First >= Last;
        exit(false);
        end;
procedure IncFlow;
        var
                i, j, IncV: longint;
        begin
        j := B;
        IncV := Delta[B];
        repeat
                i := trace[j];
                if i > 0 then
                        F[i,j] := F[i,j] + IncV
                else
                        begin
                        i := -i;
                        F[j,i] := F[j,i] - IncV;
                        end;
                j := i;
        until j = A;
        end;
procedure prinf;
        var
                i, j, res: longint;
        begin
        res := 0;
        for i := 1 to n do
        for j := i + 1 to n do
        if f[i,j] > 0 then
                begin
                writeln(i, ' ', j, ' ', F[i,j]);
                if i = A then
                        res := res + F[i,j];
                end;
        writeln(res);
        end;
begin
        enter;
        repeat
                if not FindPath then
                        break;
                IncFlow;
        until false;
        prinf;
end.
