const
        INP = 'ZUMA.inp';
        MAXN = 100;
var
        c: Char;
        res, n, k: Longint;
        s: AnsiString;
procedure process;
        var
                kL, kR: Longint;
        begin
        res := 0;
        insert(c, s, k);
        kL := k;
        kR := k;
        while (kL > 1) and (s[kL - 1] = c) do
                kL := kL - 1;
        while (kR < length(s)) and (s[kR + 1] = c) do
                kR := kR + 1;
        if kR - kL + 1 >= 3 then
                begin
                res := res + kR - kL + 1;
                delete(s, kL, kR - kL + 1);
                end;
        if res <> 0 then
        while (k > 1) and (s <> '') do
                begin
                k := kL;
                if s[k] = s[k - 1] then
                        begin
                        c := s[k];
                        kL := k;
                        kR := k;
                        while (kL > 1) and (s[kL - 1] = c) do
                                kL := kL - 1;
                        while (kR < length(s)) and (s[kR + 1] = c) do
                                kR := kR + 1;
                        if kR - kL + 1 >= 3 then
                                begin
                                res := res + kR - kL + 1;
                                delete(s, kL, kR - kL + 1);
                                end;
                        end
                else
                        break;
                end;
        end;
begin
        assign(input, INP);
        reset(input);
        readln(n);
        readln(s);
        readln(k, c, c);
        close(input);
        process;
        writeln(res);
end.
