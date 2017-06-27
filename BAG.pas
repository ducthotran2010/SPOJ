const
        inp = 'BAG.inp';
        out = '';
        maxn = 1000;
var
        m, n, res: longint;
        w, v, Fv, Fw: array[0..maxn] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m);
        for i := 1 to n do
                read(f, v[i], w[i]);
        close(f);
        end;
procedure process;
        var
                i, j: longint;
        begin
        Fv[0] := 0;
        Fw[0] := 0;
        res := 0;
        for i := 1 to n do
        for j := 0 to i - 1 do
        if Fw[j] + w[i] <= m then
        if Fv[j] + v[i] > Fv[i] then
                begin
                Fv[i] := Fv[j] + v[i];
                Fw[i] := Fw[j] + w[i];
                if Fv[i] > res then
                        res := Fv[i];
                end;
        writeln(res);
        end;
begin
        input;
        process;
end.