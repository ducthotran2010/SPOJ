const
        inp = 'GAMES.inp';
        out = 'GAMES.out';
        maxN = 100 * 1000;
var
        res: int64;
        i, Lx, Rx, n, m: longint;
        a: array[1..maxN] of int64;
        ITmax, ITbonus: array[1..maxN * 4] of int64;

function max(a, b: int64): int64; inline;
        begin if a > b then max := a else max := b; end;

procedure init(l, r, k: longint);
        var
                m: longint;
        begin
        ITbonus[k] := -2;
        if l = r then
                begin
                ITmax[k] := a[l];
                exit;
                end;
        m := (l + r) shr 1;
        init(l, m, k shl 1);
        init(m + 1, r, k shl 1 or 1);
        ITmax[k] := max(ITmax[k shl 1], ITmax[k shl 1 or 1]);
        end;
procedure getv(l, r, k: longint);
        var
                m: longint;
        begin
        if (L > Rx) or (Lx > R) then
                exit;
        res := max(res, ITbonus[k] + 1);
        if (Lx <= L) and (R <= Rx) then
                begin
                res := max(res, ITmax[k] + 1);
                exit;
                end;
        m := (l + r) shr 1;
        getv(l, m, k shl 1);
        getv(m + 1, r, k shl 1 or 1);
        end;
procedure update(l, r, k: longint);
        var
                m: longint;
        begin
        if (L > Rx) or (Lx > R) then
                exit;
        if (Lx <= L) and (R <= Rx) then
                begin
                ITbonus[k] := max(ITbonus[k], res);
                ITmax[k] := max(ITmax[k], ITbonus[k]);
                exit;
                end;
        m := (l + r) shr 1;
        update(l, m, k shl 1);
        update(m + 1, r, k shl 1 or 1);
        ITmax[k] := max(ITmax[k shl 1], ITmax[k shl 1 or 1]);
        end;
begin
        //assign(input, inp);
        //reset(input);
        readln(n, m);
        for i := 1 to n do
                read(a[i]);
        init(1, n, 1);
        for i := 1 to m do
                begin
                readln(Lx, Rx);
                Rx := Lx + Rx - 1;
                res := -1;
                GetV(1, n, 1);
                update(1, n, 1);
                writeln(res);
                end;
        //close(input);
end.

