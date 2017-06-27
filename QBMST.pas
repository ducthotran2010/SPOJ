const
        inp = '';
        out = '';
        maxn = 10000;
        maxm = 15000;
type
        arr = record
                l, v: longint;
                end;
var
        tmp: arr;
        n, res, m: longint;
        v: array[1..maxn] of arr;
        w: array[1..maxm] of longint;
        d: array[1..maxn] of boolean;
        link, a: array[-maxm..maxm] of longint;
        last, locate: array[1..maxn] of longint;
procedure enter;
        var
                i, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to m do
                begin
                readln(x, y, w[i]);
                a[i] := x;
                link[i] := last[x];
                last[x] := i;
                a[-i] := y;
                link[-i] := last[y];
                last[y] := -i;
                end;
        close(input);
        end;
procedure UpHeap(k: longint);
        begin
        Locate[v[k].l] := k shr 1;
        Locate[v[k shr 1].l] := k;
        tmp := v[k];
        v[k] := v[k shr 1];
        v[k shr 1] := tmp;
        k := k shr 1;
        if k > 1 then
        if v[k].v < v[k shr 1].v then
                Upheap(k);
        end;
function checkdown(k: longint): longint; inline;
        var
                Flag: longint;
        begin
        Flag := -1;
        if k * 2 <= n then
        if v[k].v > v[k * 2].v then
                Flag := 0;
        if k * 2 + 1 <=n then
        if ((v[k].v > v[k * 2 + 1].v) and (Flag = -1))
        or ((v[k * 2].v > v[k * 2 + 1].v) and (Flag = 0)) then
                Flag := 1;
        exit(Flag);
        end;
procedure DownHeap(k: longint);
        begin
        Locate[v[k].l] := k shr 1;
        Locate[v[k shr 1].l] := k;
        tmp := v[k];
        v[k] := v[k shr 1];
        v[k shr 1] := tmp;
        if checkdown(k) <> - 1 then
                DownHeap(k * 2 + checkdown(k));
        end;
procedure process;
        var
                i0, i, ng: longint;
        procedure init;
                var
                        i, k: longint;
                begin
                for i := 1 to n do
                        begin
                        v[i].l := i;
                        v[i].v := maxlongint;
                        d[i] := false;
                        Locate[i] := i;
                        end;
                d[1] := true;
                k := last[1];
                while k <> 0 do
                        begin
                        v[Locate[a[-k]]].v := w[abs(k)];
                        k := link[k];
                        end;
                for i := n downto 2 do
                if v[i].v < v[i shr 1].v then
                        begin
                        Locate[v[i].l] := i shr 1;
                        Locate[v[i shr 1].l] := i;
                        tmp := v[i];
                        v[i] := v[i shr 1];
                        v[i shr 1] := tmp;
                        if checkdown(i) <> -1 then
                                DownHeap(i * 2 + checkdown(i));
                        end;
                end;
                procedure getMin;
                        begin
                        i0 := v[1].l;
                        d[i0] := true;
                        res := res + v[1].v;
                        Locate[v[1].l] := n;
                        Locate[v[n].l] := 1;
                        v[1] := v[n];
                        n := n - 1;
                        if checkdown(1) <> -1 then
                                DownHeap(2 + checkdown(1));
                        end;
                procedure editLabel;
                        var
                                k: longint;
                        begin
                        k := last[i0];
                        while k <> 0 do
                                begin
                                if not d[a[-k]] then
                                if v[Locate[a[-k]]].v > w[abs(k)] then
                                        begin
                                        v[Locate[a[-k]]].v := w[abs(k)];
                                        if Locate[a[-k]] > 1 then
                                        if v[Locate[a[-k]]].v < v[Locate[a[-k]] shr 1].v then
                                                UpHeap(Locate[a[-k]]);
                                        end;
                                k := link[k];
                                end;
                        end;
        begin
        init;
        res := 0;
        ng := n;
        for i := 2 to ng do
                begin
                getMin;
                editLabel;
                end;
        writeln(res);
        end;
begin
        enter;
        process;
end.