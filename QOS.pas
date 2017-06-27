const
        inp = 'QOS.inp';
        out = '';
        maxn = 1000;
        maxm = 100000;
var
        Cant, found: boolean;
        intTmpV, Cmin, Tmin, n, m, e, k: longint;
        Last, v: array[1..maxn] of longint;
        Link, Cost: array[1..maxm] of longint;
        a: array[-maxm..maxm] of longint;
        d, visited: array[1..maxn] of boolean;
        F: array[1..maxn,1..maxn] of longint;
        Ans:array[0..maxn] of longint;
procedure input;
        var
                f: text;
                i, x, y, c: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m, e, k);
        for i := 1 to m do
                begin
                read(f, x, y, c);
                a[i] := x;
                Cost[i] := c;
                a[-i] := y;
                link[i] := last[x];
                last[x] := i;
                if c < Cmin then
                        Cmin := c;
                end;
        close(f);
        end;
procedure Dijkstra;
        var
                i, j, k, min: longint;
        begin
        for i := 1 to n do
                begin
                d[i] := false;
                v[i] := maxlongint;
                end;
        d[1] := true;
        v[1] := 0;
        k := last[1];
        while k <> 0 do
                begin
                v[a[-k]] := cost[k];
                k := link[k];
                end;
        repeat
                min := maxlongint;
                j := 0;
                for i := 1 to n do
                if not d[i] then
                if min > v[i] then
                        begin
                        min := v[i];
                        j := i;
                        end;
                if j = 0 then
                        break;
                d[j] := true;
                k := last[j];
                while k <> 0 do
                        begin
                        if not d[a[-k]] then
                        if v[a[-k]] > v[j] + cost[k] then
                                v[a[-k]] := v[j] + cost[k];
                        k := link[k];
                        end;
        until d[e];
        Tmin := v[e];
        end;
procedure DFSC(s, deep: longint);
        var
                k: longint;
        begin
        visited[s] := true;
        k := last[s];
        while k <> 0 do
                begin
                intTmpV := intTmpV + Cost[k];
                if intTmpV < Tmin + Cmin then
                if not visited[a[-k]] then
                        begin
                        if a[-k] = e then
                                F[s, 1] := 1
                        else
                                begin
                                DFSC(a[-k], deep + 1);
                                F[s,
                        end;
                F[s, deep] := F[a[-k], deep + 1] + F[s, deep];
                intTmpV := intTmpV - Cost[k];
                k := link[k];
                end;
        visited[s] := false;
        end;
function intNumCase: longint;
        var
                tmp, i: longint;
        begin
        tmp := 0;
        for i := 1 to n do
                begin
                tmp := tmp + F[1,i];
                if tmp >= k then
                        exit(tmp);
                end;
        exit(0);
        end;
procedure Trace(s: longint);
        var
                k, deep: longint;
        begin
        Ans[0] := Ans[0] + 1;
        Ans[Ans[0]] := s;
        if s = e then
                begin
                found := true;
                exit;
                end;
        for deep := 1 to n do
                begin
                k := last[s];
                while (k <> 0) and (not found) do
                        begin
                        if k > F[s,deep] then
                                k := k - F[s,deep]
                        else
                                Trace(a[-k]);
                        k := link[k];
                        end;
                end;
        end;
procedure prinf;
        var
                f: text;
                i: longint;
        begin
        assign(f, out);
        rewrite(f);
        if Cant then
                writeln(f, -1)
        else
                begin
                writeln(f, Ans[0]);
                for i := 1 to Ans[0] do
                        write(f, Ans[i], ' ');
                end;
        close(f);
        end;
begin
        Cant := false;
        Cmin := maxlongint;
        input;
        Dijkstra;
        if d[e] then
                begin
                intTmpV := 0;
                DFSC(1, 1);
                found := false;
                if intNumCase < k then
                        Cant := true
                else
                        Trace(1);
                end
        else
                Cant := true;
        prinf;
end.
