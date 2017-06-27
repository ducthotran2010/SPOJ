var
        x, y, i: Longint;
begin
        randomize;
        assign(output, 'DQUERY.inp');
        rewrite(output);
        writeln(10);
        for i := 1 to 10 do
                write(1 + random(10), #32);
        writeln;
        writeln(5);
        for i := 1 to 5 do
                begin
                x := random(10) + 1;
                y := random(10 - x) + x;
                writeln(x, #32, y);
                end;
        close(output);
end.
