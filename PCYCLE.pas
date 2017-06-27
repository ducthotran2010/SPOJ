const
        inp = 'PCYCLE.inp';
        out = '';
        maxN = 200;
        maxM = maxN * maxN;
        NoPath = low(longint);
var
        n, m: longint;
        a, b: array[1..maxN,1..maxN] of longint;
        Path: array[1..maxM] of longint;
procedure enter;
        var
                i, x, y, v: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for x := 1 to n do
        for y := 1 to n do
                begin
                a[x,y] := NoPath;
                b[x,y] := NoPath;
                end;
        for i := 1 to m do
                begin
                readln(x, y, v);
                a[x,y] := v;
                a[y,x] := v;
                b[x,y] := v;
                b[y,x] := v;
                end;
        close(input);
        end;
function FoundPath(s: longint): boolean;
        var
                check: boolean;
                x, y, Limit, Count: longint;
                Q: array[1..maxM] of longint;
        begin
        Q[1] := s;
        Limit := 1;
        Count := m + 1;
        repeat
                x := Q[Limit];
                check := true;
                for y := 1 to n do
                if a[x,y] <> NoPath then
                        begin
                        a[x,y] := NoPath;
                        a[y,x] := NoPath;
                        Limit := Limit + 1;
                        Q[Limit] := y;
                        check := false;
                        break;
                        end;
                if check then
                        begin
                        Path[Count] := x;
                        Count := Count - 1;
                        Limit := Limit - 1;
                        end;
        until Limit = 0;
        exit(Count = 0);
        end;
procedure process;
        var
                i, min, sum, located: longint;
        begin
        sum := 0;
        min := high(longint);
        located := 1;
        for i := 2 to m + 1 do
                begin
                sum := sum + b[Path[i - 1],Path[i]];
                if sum < min then
                        begin
                        min := sum;
                        located := i;
                        end;
                end;
        if sum < 0 then
                begin
                write(-1);
                exit;
                end;
        //------Chieu Thuan------
        sum := 0;
        for i := located to m do
                begin
                sum := sum + b[Path[i],Path[i + 1]];
                if sum < 0 then
                        break;
                end;
        if sum >= 0 then
        for i := 1 to located - 1 do
                begin
                sum := sum + b[Path[i],Path[i + 1]];
                if sum < 0 then
                        break;
                end;
        if sum >= 0 then
                begin
                for i := located to m do
                        write(Path[i], ' ');
                for i := 1 to located do
                        write(Path[i], ' ');
                exit;
                end;
        write(-1);
        end;
begin
        enter;
        if FoundPath(1) then
                process
        else
                write(-1);
end.
