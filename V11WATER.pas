const
        inp = '';
        out = '';
        maxN = 1000 * 100;
var
        res: int64;
        n, Top1, Top2: longint;
        Q1, Q2: array[0..maxN] of longint;
        a: array[0..maxN] of int64;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                read(a[i]);
        close(input);
        end;
procedure init;
        var
                i, e: longint;
        begin
        e := 1;
        for i := 2 to n do
        if a[i] > a[e] then
                e := i;
        Top1 := 0;
        Top2 := 0;
        a[0] := 0;
        Q1[0] := 0;
        Q2[0] := 0;
        for i := 1 to e do
        if a[i] >= a[Q1[Top1]] then
                begin
                Top1 := Top1 + 1;
                Q1[Top1] := i;
                end;
        for i := n downto e do
        if a[i] >= a[Q2[Top2]] then
                begin
                Top2 := Top2 + 1;
                Q2[Top2] := i;
                end;
        end;
function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;
procedure process;
        var
                i, j: longint;
                minH: int64;
        begin
        res := 0;
        for i := 2 to Top1 do
                begin
                minH := min(a[Q1[i - 1]], a[Q1[i]]);
                for j := Q1[i - 1] + 1 to Q1[i] - 1 do
                        res := res + minH - a[j];
                end;
        for i := 2 to Top2 do
                begin
                minH := min(a[Q2[i - 1]], a[Q2[i]]);
                for j := Q2[i - 1] - 1 downto Q2[i] + 1 do
                        res := res + minH - a[j];
                end;
        writeln(res);
        end;
begin
        enter;
        init;
        process;
end.