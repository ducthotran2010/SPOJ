const
        inp = '';
        out = '';
        maxn = 5000;
var
        m, n: longint;
        F: array[1..maxn,1..maxn] of longint;
procedure input;
        var
                f: text;
        begin
        assign(f, inp);
        reset(f);
        readln(f, m, n);
        close(f);
        end;
procedure process;
        var
                i, j, k, ei, ej: longint;
        begin
        for i := 1 to m do
        for j := 1 to n do
                begin
                if i = j then
                        begin
                        F[i,j] := 0;
                        continue;
                        end;
                if F[i,j] <> 0 then
                        continue;
                F[i,j] := i * j;
                ei := i div 2;
                ej := j div 2;
                for k := 1 to ei do
                if F[i,j] > F[i - k,j] + F[k,j] + 1 then
                        F[i,j] := F[i - k,j] + F[k,j] + 1;
                for k := 1 to ej do
                if F[i,j] > F[i,j - k] + F[i,k] + 1 then
                        F[i,j] := F[i,j - k] + F[i,k] + 1;
                F[j,i] := F[i,j];
                end;
        writeln(F[m,n] + 1);
        end;
begin
        input;
        process;
end.