const
        inp = '';
        out = '';
        base = 26;
        hased = 100003;
var
        s: string;
        i, j, k, n, x, e, Tmp, res: longint;
        d: array[0..Hased - 1] of boolean;
begin
        assign(input, inp);
        reset(input);
        readln(k);
        res := 0;
        for i := 1 to k do
                begin
                readln(n);
                for j := 1 to n do
                        begin
                        readln(s);
                        Tmp := 0;
                        e := length(s);
                        for x := 1 to e do
                                Tmp := (Tmp * base + ord(s[x])) mod Hased;
                        if not d[Tmp] then
                                res := res + 1;
                        d[Tmp] := true;
                        end;
                end;
        close(input);
        writeln(res);
end.