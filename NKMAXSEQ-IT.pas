const
        inp = '';
        out = '';
        maxN = 50001;
var
        res, Stmp, Lx, Rx, Locate, n, p: longint;
        a, s: array[1..maxN] of longint;
        ITmin, ITL, ITR: array[1..maxN * 4] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, p);
        for i := 1 to n do
                readln(a[i]);
        close(input);
        end;
procedure init;
        var
                i: longint;
        begin
        n := n + 1;
        s[1] := 0;
        for i := 2 to n do
                s[i] := s[i - 1] + a[i - 1];
        end;
function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;
function min(a, b: longint): longint; inline;
        begin if a < b then min := a else min := b; end;

procedure initV(l, r, k: longint);
        var
                m: longint;
        begin
        if l = r then
                begin
                ITmin[k] := s[l];
                ITL[k] := l;
                ITR[k] := r;
                exit;
                end;
        m := (l + r) shr 1;
        initV(l, m, k * 2);
        initV(m + 1, r, k * 2 + 1);
        ITmin[k] := min(ITmin[k * 2], ITmin[k * 2 + 1]);
        ITL[k] := min(ITL[k * 2], ITL[k * 2 + 1]);
        ITR[k] := max(ITR[k * 2], ITR[k * 2 + 1]);
        end;
procedure GetV(l, r, k: longint);
        var
                m: longint;
        begin
        if (L > Rx) or (Lx > R)
        or (Stmp - ITmin[k] < p) then
                exit;
        if L = R then
                begin
                if ITL[k] < Locate then
                        Locate := ITL[k];
                exit;
                end;
        m := (l + r) shr 1;
        GetV(l, m, k * 2);
        GetV(m + 1, r, k * 2 + 1);
        end;
procedure process;
        var
                i: longint;
        begin
        Lx := 1;
        res := -1;
        if s[1] >= p then
                res := 1;
        for i := 2 to n do
                begin
                Rx := i - 1;
                Locate := maxlongint;
                Stmp := s[i];
                GetV(1, n, 1);
                if Locate <> maxlongint then
                if i - Locate > res then
                        res := i - Locate;
                end;
        writeln(res);
        end;
begin
        enter;
        init;
        initV(1, n, 1);
        process;
end.
