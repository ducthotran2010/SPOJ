const
        inp = '';
        out = '';
        maxn = 100000;
type
        AI = array of longint;
var
        f, g: text;
        Found: boolean;
        n, q, i, res, resb, count, Lg, Rg, Lx, Rx, H: longint;
        IT: array[1..maxn * 4] of AI;
        a: array[1..maxn] of longint;
function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;

function joinA(a, b: AI): AI;
        var
                L, R, n, i: longint;
                c: AI;
        begin
        L := 0;
        R := 0;
        n := high(a) + high(b) + 1;
        setlength(c, n);
        for i := 0 to n - 2 do
        if a[L] < b[R] then
                begin
                c[i] := a[L];
                L := L + 1;
                end
        else
                begin
                c[i] := b[R];
                R := R + 1;
                end;
        c[n - 1] := maxlongint;
        exit(c);
        end;
procedure initV(l, r, k: longint);
        var
                m: longint;
        begin
        if l = r then
                begin
                setlength(IT[k], 2);
                IT[k][0] := a[l];
                IT[k][1] := maxlongint;
                exit;
                end;
        m := (l + r) div 2;
        initV(l, m, k * 2);
        initV(m + 1, r, k * 2 + 1);
        IT[k] := joinA(IT[k * 2], IT[k * 2 + 1]);
        end;
procedure BinarySearch(k: longint);
        var
                L, R, j, mid: longint;
        begin
        L := 0;
        R := high(IT[k]) - 1;
        j := -1;
        repeat
                if IT[k][(L + R) shr 1] > IT[1][res] then
                        R := (L + R) shr 1 - 1
                else
                if IT[k][(L + R) shr 1] < IT[1][res] then
                        begin
                        mid := (L + R) shr 1;
                        j := max(mid, j);
                        L := mid + 1;
                        end

                else
                        begin
                        Found := true;
                        mid := (L + R) shr 1;
                        j := max(mid, j);
                        L := mid + 1;
                        end;
        until R < L;
        Count := Count + j + 1;
        end;
procedure GetV(l, r, k: longint);
        var
                m: longint;
        begin
        if (r < Lg) or (Rg < l) then
                exit;
        if Lg <= l then
        if r <= Rg then
                begin
                BinarySearch(k);
                exit;
                end;
        m := (l + r) div 2;
        GetV(l, m, k * 2);
        GetV(m + 1, r, k * 2 + 1);
        end;
begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
                read(f, a[i]);
        initV(1, n, 1);
        readln(f, q);
        assign(g, out);
        rewrite(g);
        for i := 1 to q do
                begin
                readln(f, Lg, Rg, H);
                Lx := 0;
                Rx := n - 1;
                count := -maxlongint;
                resb := maxlongint;
                repeat
                        if count > H then
                                resb := res;
                        Count := 0;
                        Found := false;
                        res := (Lx + Rx) shr 1;
                        GetV(1, n, 1);
                        if Count < H then
                                Lx := res + 1
                        else
                                Rx := res - 1;
                        if Lx > Rx then
                        if count < H then
                        if resb <> maxlongint then
                                begin
                                Found := true;
                                count := H;
                                res := resb;
                                end;
                        if res = Lx then
                        if count > H then
                                count := H;
                until (Count = H) and Found;
                writeln(g, IT[1][res]);
                end;
        close(g);
        close(f);
end.
