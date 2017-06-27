const
        inp = 'KPLANK.inp';
        out = 'KPLANK.out';
        maxN = 1000 * 1000;
var
        n, res: longint;
        pre, nex, a: array[0..maxN + 1] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(a[i]);
        close(input);
        end;
procedure buildPre;
        var
                i, Limit: longint;
                Q: array[0..maxN] of longint;
        begin
        Q[0] := 0;
        a[0] := 0;
        Limit := 0;
        for i := 1 to n do
        if a[i] > a[i - 1] then
                begin
                pre[i] := i;
                Limit := Limit + 1;
                Q[Limit] := i;
                end
        else
                begin
                while a[Q[Limit]] >= a[i] do
                        Limit := Limit - 1;
                Limit := Limit + 1;
                pre[i] := pre[Q[Limit]];
                Q[Limit] := i;
                end;
        end;
procedure buildNex;
        var
                i, Limit: longint;
                Q: array[0..maxN] of longint;
        begin
        Q[0] := 0;
        a[n + 1] := 0;
        Limit := 0;
        for i := n downto 1 do
        if a[i] > a[i + 1] then
                begin
                nex[i] := i;
                Limit := Limit + 1;
                Q[Limit] := i;
                end
        else
                begin
                while a[Q[Limit]] >= a[i] do
                        Limit := Limit - 1;
                Limit := Limit + 1;
                nex[i] := nex[Q[Limit]];
                Q[Limit] := i;
                end;
        end;

function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;

procedure process;
        var
                i: longint;
        begin
        res := 0;
        for i := 1 to n do
        if min(a[i], nex[i] - pre[i] + 1) > res then
                res := min(a[i], nex[i] - pre[i] + 1);
        writeln(res);
        end;
begin
        enter;
        buildPre;
        buildNex;
        process;
end.