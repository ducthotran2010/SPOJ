const
        inp='';
        maxn=100000;
var
        n, m, q: longint;
        visited:array [1..maxn] of boolean;
        kind, game, ans: array[1..maxn] of longint;
procedure init;
        var
                i: longint;
        begin
        for i := 1 to n do
                visited[i] := false;
        for i := 1 to n do
                kind[i] := 0;
        for i := 1 to m do
                game[i] := 0;
        end;
procedure input;
        var
                f: text;
                x, y, i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m, q);

        init;

        for i := 1 to n do
                begin
                read(f, x);
                kind[i] := x;      // hoc sinh i thich game x
                game[x] := game[x] + 1;        // tro x co bn ng thich
                end;

        for i := 1 to m do
        if game[i] = 1 then
                begin
                game[i] := 0;
                ans[i] := 0;
                visited[i] := true;
                end;

        for i := 1 to q do
                begin
                read(f, x, y);
                if not visited[x] then
                        begin
                        dec(game[kind[x]]);
                        if game[kind[x]] = 0 then
                                ans[kind[x]] := i;
                        end;
                if not visited[y] then
                        begin
                        dec(game[kind[y]]);
                        if game[kind[y]] = 0 then
                                ans[kind[y]] := i;
                        end;
                visited[y] := true;
                visited[x] := true;
                end;

        for i := 1 to m do
        if game[i] <> 0 then
                ans[i] := -1;

        close(f);
        end;

procedure prinf;
        var
                i: longint;
        begin
        for i := 1 to m do
                writeln(ans[i]);
        end;
begin
        input;
        prinf;
end.