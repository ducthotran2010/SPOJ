const
        inp = 'SEARCH.inp';
        out = 'SEARCH.out';
        maxn = 100000;
var
        n, intRN, m, q, res: longint;
        AMark, BMark, CMark: array[1..maxn] of boolean;
        a, c, Queue: array[1..maxn] of longint;
procedure input;
        var
                f: text;
                i, x: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m, q);
        intRN := 0;
        for i := 1 to n do
                begin
                intRN := intRN + 1;
                read(f, a[intRN]);
                if not AMark[a[intRN]] then
                        AMark[a[intRN]] := true
                else
                        intRN := intRN - 1;
                end;
        for i := 1 to m do
                begin
                read(f, x);
                BMark[x] := true;
                end;
        for i := 1 to q do
                read(f, c[i]);
        close(f);
        end;
procedure process;
        var
                booCheck: boolean;
                i, j, k, top: longint;
        function Check:boolean;
                var
                        j: longint;
                begin
                for j := 1 to intRN do
                if not CMark[a[j]] then
                        exit(false);
                exit(true);
                end;
        begin
        k := 1;
        res := 0;
        top := 0;
        for i := 1 to q do
        if not BMark[c[i]] then
                begin
                if not CMark[c[i]] then
                        begin
                        top := top + 1;
                        Queue[top] := c[i];
                        CMark[c[i]] := true;
                        end;
                end
        else
                begin
                if i - k >= intRN then
                if Check then
                if i - k > res then
                        res := i - k;
                k := i + 1;
                for j := 1 to top do
                        CMark[Queue[j]] := false;
                end;
        if Check then
        if q - k + 1 > res then
                res := q - k + 1;
        end;
procedure prinf;
        var
                f: text;
        begin
        assign(f, out);
        rewrite(f);
        writeln(f, res);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.