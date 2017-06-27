const
        inp = 'FROGS.inp';
        out = 'FROGS.out';
        maxN = 1000 * 1000;
var
        n: longint;
        ans, j, a: array[0..maxN + 1] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                read(a[i]);
        for i := 1 to n do
                read(j[i]);
        close(input);
        end;
procedure process;
        var
                Limit, i: longint;
                Q: array[0..maxN] of longint;
        begin
        a[n + 1] := maxlongint;
        Q[0] := n + 1;
        Limit := 0;
        for i := n downto 1 do
                begin
                while a[i] >= a[Q[Limit]] do
                        Limit := Limit - 1;
                Limit := Limit + 1;
                Q[Limit] := i;
                if j[i] >= Limit then
                        ans[i] := -1
                else
                        ans[i] := a[Q[Limit - j[i]]];
                end;
        end;
procedure prinf;
        var
                i: longint;
        begin
        assign(output, out);
        rewrite(output);
        for i := 1 to n do
                write(ans[i], #32);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
