const
        inp = 'NUMBER.inp';
        out = 'NUMBER.out';
        maxN = 1000 + 1;
var
        n, m: longint;
        a, b: ansistring;
        F: array[0..1,0..maxN] of ansistring;
procedure enter;
        begin
        assign(input, inp);
        reset(input);
        readln(a);
        readln(b);
        close(input);
        end;
function max(a, b: ansistring): ansistring;
        begin
        if length(a) > length(b) then
                exit(a)
        else
        if length(a) < length(b) then
                exit(b)
        else
        if a > b then
                exit(a)
        else
                exit(b);
        end;
procedure process;
        var
                x, y: longint;
        begin
        n := length(a);
        m := length(b);
        for x := 0 to 1 do
        for y := 1 to m do
                F[x,y] := '';
        for x := 1 to n do
        for y := 1 to m do
                begin
                if a[x] = b[y] then
                        begin
                        if a[x] = '0' then
                        if F[(x - 1) and 1,y] = '' then
                                continue;
                        F[x and 1,y] := F[(x - 1) and 1,y - 1] + a[x];
                        continue;
                        end;
                F[x and 1,y] := max(F[(x - 1) and 1,y], F[x and 1,y - 1]);
                end;
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(F[n and 1,m]);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
