const
        inp = '';
        out = 'BINTREE.out';
        maxn = 50000;
var
        n, count, tmp: longint;
        a, b, d: array[1..maxn] of longint;
procedure input;// inline;
        var
                f: text;
                i, x: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
                read(f, a[i]);
        for i := 1 to n do
                begin
                read(f, b[i]);
                d[b[i]] := i;
                end;
        close(f);
        end;
procedure Browser(l, r, i: longint);
        begin
        if l > r then
                exit;
        if l + 1 < r then
                count := count + 1;
        Browser(l, i - 1, d[a[count]]);
        if l < r then
                count := count + 1;
        Browser(i + 1, r, d[a[count]]);
        write(b[i],' ');
        end;
begin
        input;
        count := 1;
        Browser(1, n, d[a[1]]);
end.
