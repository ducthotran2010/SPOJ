const
        inp = 'RANKING.inp';
        out = 'RANKING.out';
        maxN = 32676;
type
        Node = array of longint;
var
        n, k, i, x, res, Value, Lx, Rx: longint;
        IT: array[1..maxN * 4] of Node;
        F, a: array[1..maxN] of longint;
function join(a, b: Node): Node;
        var
                tmp: Node;
                n, m, k, e: longint;
        begin
        e := high(a) + high(b);
        setlength(tmp, e + 1);
        n := low(a);
        m := low(b);
        k := low(tmp);
        while k < e do
                begin
                if a[n] < b[m] then
                        begin
                        tmp[k] := a[n];
                        n := n + 1;
                        end
                else
                        begin
                        tmp[k] := b[m];
                        m := m + 1;
                        end;
                k := k + 1;
                end;
        tmp[k] := maxlongint;
        exit(tmp);
        end;
procedure initV(l, r, k: longint);
        var
                m: longint;
        begin
        if l = r then
                begin
                setlength(IT[k], 2);
                IT[k][low(IT[k])] := a[l];
                IT[k][high(IT[k])] := maxlongint;
                exit;
                end;
        m := (l + r) shr 1;
        initV(l, m, k shl 1);
        initV(m + 1, r, k shl 1 or 1);
        IT[k] := join(IT[k shl 1], IT[k shl 1 or 1]);
        end;
function BinarySearch(a: Node): longint;
        var
                res, L, R, m: longint;
        begin
        L := low(a);
        R := high(a) - 1;
        res := 0;
        repeat
                m := (L + R) shr 1;
                if a[m] < Value then
                        begin
                        res := m + 1;
                        L := m + 1;
                        end
                else
                        R := m - 1;
        until L > R;
        exit(res);
        end;
procedure GetV(l, r, k: longint);
        var
                m: longint;
        begin
        if (Lx > R) or (L > Rx) then
                exit;
        if (Lx <= L) and (R <= Rx) then
                begin
                res := res + BinarySearch(IT[k]);
                exit;
                end;
        m := (l + r) shr 1;
        GetV(l, m, k shl 1);
        GetV(m + 1, r, k shl 1 or 1);
        end;
procedure process;
        var
                i: longint;
        begin
        F[1] := 1;
        Lx := 1;
        for i := 2 to n do
                begin
                res := 0;
                Rx := i - 1;
                Value := a[i];
                GetV(1, n, 1);
                F[i] := i - res;
                end;
        end;
begin
        assign(input, inp);
        reset(input);
        readln(n, k);
        for i := 1 to n do
                read(a[i]);
        initV(1, n, 1);
        process;
        assign(output, out);
        rewrite(output);
        for i := 1 to k do
                begin
                readln(x);
                writeln(F[x]);
                end;
        close(output);
        close(input);
end.