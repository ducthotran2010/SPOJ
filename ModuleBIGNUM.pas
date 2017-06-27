const
        maxV = 1000 * 1000 * 1000 * 1000 * 1000;
var
        a, b, c: int64;
begin
        // (a * b) mod c
        a := maxV;
        b := a;
        writeln(a * b);
        writeln(maxV);
end.