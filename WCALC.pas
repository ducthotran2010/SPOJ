const
        inp = '';
var
        b, n: int64;
procedure input;
        var
                f:text;
        begin
        assign(f, inp);
        reset(f);
        readln(f, b, n);
        close(f);
        end;
procedure process;
        var
                m: longint;
        begin
        res := 0;
        for m:= 1 to 2 * n do
        if ((b mod (n * n)) * ((m - n * 2) mod (n * n)) * (m mod (n * n))) mod (n * n)=0 then
        if (b * (m - 2 * n) * m) div (n * n) <> 0 then
                res := res + 1;
        writeln(res);
        end;
begin
        input;
        process;
end.
