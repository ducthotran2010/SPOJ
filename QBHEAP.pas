const
        inp = '';
        out = '';
        maxn = 15 * 1000;
        maxv = 1000 * 1000 * 1000;
var
        f: text;
        mode: char;
        res, Flag, tmp, n, x, intW: longint;
        a, b: array[1..maxn] of longint;
procedure DownHeap(k: longint);
        begin
        tmp := a[k];
        a[k] := a[k shr 1];
        a[k shr 1] := tmp;
        Flag := -1;
        if k * 2 <= n then
        if a[k] < a[k * 2] then
                Flag := 0;
        if k * 2 + 1 <= n then
        if ((a[k] < a[k * 2 + 1]) and (Flag = -1))
        or ((a[k * 2] < a[k * 2 + 1]) and (Flag = 0)) then
                Flag := 1;
        if Flag <> -1 then
                DownHeap(k * 2 + Flag);
        end;
procedure UpHeap(k: longint);
        begin
        tmp := a[k];
        a[k] := a[k shr 1];
        a[k shr 1] := tmp;
        k := k shr 1;
        if k > 1 then
        if a[k] > a[k shr 1] then
                UpHeap(k);
        end;
begin
        assign(f, inp);
        reset(f);
        n := 0;
        while not eof(f) do
                begin
                read(f, mode);
                if mode = '+' then
                        begin
                        readln(f, x);
                        if n < maxn then
                                begin
                                n := n + 1;
                                a[n] := x;
                                if n > 1 then
                                if a[n] > a[n shr 1] then
                                        UpHeap(n);
                                end;
                        end
                else
                        begin
                        readln(f);
                        if n > 0 then
                                begin
                                intW := a[1];
                                repeat
                                a[1] := a[n];
                                n := n - 1;
                                Flag := -1;
                                if 2 <= n then
                                if a[1] < a[2] then
                                        Flag := 0;
                                if 3 <= n then
                                if ((a[1] < a[3]) and (Flag = -1))
                                or ((a[2] < a[3]) and (Flag = 0)) then
                                        Flag := 1;
                                if Flag <> -1 then
                                        DownHeap(2 + Flag);
                                until (a[1] <> intW) or (n < 1);
                                end;
                        end;
                end;
        close(f);
        res := 0;
        while n >= 1 do
                begin
                res := res + 1;
                b[res] := a[1];
                intW := a[1];
                repeat
                a[1] := a[n];
                n := n - 1;
                Flag := -1;
                if 2 <= n then
                if a[1] < a[2] then
                        Flag := 0;
                if 3 <= n then
                if ((a[1] < a[3]) and (Flag = -1))
                or ((a[2] < a[3]) and (Flag = 0)) then
                        Flag := 1;
                if Flag <> -1 then
                        DownHeap(2 + Flag);
                until (a[1] <> intW) or (n < 1);
                end;
        writeln(res);
        for n := 1 to res do
                writeln(b[n]);
end.
