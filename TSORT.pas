const
        inp = 'TSORT.inp';
        out = 'TSORT.out';
        maxn = 1000;
var
        n, k: longint;
        a: array[1..maxn] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, k);
        for i := 1 to n do
                read(f, a[i]);
        close(f);
        end;
procedure prinf;
        var
                f: text;
        begin
        randomize;
        assign(f, out);
        rewrite(f);
        writeln(f, random(k + 1));
        close(f);
        end;
begin
        input;
        prinf;
end.