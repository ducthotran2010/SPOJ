const
        inp = 'YUGI.inp';
        out = 'YUGI.out';
        maxn = 200;
var
        n, k, lonMaxV, res: longint;
        a: array [1..maxn, 1..maxn] of longint;
        visited: array[1..maxn] of boolean;
        queue: array [1..maxn] of longint;
procedure input;
        var
                f: text;
                i, j: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, k);
        lonMaxV := 0;
        for i:= 1 to n do
        for j:= 1 to n do
                begin
                read(f, a[i,j]);
                if a[i,j] > lonMaxV then
                        lonMaxV := a[i,j];
                end;
        close(f);
        end;

function funCheck(lonMaxVT: longint): boolean;
        var
                l, r, i, u, lonNumGroup: longint;
                booEmpty: boolean;
        begin

        lonNumGroup := 0;
        fillchar(visited, sizeof(visited), false);

        repeat
        l := 0;
        r := 1;
        booEmpty := true;
        for i:= 1 to n do
        if not visited[i] then
                begin
                queue[1] := i;
                visited[i] := true;
                booEmpty := false;
                break;
                end;
        if not booEmpty then
                begin
                repeat
                        l := l + 1;
                        u := queue[l];
                        for i:= 1 to n do
                        if not visited[i] then
                        if i <> u then
                        if a[u,i] < lonMaxVT then
                                begin
                                r := r + 1;
                                queue[r] := i;
                                visited[i] := true;
                                end;

                until l >= r;
                lonNumGroup := lonNumGroup + 1;
                end
        else
        if lonNumGroup < k then
                exit(false);

        until booEmpty;

        exit(true);

        end;
procedure process;
        var
                r, l: longint;
        begin
        l := 1;
        r := lonMaxV;
        repeat
                if not funCheck((l + r) div 2) then
                        r := (l + r) div 2 - 1
                else
                        begin
                        res := (l + r) div 2;
                        l := (l + r) div 2 + 1;
                        end;
        until l >= r;
        if funCheck(l) then
                res := l;
        writeln(res);
        end;
begin
        input;
        process;
end.