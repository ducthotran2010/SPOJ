const
        inp = 'TRIP.inp';
        out = 'TRIP.out';
        maxn = 100000;
var
        n, e, Count: longint;
        a, Link: array[-maxn..maxn] of longint;
        Last: array[1..maxn] of longint;
        Visited: array[1..maxn] of boolean;
procedure input;
        var
                f: text;
                i, x, y: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        e := n - 1;
        for i := 1 to e do
                begin
                read(f, x, y);
                Link[i] := Last[x];
                Last[x] := i;
                a[i] := x;

                Link[-i] := Last[y];
                Last[y] := -i;
                a[-i] :=y;
                end;
        close(f);
        end;
procedure DFS(s: longint);
        var
                i, k: longint;
        begin
        Visited[s] := true;
        k := Last[s];
        while k <> 0 do
                begin
                if not visited[a[-k]] then
                        begin
                        DFS(a[-k]);
                        end;
                k := Link[k];
                end;
        end;
begin
        input;
        Count := 0;
        DFS(1);
        writeln(Count);
end.
