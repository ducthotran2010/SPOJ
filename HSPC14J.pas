const
        inp = '';
        out = '';
        maxN = 1000;
var
        Found: boolean;
        i, j, n, k, Count: longint;
        d: array[1..maxN] of boolean;
begin
        assign(input, inp);
        reset(input);
        while not seekeof do
                begin
                readln(n, k);
                fillchar(d, sizeof(d), false);
                Count := 0;
                i := 2;
                Found := false;
                repeat
                        j := i;
                        while (j <= n) and (not Found) do
                                begin
                                if d[j] = false then
                                        begin
                                        Count := Count + 1;
                                        if Count = k then
                                                begin
                                                writeln(j);
                                                Found := true;
                                                end;
                                        end;
                                d[j] := true;
                                j := j + i;
                                end;
                        if Found then
                                break;
                        i := i + 1;
                until i > n;
                end;
end.