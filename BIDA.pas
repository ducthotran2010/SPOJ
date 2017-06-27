var
        x, y, n, m, k, xr, yr, tmp: int64;
begin
        readln(n, m, y, x, k);
        yr := ((y + k - 1) mod (n - 1));
        if yr = 0 then
                yr := n - 1;
        tmp := (y + k - 1) div (n - 1);
        if (y + k - 1) mod (n - 1) <> 0 then
                tmp := tmp + 1;
        if tmp and 1 = 0 then
                yr := n - yr
        else
                yr := yr + 1;

        xr := ((x + k - 1) mod (m - 1));
        if xr = 0 then
                xr := m - 1;
        tmp := (x + k - 1) div (m - 1);
        if (x + k - 1) mod (m - 1) <> 0 then
                tmp := tmp + 1;
        if tmp and 1 = 0 then
                xr := m - xr
        else
                xr := xr + 1;
        writeln(yr, #32, xr);
end.