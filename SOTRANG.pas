const
        inp = 'SOTRANG.inp';
        out = 'SOTRANG.out';
var
        n: longint;
        d: array[0..9] of int64;
procedure enter;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        close(input);
        end;
procedure process;
        var
                i, j : longint;
        begin
        for i := 1 to n do
                begin
                j := i;
                while j <> 0 do
                        begin
                        d[j mod 10] := d[j mod 10] + 1;
                        j := j div 10;
                        end;
                end;
        end;
procedure printf;
        var
                i: longint;
        begin
        assign(output, out);
        rewrite(output);
        For i := 0 to 9 do
                Writeln(i, #32, d[i]);
        close(output);
        end;
begin
        enter;
        process;
        printf;
end.
