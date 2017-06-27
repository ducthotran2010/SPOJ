const
        inp = 'QBSEQ.inp';
        out = '';
        maxN = 1000;
        maxK = 50;
var
        res, n, k: longint;
        d: array[0..maxK] of longint;
procedure enter;
        var
                i, x: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, k);
        for i := 1 to n do
                begin
                read(x);
                d[x mod k] := d[x mod k] + 1;
                end;
        close(input);
        end;

function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;

procedure process;
        var
                i, e: longint;
        begin
        res := d[0];
        e := (k - 1) shr 1;
        for i := 1 to e do
                res := res + 2 * min(d[i], d[k - i]);
        writeln(res);
        end;
begin
        enter;
        process;
end.