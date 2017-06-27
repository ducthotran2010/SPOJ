var
        i: Longint;
        n, cc, kc, c, k: Int64;
        a: array[1..25000] of Int64;

function min(a, b: Int64): Int64; inline;
        begin if a < b then min := a else min := b; end;

begin
        readln(n);
        for i := 1 to n - 1 do
                read(A[i]);
        cc := A[1];
        kc := A[1];
        for i := 2 to n - 1 do
                begin
                c := min(cc, kc) + a[i];
                k := cc;
                cc := c; kc := k;
                end;
        writeln(c);
end.