// Status: 70.83/100
var
        n, p, q: int64;
function found:boolean;
        var
                power: longint;
                tmp1, tmp2: int64;
        function ktnt: boolean;
                var
                        i, n: longint;
                begin
                if tmp1 < 2 then
                        exit(false);
                n := trunc(sqrt(tmp1));
                for i := 2 to n do
                if tmp1 mod i = 0 then
                        exit(false);
                exit(true);
                end;
        begin
        for power := 2 to 60 do
                begin
                tmp1 := round(exp(ln(n) / power));
                tmp2 := round(exp(ln(tmp1) * power));
                if tmp2 = n then
                if ktnt then
                        begin
                        p := tmp1;
                        q := power;
                        exit(true);
                        end;
                end;
        exit(false);
        end;
begin
        readln(n);
        if found then
                writeln(p, ' ' ,q)
        else
                writeln(0);
end.
