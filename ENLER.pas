const
        inp = 'EULER.inp';
        out = 'EULER.out';
        maxN = 100;
var
        n, m: longint;
        a: array[1..maxN,1..maxN] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to m do
                begin
                readln(x, y);
                a[x,y] := true;
                a[y,x] := true;
                end;
        close(input);
        end;
procedure process;
        var
                check: boolean;
                Limit, x, y: longint;
                Q: array[1..maxN * maxN] of longint;
        begin
        Limit := 1;
        Q[1] := 1;
        repeat
                x := Q[Limit];
                check := true;
                for y := 1 to n do
                if a[x,y] then
                        begin
                        check := false;
                        a[x,y] := false;
                        a[y,x] := false;
                        Limit := Limit + 1;
                        Q[Limit] := y;
                        break;
                        end;
                if check then
                        begin
                        write(x, ' ');
                        Limit := Limit - 1;
                        end;
        until Limit = 0;
        end;
begin
        enter;
        process;
end.