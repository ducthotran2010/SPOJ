const
        inp = 'TKSEQ.inp';
        out = 'TKSEQ.out';
        maxn = 500;
        LowInt64 = low(int64);
var
        n, k: longint;
        a: array[1..maxn] of longint;
        F: array[0..maxn,0..maxn] of int64;
        booIsNeg: array[1..maxn] of boolean;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, k);
        for i := 1 to n do
                read(f, a[i]);
        close(f);
        end;
procedure init;
        var
                i, t: longint;
        begin
        t := 2;
        k := k * 3;
        while t < k do
                begin
                booIsNeg[t] := true;
                t := t + 3;
                end;
        for i := 1 to k do
                F[i,i - 1] := LowInt64;
        end;

function max(a, b: int64): int64; inline;
        begin if a > b then max := a else max := b; end;

procedure process;
        var
                i, j, e: longint;
        begin
        for i := 1 to k do
                begin
                e := n - k + i;
                for j := i to e do
                if not booIsNeg[i] then
                        F[i,j] := max(F[i,j - 1], F[i - 1,j - 1] + a[j])
                else
                        F[i,j] := max(F[i,j - 1], F[i - 1,j - 1] - a[j]);
                end;
        end;
procedure prinf;
        var
                fo: text;
        begin
        assign(fo, out);
        rewrite(fo);
        writeln(fo, F[k,n]);
        close(fo);
        end;
begin
        input;
        init;
        process;
        prinf;
end.
