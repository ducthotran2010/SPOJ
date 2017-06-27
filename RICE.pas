const
        inp = 'RICE.inp';
        out = 'RICE.out';
        maxn = 5000;
var
        MinMode: boolean;
        n, T, res: longint;
        a, F: array [1..maxn] of longint;
        ITminL, ITmaxL: array[1..maxn * 4] of longint;
function minL(i, j: longint): longint;
        begin if a[i] < a[j] then exit(i) else exit(j) end;
function maxL(i, j: longint): longint;
        begin if a[i] > a[j] then exit(i) else exit(j) end;

procedure InitV(l, r, k: longint);
        var
                m: longint;
        begin
        if l = r then
                begin
                ITminL[k] := l;
                ITmaxL[k] := l;
                exit;
                end;
        m := (l + r) div 2;
        InitV(l, m, k * 2);
        InitV(m + 1, r, k * 2 + 1);
        ITminL[k] := minL(ITminL[k * 2], ITminL[k * 2 + 1]);
        ITmaxL[k] := maxL(ITmaxL[k * 2], ITmaxL[k * 2 + 1]);
        end;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, T);
        for i:= 1 to n do
                read(f, a[i]);
        InitV(1, n, 1);
        close(F);
        end;
procedure GetV(l, r, k, x, y: longint);
        var
                m: longint;
        begin
        if (y < l) or (x > r) then
                exit;
        if (x <= l) and (r <= y) then
                begin
                if MinMode then
                if a[res] > a[ITminL[k]] then
                        res := ITminL[k];
                if not MinMode then
                if a[res] < a[ITmaxL[k]] then
                        res := ITmaxL[k];
                exit;
                end;
        m := (l + r) div 2;
        GetV(l, m, k * 2, x, y);
        GetV(m + 1, r, k * 2, x, y);
        end;
procedure process;
        var
                intLoMax, intLoMin, intLMaxT, intLMinT, i: longint;
        function max(a, b: longint): longint; inline;
                begin if a > b then max := a else max := b; end;
        begin
        intLoMin := 1;
        intLoMax := 1;
        intLMinT := 1;
        intLMaxT := 1;
        F[1] := 1;
        for i := 2 to n do
                begin
                if a[i] >= a[intLoMax] then
                        intLoMax := i;
                if a[i] <= a[intLoMin] then
                        intLoMin := i;
                if  (a[i] > a[i - F[i - 1]])
                and (a[i] - a[intLoMin] > T) then
                        begin
                        F[i] := i - intLoMin;
                        intLoMax := max(intLoMax, intLoMin + 1);
                        res := intLoMin + 1;
                        MinMode := true;
                        GetV(1, n, 1, intLoMin + 1, i);
                        intLoMin := res;
                        end
                else
                if  (a[i] < a[i - F[i - 1]])
                and (a[intLoMax] - a[i] > T) then
                        begin
                        F[i] := i - intLoMax;
                        intLoMin := max(intLoMin, intLoMax + 1);
                        res := intLoMax + 1;
                        MinMode := false;
                        GetV(1, n, 1, intLoMax + 1, i);
                        intLoMax := res;
                        end
                else
                        F[i] := F[i - 1] + 1;
                end;
        writeln(F[n]);
        end;
begin
        input;
        process;
end.
