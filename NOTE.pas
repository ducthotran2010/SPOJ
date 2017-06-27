const
        inp = '';
        maxF = 31;
        U = 85;
        D = 68;
var
        tmp, res, f, p: longint;
procedure GetV(L, R, Lv, Rv, k: longint);
        var
                m, mV: longint;
        begin
        if (Lv + Rv) shr 1 = p then
                begin
                res := k;
                exit;
                end;
        m := (l + r) shr 1;
        mV := (Lv + Rv) shr 1;
        if (Lv <= p) and (p <= mV) then
                begin
                GetV(l, m, Lv, mV, U);
                exit;
                end;
        GetV(m + 1, r, mV + 1, Rv, D);

        end;
begin
        assign(input, inp);
        reset(input);
        repeat
                readln(f, p);
                if f <> 0 then
                        begin
                        res := 0;
                        tmp := 1 shl f - 1;
                        GetV(1, (1 + tmp) shr 1, 1, tmp, D);
                        writeln(chr(res));
                        end;
        until f = 0;
        close(input);
end.