const
        inp = 'MAXARR1.inp';
        out = 'test.out';
        maxp = 5;
var
        i: longint;
        n, t: int64;
        a: array[0..maxP] of int64;
procedure init;
        var
                i: longint;
        begin
        a[0] := 0;
        a[1] := 1;
        for i := 2 to maxP do
        if i and 1 = 0 then
                a[i] := a[i shr 1]
        else
                a[i] := a[i shr 1] + a[i shr 1 + 1];
        end;
function GetV(k: int64): int64;
        begin
        if k <= maxP then
                exit(a[k]);
        if k and 1 = 0 then
                exit(GetV(k shr 1));
        exit(GetV(k shr 1) + GetV(k shr 1 + 1));
        end;
begin
        init;
        assign(input, inp);
        reset(input);
        assign(output, out);
        rewrite(output);
        readln(t);
        for i := 1 to t do
                begin
                readln(n);
                if n and 1 = 0 then
                        n := n - 1;
                writeln(GetV(n));
                end;
        close(output);
        close(input);
end.
