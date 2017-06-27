const
        MaxV = 1 shl 31;
var
        x1: real;
        exced: boolean;
        res1, res2, a1, a2, b1, b2, x2, Delta: int64;
procedure exc;
        var
                tmp: int64;
        begin
        exced := true;
        tmp := a1;
        a1 := a2;
        a2 := tmp;
        tmp := b1;
        b1 := b2;
        b2 := tmp;
        end;
begin
        readln(a1,b1,a2,b2);
        Delta := high(int64);
        if b2 > b1 then
                exc;
        x2 := (b1 - b2) div a2 - 1;
        while x2 < maxV do
                begin
                x2 := x2 + 1;
                x1 := a2 * x2 / a1 + b2 / a1 - b1 / a1;
                if (x2 + x1 > Delta) or (abs(x1 - x2) < 0) then
                        break;
                if trunc(x1) = x1 then
                if x1 > 0 then
                if x1 + x2 < Delta then
                        begin
                        res1 := trunc(x1);
                        res2 := x2;
                        Delta := res1 + res2;
                        end;
                end;
        if not exced then
                writeln(res1, ' ', res2)
        else
                writeln(res2, ' ', res1);
end.
