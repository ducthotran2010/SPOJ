const
        s = '()';
        a: array[1..2] of longint = (1, -1);
var
        tmpS: string;
        tmpC, k, n: longint;
procedure try(i: longint);
        var
                j: longint;
        begin
        for j := 1 to 2 do
                begin
                tmpS := tmpS + s[j];
                tmpC := tmpC + a[j];
                if tmpC >= 0 then
                if i < n then
                        try(i + 1)
                else
                if tmpC = 0 then
                        begin
                        writeln(tmpS);
                        k := k + 1;
                        end;
                tmpC := tmpC - a[j];
                tmpS := copy(tmpS, 1, length(tmpS) - 1);
                end;
        end;
begin
        readln(n);
        k := 0;
        try(1);
        writeln(k);
end.