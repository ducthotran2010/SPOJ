const
        inp = '';
        out = '';
        maxN = 301;
var
        n, res: longint;
        d: array[1..maxN] of boolean;
        v: array[1..maxN] of longint;
        a: array[1..maxN,1..maxN] of longint;
procedure enter;
        var
                i, j, x: longint;
        begin
        readln(n);
        for i := 1 to n do
                begin
                readln(a[i,n + 1]);
                a[n + 1,i] := a[i, n + 1];
                end;
        for i := 1 to n do
        for j := 1 to n do
                read(a[i,j]);
        end;
function min(a, b: longint): longint;
        begin if a > b then min := b else min := a; end;

procedure Prim;
        var
                i, i0, intmin: longint;
        procedure init;
                var
                        i: longint;
                begin
                n := n + 1;
                for i := 1 to n do
                        begin
                        v[i] := maxlongint;
                        d[i] := false;
                        end;
                v[1] := 0;
                d[1] := true;
                for i := 1 to n do
                        v[i] := min(v[i], min(a[i,1], a[1,i]));
                end;
        begin
        init;
        repeat
                i0 := 0;
                intmin := maxlongint;
                for i := 1 to n do
                if not d[i] then
                if v[i] < intmin then
                        begin
                        intmin := v[i];
                        i0 := i;
                        end;
                if i0 = 0 then
                        break;
                res := res + intmin;
                d[i0] := true;
                for i := 1 to n do
                if not d[i] then
                        v[i] := min(v[i], min(a[i,i0], a[i0,i]));
        until false;
        end;
begin
        assign(input, inp);
        reset(input);
        enter;
        close(input);
        prim;
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
end.
