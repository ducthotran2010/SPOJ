const
        inp = '';
        out = '';
        maxn = 10;
        maxm = 2222;
        maxintN = maxn * maxm + 1;
        maxintM = maxn * maxm * 2;
type
        arr = record
                l, v: longint;
                end;
var
        tmp: arr;
        m, n, intM, intN, LimitVarr: longint;
        a, link: array[-maxintM..maxintM] of longint;
        w: array[1..maxintM] of longint;
        last: array[1..maxintM] of longint;
        d: array[1..maxintN] of boolean;
        v: array[1..maxintN] of arr;
        Locate: array[1..maxintN] of longint;
procedure input;
        var
                f: text;
                x, v, m2, n2: longint;
        procedure BuildFirstRow;
                var
                        i: longint;
                begin
                intM := 0;
                for i := 2 to n + 1 do
                        begin
                        read(f, v);
                        intM := intM + 1;
                        a[intM] := 1;
                        link[intM] := last[1];
                        last[1] := intM;
                        a[-intM] := i;
                        link[-intM] := last[i];
                        last[i] := -intM;
                        w[intM] := v;
                        end;
                for i := 2 to n do
                        begin
                        read(f, v);
                        intM := intM + 1;
                        a[intM] := i;
                        link[intM] := last[i];
                        last[i] := intM;
                        a[-intM] := i + 1;
                        link[-intM] := last[i + 1];
                        last[i + 1] := -intM;
                        w[intM] := v;
                        end;
                end;
        procedure BuildOtherRow;
                var
                        i, j: longint;
                begin
                m2 := m - 1;
                n2 := n - 1;
                for i := 1 to m2 do
                        begin
                        intN := i * n + 2;
                        for j := 1 to n do
                                begin
                                read(f, v);
                                intM := intM + 1;
                                a[intM] := intN;
                                link[intM] := last[intN];
                                last[intN] := intM;
                                a[-intM] := intN - n;
                                link[-intM] := last[intN - n];
                                last[intN - n] := -intM;
                                intN := intN + 1;
                                w[intM] := v;
                                end;
                        intN := i * n + 2;
                        for j := 1 to n2 do
                                begin
                                read(f, v);
                                intM := intM + 1;
                                a[intM] := intN;
                                link[intM] := last[intN];
                                last[intN] := intM;
                                a[-intM] := intN + 1;
                                link[-intM] := last[intN + 1];
                                last[intN + 1] := -intM;
                                intN := intN + 1;
                                w[intM] := v;
                                end;

                        end;
                end;
        begin
        assign(f, inp);
        reset(f);
        readln(f, m, n);
        BuildFirstRow;
        BuildOtherRow;
        n := m * n + 1;
        m := intM;
        close(f);
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
                UpHeap(k);
        end;
procedure DownHeap(k: longint);
        var
                Flag: longint;
        begin
        Locate[v[k].l] := k shr 1;
        Locate[v[k shr 1].l] := k;
        tmp := v[k];
        v[k] := v[k shr 1];
        v[k shr 1] := tmp;
        Flag := -1;
        if k * 2 <= LimitVarr then
        if v[k].v > v[k * 2].v then
                Flag := 0;
        if k * 2 + 1 <= LimitVarr then
        if ((v[k].v > v[k * 2 + 1].v) and (Flag = -1))
        or ((v[k * 2].v > v[k * 2 + 1].v) and (Flag = 0)) then
                Flag := 1;
        if Flag <> -1 then
                DownHeap(k * 2 + Flag);
        end;
procedure Dijkstra;
        var
                i0, Flag: longint;
        procedure init;
                var
                        i, k: longint;
                begin
                for i := 1 to n do
                        begin
                        v[i].v := maxlongint;
                        v[i].l := i;
                        d[i] := false;
                        Locate[i] := i;
                        end;
                d[1] := true;
                k := last[1];
                while k <> 0 do
                        begin
                        v[a[-k]].v := w[k];
                        k := link[k];
                        end;
                LimitVarr := n;
                for i := n downto 2 do
                if v[i].v < v[i shr 1].v then
                        begin
                        Locate[v[i].l] := i shr 1;
                        Locate[v[i shr 1].l] := i;
                        tmp := v[i];
                        v[i] := v[i shr 1];
                        v[i shr 1] := tmp;
                        end;
                end;
        procedure FindMin;
                var
                        tmp: arr;
                        i, min: longint;
                begin
                i0 := v[1].l;
                d[i0] := true;
                end;
        procedure EditLabel;
                var
                        k: longint;
                begin
                k := last[i0];
                while k <> 0 do
                        begin
                        if not d[a[-k]] then
                        if v[Locate[a[-k]]].v > v[Locate[i0]].v + w[abs(k)] then
                                begin
                                v[Locate[a[-k]]].v := v[Locate[i0]].v + w[abs(k)];
                                if Locate[a[-k]] > 1 then
                                if Locate[a[-k]] <= LimitVarr then
                                if v[Locate[a[-k]]].v < v[Locate[a[-k]] shr 1].v then
                                        UpHeap(Locate[a[-k]]);
                                end;
                        k := link[k];
                        end;
                end;
        begin
        init;
        repeat
                FindMin;
                Locate[v[1].l] := LimitVarr;
                Locate[v[LimitVarr].l] := 1;
                tmp := v[1];
                v[1] := v[LimitVarr];
                v[LimitVarr] := tmp;
                LimitVarr := LimitVarr - 1;
                Flag := -1;
                if 2 <= LimitVarr then
                if v[1].v > v[2].v then
                        Flag := 0;
                if 3 <= LimitVarr then
                if ((v[1].v > v[3].v) and (Flag = -1))
                or ((v[2].v > v[3].v) and (Flag = 0)) then
                        Flag := 1;
                if Flag <> -1 then
                        DownHeap(2 + Flag);
                EditLabel;
        until d[n];
        end;
begin
        input;
        Dijkstra;
        writeln(v[Locate[n]].v);
end.
