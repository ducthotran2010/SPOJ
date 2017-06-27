const
        inp = '';
        out = '';
        maxN = 1000;
        maxE = maxN * maxN;
var
        i, res, E, n, m, q, a, b, x, y, Lx, Rx, w, mode: longint;
        ITL, ITR, ITV, ITW: array[1..maxE * 4] of longint;

function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;
function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;

procedure initV(l, r, k: longint);
        var
                mid: longint;
        begin
        if l = r then
                begin
                ITL[k] := L mod m;
                if L mod m = 0 then
                        ITL[k] := m;
                ITR[k] := ITL[k];
                ITV[k] := 0;
                exit;
                end;
        mid := (l + r) shr 1;
        initV(l, mid, k shl 1);
        initV(mid + 1, r, k shl 1 or 1);
        ITL[k] := min(ITL[k shl 1], ITL[k shl 1 or 1]);
        ITR[k] := max(ITR[k shl 1], ITR[k shl 1 or 1]);
        end;
procedure update(l, r, k: longint);
        var
                m: longint;
        begin
        if (L > Rx) or (R < Lx)
        or (y < ITL[k]) or (b > ITR[k]) then
                exit;
        if (Lx <= L) and (R <= Rx) then
        if (b <= ITL[k]) and (ITR[k] <= y) then
                begin
                ITw[k] := ITw[k] - ITV[k] * (r - l + 1);
                ITV[k] := ITV[k] + w;
                ITw[k] := ITw[k] + ITV[k] * (r - l + 1);
                exit;
                end;
        m := (l + r) shr 1;
        update(l, m, k shl 1);
        update(m + 1, r, k shl 1 or 1);
        ITw[k] := ITv[k] * (r - l + 1) + ITw[k shl 1] + ITw[k shl 1 or 1];
        end;
procedure getV(l, r, k, val: longint);
        var
                m: longint;
        begin
        if (L > Rx) or (R < Lx) then
                exit;
        if (Lx <= L) and (R <= Rx) then
        if (b <= ITL[k]) and (ITR[k] <= y) then
                begin
                res := res + ITw[k] + val;
                exit;
                end;
        m := (l + r) shr 1;
        getV(l, m, k shl 1, val + ITv[k]);
        getV(m + 1, r, k shl 1 or 1, val + ITv[k]);
        end;
begin
        assign(input, inp);
        reset(input);
        readln(n, m, q);
        E := m * n;
        initV(1, E, 1);
        for i := 1 to q do
                begin
                read(mode);
                if mode = 1 then
                        begin
                        readln(a, b, x, y, w);
                        Lx := (x - 1) * m + b;
                        Rx := (a - 1) * m + y;
                        update(1, E, 1);
                        end
                else
                        begin
                        readln(a, b, x, y);
                        Lx := (x - 1) * m + b;
                        Rx := (a - 1) * m + y;
                        res := 0;
                        getV(1, E, 1, 0);
                        writeln(res);
                        end;
                end;
        close(input);
end.
