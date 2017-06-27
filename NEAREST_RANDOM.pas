const
        out = 'NEAREST.inp';
        N = 10;
        maxV = 10;
var
        i: longint;
begin
        randomize;
        assign(output, out);
        rewrite(output);
        writeln(N);
        for i := 1 to n do
                writeln(random(maxV) - random(maxV), #32, random(maxV) - random(maxV));
        close(output);
end.