const
        inp = '';
        out = '';
        maxN = 500;
var
        n, m: longint;
        a: array[1..maxN,1..maxN] of longint;
        F: array[0..1,0..maxN] of ansistring;
procedure enter;
        var
                i, j: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(m, n);
        for i := 1 to m do
        for j := 1 to n do
                read(a[i,j]);
        close(input);
        end;

function max(a, b: ansistring): ansistring; inline;
        begin if a > b then max := a else max := b; end;

procedure process;
        var
                i, j: longint;
        begin
        for i := 1 to m do
        for j := 1 to n do
                begin
                if a[i,j] = 2 then
                        begin
                        F[i and 1,j] := #0;
                        continue;
                        end;
                F[i and 1,j] := max(F[(i - 1) and 1,j], F[i and 1,j - 1]) + chr(a[i,j] + 48);
                end;
        writeln(F[m and 1,n]);
        end;
begin
        enter;
        process;
end.3 5



0 1 2 0 2



0 1 0 0 1



1 2 1 2 1


