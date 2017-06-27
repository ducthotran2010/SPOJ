const
        inp = '';
        out = '';
        maxL = 9;
        maxQ = 986409;
var
        n, Tmp, L, res, Limit: longint;
        Q: array[1..maxQ] of longint;
        Used: array[1..maxL] of boolean;
procedure try(i: longint);
        var
                j: longint;
        begin
        for j := 1 to 9 do
        if not Used[j] then
                begin
                Used[j] := true;
                Tmp := Tmp * 10 + j;
                if i < L then
                        try(i + 1)
                else
                        begin
                        inc(Limit);
                        Q[Limit] := Tmp;
                        end;
                Tmp := (Tmp - j) div 10;
                Used[j] := false;
                end;
        end;
procedure init;
        begin
        Tmp := 0;
        Limit := 0;
        for L := 1 to maxL do
                try(1);
        end;
procedure BinarySearch;
        var
                L, R, m: longint;
        begin
        L := 1;
        R := Limit;
        repeat
                m := (L + R) shr 1;
                if n < Q[m] then
                        begin
                        res := Q[m];
                        r := m - 1;
                        end
                else

                        l := m + 1;
        until L > R;
        end;
begin
        init;
        assign(input, inp);
        reset(input);
        while not seekeof do
                begin
                readln(n);
                res := 0;
                BinarySearch;
                writeln(res);
                end;
        close(input);
end.
