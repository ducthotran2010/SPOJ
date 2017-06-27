const
        inp = '';
        out = '';
var
        n, res: longint;

function EvenCheck(i: longint): boolean;
        begin exit((not odd(i)) and ((n div i) * i + i shr 1 = n)); end;
function OddCheck(i: longint): boolean;
        begin exit((n mod i = 0) and odd(i)) end;

procedure process;
        var
                i, e, tmp: longint;
        begin
        e := round(sqrt(n));
        for i := 2 to e do
                begin
                tmp := n div i;
                if OddCheck(i) or EvenCheck(i) then
                        begin
                        res := res + 1;
                        end;
                if tmp <= e then
                        continue;
                if EvenCheck(tmp) or (OddCheck(tmp) and (i >= tmp shr 1)) then
                        begin
                        res := res + 1;
                        end;
                end;
        end;
begin
        assign(input, inp);
        reset(input);
        assign(output, out);
        rewrite(output);
        while not eof do
                begin
                readln(n);
                res := 0;
                process;
                writeln(res);
                end;
        close(input);
        close(output);
end.
