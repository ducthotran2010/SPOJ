const
        inp = '';
        out = '';
        maxN = 200;
var
        n, m: longint;
        a: array[1..maxN,1..maxN] of longint;
procedure enter;
        var
                i, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, m);
        for i := 1 to n do
                readln(x);
        for i := 1 to m do
                begin
                readln(x, y);
                a[x,y] := a[x,y] + 1;
                a[y,x] := a[y,x] + 1;
                end;
        close(input);
        end;
procedure process;
        var
                check: boolean;
                Limit, i, j: longint;
                Q: array[1..maxN * maxN] of longint;
        begin
        Limit := 1;
        Q[1] := 1;
        writeln(m);
        repeat
                i := Q[Limit];
                check := true;
                for j := 1 to n do
                if a[i,j] > 0 then
                        begin
                        Limit := Limit + 1;
                        Q[Limit] := j;
                        a[i,j] := a[i,j] - 1;
                        a[j,i] := a[j,i] - 1;
                        check := false;
                        break;
                        end;
                if check then
                        begin
                        write(i, ' ');
                        Limit := Limit - 1;
                        end;
        until Limit = 0;
        end;
begin
        enter;
        process;
end.