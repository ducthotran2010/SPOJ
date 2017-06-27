const
        inp = 'CALC.inp';
        out = 'CALC.out';
var
        b, n: int64;
        res: qword;
procedure input;
        var
                f: text;
        begin
        assign(f, inp);
        reset(f);
        readln(f, b, n);
        close(f);
        end;
procedure process;
        var
                Tmp: int64;
                m, e: longint;
        begin
        res := 0;
        e := n * 2;
        for m := 1 to e do
        if m <> n then
                begin
                Tmp := b * m * (2 * n - m);
                if Tmp mod (n * n) = 0 then
                        res := res + 1;
                end;
        end;
procedure prinf;
        var
                f: text;
        begin
        assign(f, out);
        rewrite(f);
        writeln(f, res);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
