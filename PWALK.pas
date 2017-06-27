const
        inp = '';
        out = '';
        maxn = 1000;
var
        g: text;
        intTimeAccess, intTimeClose, n, i, q, x, y: longint;
        visited, f: array[1..maxn] of boolean;
        a: array[1..maxn,1..maxn] of longint;
        arrTimeAccess, arrTimeClose, v: array[1..maxn] of longint;
procedure DFS(s, intV: longint);
        var
                i: longint;
        begin
        v[s] := intV;
        visited[s] := true;
        intTimeAccess := intTimeAccess + 1;
        arrTimeAccess[s] := intTimeAccess;
        for i := 1 to n do
        if a[i,s] <> 0 then
        if not visited[i] then
                DFS(i, v[s] + a[i,s]);
        intTimeClose := intTimeClose + 1;
        arrTimeClose[s] := intTimeClose;
        visited[s] := false;
        end;
function lca(x, y: longint): longint; //O(n^2) - Fuck yeah!!!
        var
                i, j, count, total: longint;
        begin
        total := 0;
        fillchar(f, sizeof(f), false);
        for i := 1 to n do
        // i la cha cua x
        if arrTimeAccess[i] < arrTimeAccess[x] then
        if arrTimeClose[i] > arrTimeClose[x] then
                f[i] := true;
        for i := 1 to n do
        // i la cha cua y
        if arrTimeAccess[i] < arrTimeAccess[y] then
        if arrTimeClose[i] > arrTimeClose[y] then
                begin
                f[i] := true and f[i];
                if f[i] then
                        total := total + 1;
                end;
        for i := 1 to n do
        if f[i] then
                begin
                count := 0;
                for j := 1 to n do
                if f[j] then
                        // j la cha cua i
                        if arrTimeAccess[j] < arrTimeAccess[i] then
                        if arrTimeClose[j] > arrTimeClose[i] then
                                count := count + 1;
                if count = total - 1 then
                        exit(i);
                end;
        exit(1);
        end;
begin
        assign(g, inp);
        reset(g);
        readln(g, n, q);
        for i := 1 to n - 1 do
                begin
                readln(g, x, y, a[x,y]);
                a[y,x] := a[x,y];
                end;
        intTimeClose := 0;
        intTimeAccess := 0;
        DFS(1, 0);
        for i := 1 to q do
                begin
                readln(g, x, y);
                if (arrTimeAccess[x] < arrTimeAccess[y])
                and (arrTimeClose[x] > arrTimeClose[y]) then
                        writeln(v[y] - v[x])
                else
                if (arrTimeAccess[x] > arrTimeAccess[y])
                and (arrTimeClose[x] < arrTimeClose[y]) then
                        writeln(v[x] - v[y])
                else
                        writeln(v[x] + v[y] - 2 * v[lca(x,y)]);
                end;
        close(g);
end.