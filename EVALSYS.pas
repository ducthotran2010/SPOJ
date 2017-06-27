const
        inp = 'EVALSYS.inp';
        out = 'EVALSYS.out';
        maxn = 50000;
        maxnp = 25;
type
        svalue = record
                p: array[1..maxnp] of longint;
                end;
var
        x:svalue;
        f,fo:text;
        res, n, m, value, u, v, i, mode: longint;
        ITlabel, ITm: array[1..maxn * 8] of svalue;
        prime: array[1..maxnp] of longint=(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97);
        lk: array[2..97] of longint=(1,2,0,3,0,4,0,0,0,5,0,6,0,0,0,7,0,8,0,0,0,9,0,0,0,0,0,10,0,11,0,0,0,0,0,12,0,0,0,13,0,14,0,0,0,15,0,0,0,0,0,16,0,0,0,0,0,17,0,18,0,0,0,0,0,19,0,0,0,20,0,21,0,0,0,0,0,22,0,0,0,23,0,0,0,0,0,24,0,0,0,0,0,0,0,25);
procedure initv;
        var
                i, j: longint;
        begin
        for i := 1 to n * 8 do
        for j := 1 to maxnp do
                begin
                ITm[i].p[j] := 0;
                ITlabel[i].p[j] := 0;
                end;
        end;
operator  *(a, b: svalue)c: svalue;
        var
                i: longint;
                tmp: svalue;
        begin
        for i := 1 to maxnp do
                tmp.p[i] := a.p[i] + b.p[i];
        exit(tmp);
        end;
operator **(a: svalue; n: longint)c: svalue;
        var
                i: longint;
                tmp: svalue;
        begin
        for i := 1 to maxnp do
                tmp.p[i] := a.p[i] * n;
        exit(tmp);
        end;
function pt(x, mode: longint): svalue;
        var
                i: longint;
                tmp: svalue;
        begin
        for i := 1 to maxnp do
                tmp.p[i] := 0;
        i := 2;
        while x <> 1 do
        if x mod i = 0 then
                begin
                x := x div i;
                if mode = 1 then
                        tmp.p[lk[i]] := tmp.p[lk[i]] + 1
                else
                        tmp.p[lk[i]] := tmp.p[lk[i]] - 1;
                end
        else i := i + 1;
        exit(tmp);
        end;
procedure query1(l, r, k: longint);
        var
                m: longint;
        begin
        if (l > v)or(r < u) then
                exit;
        if u <= l then
        if r <= v then
                begin
                ITlabel[k] := ITlabel[k] * x;
                ITm[k] := ITm[k] * (x ** (r - l + 1));
                exit;
                end;
        m := (l + r) shr 1;
        query1(l, m, k * 2);
        query1(m + 1, r, k * 2 + 1);
        ITm[k] := ITm[k * 2] * ITm[k * 2 + 1] * ITlabel[k] ** (r - l + 1);
        end;
procedure query2(l, r, k: longint);
        var
                m: longint;
        begin
        if (l > v) or (r < u) then
                exit;
        if u <= l then
        if r <= v then
                begin
                ITlabel[k] := ITlabel[k] * x;
                ITm[k] := ITm[k] * (x ** (r - l + 1));
                exit;
                end;
        m := (l + r) shr 1;
        query2(l, m, k * 2);
        query2(m + 1, r, k * 2 + 1);
        ITm[k] := ITm[k * 2] * ITm[k * 2 + 1] * ITlabel[k] ** (r - l + 1);
        end;
function aicap(x: svalue): longint;
        var
                tmp, t, i: longint;
        begin
        tmp := 1;
        for i := 1 to maxnp do
                begin
                t := prime[i];
                while x.p[i] <> 0 do
                        begin
                        if x.p[i] and 1 = 1 then
                                tmp := tmp * t mod value;
                        t := t * t mod value;
                        x.p[i] := x.p[i] shr 1;
                        end;
                end;
        exit(tmp);
        end;
procedure query0(l, r, k: longint);
        var
                m: longint;
        begin
        if (l > v) or (r < u) then
                exit;
        if u <= l then
        if r <= v then
                begin
                res := aicap(pt(res, 1) * ITm[k]);
                exit;
                end;
        m := (l + r) shr 1;
        query0(l, m, k * 2);
        query0(m + 1, r, k * 2 + 1);
        end;
begin
        assign(f, inp);
        reset(f);
        readln(f, n, m);
        assign(fo, out);
        rewrite(fo);
        initv;
        for i:= 1 to m do
                begin
                read(f, mode, u, v, value);
                case mode of
                0:      begin
                        res := 1;
                        query0(1, n, 1);
                        writeln(fo, res);
                        end;
                1:      begin
                        x := pt(value, 1);
                        query1(1, n, 1);
                        end;
                2:      begin
                        x := pt(value, 2);
                        query2(1, n, 1);
                        end;end;
                end;
        close(fo);
        close(f);
end.
