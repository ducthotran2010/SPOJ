const
        inp = 'XepHang.inp';
        out = 'XepHang.out';
        maxN = 500 * 1000;
var
        n: longint;
        res: int64;
        ans, a: array[0..maxN] of int64;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(a[i]);
        close(input);
        end;
procedure process;
        var
                i, j, Limit: longint;
                Q: array[0..maxN] of longint;
        begin
        a[0] := high(int64);
        Q[0] := 0;
        Q[1] := 1;
        Limit := 1;
        for i := 2 to n do
                begin
                ans[i] := 0;
                while a[i] > a[Q[Limit]] do
                        begin
                        ans[i] := ans[i] + 1;
                        Limit := Limit - 1;
                        end;
                if (a[Q[Limit]] > a[i]) and (Limit <> 0) then
                        ans[i] := ans[i] + 1
                else
                if a[i] = a[Q[Limit]] then
                        begin
                        j := Limit;
                        while a[i] = a[Q[j]] do
                                begin
                                ans[i] := ans[i] + 1;
                                j := j - 1;;
                                end;
                        if a[Q[j]] > a[i] then
                        if j <> 0 then
                                ans[i] := ans[i] + 1;
                        end;
                Limit := Limit + 1;
                Q[Limit] := i;
                end;
        res := 0;
        for i := 2 to n do
                res := res + ans[i];
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
