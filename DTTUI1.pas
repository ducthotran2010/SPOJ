const
        inp = '';
        maxn = 40;
var
        n, m, res, tmpv, tmpw: longint;
        w, v, x, Fw, Fv: array[0..maxn] of longint;
procedure input;
        var
                f: text;
                i: byte;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, m);
        for i:= 1 to n do
                read(f, w[i], v[i]);
        close(f);
        end;
procedure try(i: longint);
        var
                j: longint;
        begin
        for j:= 0 to 1 do
                begin
                x[i] := j;
                tmpw := tmpw + j * w[i];
                tmpv := tmpv + j * v[i];
                if tmpw <= m then
                        begin
                        if i = n then
                                begin
                                if res < tmpv then
                                        res := tmpv;
                                end
                        else
                                try(i + 1);
                        end;
                tmpw := tmpw - j * w[i];
                tmpv := tmpv - j * v[i];
                end;
        end;
procedure process;
        var
                i, j: longint;
        begin
        Fw[0] := 0;
        Fv[0] := 0;
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
        end;
begin
        input;
        tmpw := 0;
        tmpv := 0;
        res := 0;
        if n <= 25 then
                try(1)
        else
                process;
        writeln(res);
end.

