const
        inp = '';
        out = '';
        maxN = 1000;
        maxV = 1000 * 1000 + 1;
var
        A, B, n, m, res: longint;
        c, F: array[1..maxN, 1..maxN] of longint;
        Delta, Trace: array[1..maxN] of longint;
procedure enter;
        var
                i, u, v: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m, A, B);
        for i := 1 to m do
                readln(u, v, c[u,v]);
        close(input);
        end;

function min(a, b: longint): longint; inline;
        begin if a > b then min := b else min := a; end;

function FindPath: boolean;
        var
                Last, First, u, v: longint;
                Q: array[1..maxN] of longint;
        begin
        fillchar(Trace, sizeof(Trace), 0);
        Last := 1;
        First := 0;
        Q[1] := A;
        Delta[A] := maxV;
        Trace[A] := n + 1;
        repeat
                inc(First);
                u := Q[First];
                for v := 1 to n do
                if Trace[v] = 0 then
                        begin
                        if f[u,v] < c[u,v] then
                                begin
                                Trace[v] := u;
                                Delta[v] := min(Delta[u], c[u,v] - f[u,v]);
                                end
                        else
                        if f[v,u] > 0 then
                                begin
                                Trace[v] := -u;
                                Delta[v] := min(Delta[u], f[v,u]);
                                end;
                        if Trace[v] <> 0 then
                                begin
                                if v = B then
                                        exit(true);
                                inc(Last);
                                Q[Last] := v;
                                end;
                        end;
        until First >= Last;
        exit(false);
        end;
procedure IncFlow;
        var
                u, v, IncValue: longint;
        begin
        v := B;
        IncValue := Delta[B];
        repeat
                u := Trace[v];
                if u > 0 then
                        F[u,v] := F[u,v] + IncValue
                else
                        begin
                        u := -u;
                        F[v,u] := F[v,u] - IncValue;
                        end;
                v := u;
        until v = A;
        end;
procedure prinf;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to n do
        if c[A,i] > 0 then
                res := res + F[A,i];
        writeln(res);
        end;
begin
        enter;
        repeat
                if not Findpath then
                        break;
                IncFlow;
        until false;
        prinf;
end.