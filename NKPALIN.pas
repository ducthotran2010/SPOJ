const
        inp = '';
        out = '';
        maxN = 2000;
var
        n: longint;
        x, y, res: ansistring;
        F: array[0..maxN,0..maxN] of longint;
procedure enter;
        begin
        assign(input, inp);
        reset(input);
        readln(x);
        close(input);
        end;
procedure init;
        var
                tmp: char;
                i, e: longint;
        begin
        y := x;
        n := length(x);
        e := n shr 1;
        for i := 1 to e do
                begin
                tmp := y[i];
                y[i] := y[n - i + 1];
                y[n - i + 1] := tmp;
                end;
        end;
function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;
procedure process;
        var
                i, j: longint;
        begin
        fillchar(F, sizeof(F), 0);
        for i := 1 to n do
        for j := 1 to n do
                if x[i] = y[j] then
                        F[i,j] := F[i - 1,j - 1] + 1
                else
                        F[i,j] := max(F[i - 1,j], F[i,j - 1]);
        end;
procedure prinf;
        var
                i, j: longint;
        begin
        i := n;
        j := n;
        res := '';
        while (i > 0) and (j > 0) do
                begin
                if x[i] = y[j] then
                        begin
                        res := x[i] + res;
                        i := i - 1;
                        j := j - 1;
                        end
                else
                if F[i - 1,j] = F[i,j] then
                        i := i - 1
                else
                        j := j - 1;
                end;
        writeln(res);
        end;
begin
        enter;
        init;
        process;
        prinf;
end.
