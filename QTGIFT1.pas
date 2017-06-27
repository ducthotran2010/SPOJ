const
        inp = '';
        out = '';
        maxN = 1000 * 1000;
var
        n, k: longint;
        F, S: array[-maxN..maxN] of int64;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, k);
        S[0] := 0;
        for i := 1 to n do
                begin
                read(S[i]);
                S[i] := S[i - 1] + S[i];
                end;
        close(input);
        end;

function max(a, b: int64): int64;
        begin if a > b then max := a else max := b end;

procedure process;
        var
                i: longint;
        begin
        if k >= 3 then
        for i := 1 to n do
                F[i] := max(F[i - 1], max(S[i] - S[i - 1] + F[i - k + 1], S[i] - S[i - k + 1] + F[i - k]))
        else
        for i := 1 to n do
                F[i] := max(F[i - 2] + S[i] - S[i - 1], F[i - 1]);
        end;
begin
        enter;
        if k > 1 then
                process;
        writeln(F[n]);
end.

