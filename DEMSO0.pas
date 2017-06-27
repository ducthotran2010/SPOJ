const
        INP = '';
        OUT = '';
var
        res, n, i, j, k: Longint;
begin
        readln(n);
        res := 0;
        for i := 2 to n do
                begin
                j := i;
                k := 2;
                while j <> 1 do
                        begin
                        if j mod k = 0 then
                                begin
                                j := j div k;
                                if k = 5 then
                                        res := res + 1;
                                end
                        else
                                k := k + 1;
                        end;
                end;
        writeln(res);
end.