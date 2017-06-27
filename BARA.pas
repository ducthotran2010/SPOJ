var
        n, k, res: int64;
begin
        readln(n, k);
        if 2 * n <= k then
                res := 2
        else
                begin
                res := (2 * n) div k;
                if (2 * n) mod k <> 0 then
                        res := res + 1;
                end;
        writeln(res * 5);
end.