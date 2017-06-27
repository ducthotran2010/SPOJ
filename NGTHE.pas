const
        inp = 'NGTHE.inp';
        maxV = 100 * 1000;
        maxN = 100 * 1000;
var
        res: int64;
        i, n, maxVc: longint;
        BIT: array[0..maxV] of longint;
        a: array[1..maxN] of longint;
procedure update(u: longint);
        begin
        while u <= maxVc do
                begin
                BIT[u] := BIT[u] + 1;
                u := u + u and -u;
                end;
        end;
function GetBIT(u: longint): longint;
        var
                res: longint;
        begin
        res := 0;
        while u > 0 do
                begin
                res := res + BIT[u];
                u := u - u and -u;
                end;
        exit(res);
        end;
begin
        //assign(input, inp);
        //reset(input);
        readln(n);
        maxVc := 0;
        for i := 1 to n do
                begin
                read(a[i]);
                if a[i] > maxVc then
                        maxVc := a[i];
                end;
        //close(input);
        res := 0;
        for i := n downto 1 do
                begin
                res := res + GetBIT(a[i] - 1);
                update(a[i]);
                end;
        writeln(res);
end.