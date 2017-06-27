const
        inp = '';
var
        a, b, c: int64;
begin
        assign(input, inp);
        reset(input);
        while not seekeof do
                begin
                readln(a, b, c);
                writeln(a + b + c);
                end;
        close(input);
end.