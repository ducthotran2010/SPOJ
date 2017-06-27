const
        inp = '';
        out = '';
        maxN = 50001;
var
        n, p, res: longint;
        a, v, s, Lm: array[1..maxN] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, p);
        for i := 1 to n do
                readln(a[i]);
        close(input);
        end;
procedure sort(l, r: longint);
        var
                i, j, tmp, x: longint;
        begin
        i := l;
        j := r;
        x := s[(l + r) div 2];
        repeat
                while s[i] < x do i := i + 1;
                while s[j] > x do j := j - 1;
                if i <= j then
                        begin
                        tmp := s[i];
                        s[i] := s[j];
                        s[j] := tmp;
                        tmp := v[i];
                        v[i] := v[j];
                        v[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;

procedure init1st;
        var
                i: longint;
        begin
        n := n + 1;
        s[1] := 0;
        v[1] := 0;
        for i := 2 to n do
                begin
                s[i] := s[i - 1] + a[i - 1];
                v[i] := i - 1;
                end;
        end;
procedure init2nd;
        var
                i: longint;
        begin
        Lm[1] := v[1];
        for i := 2 to n do
                begin
                Lm[i] := v[i];
                if Lm[i] > Lm[i - 1] then
                        Lm[i] := Lm[i - 1];
                end;
        end;
procedure process;
        var
                i, Locate: longint;
        procedure BinarySearch;
                var
                        L, R, m: longint;
                begin
                L := 1;
                R := i - 1;
                repeat
                        m := (L + R) shr 1;
                        if s[i] - s[m] >= p then
                                begin
                                Locate := m;
                                L := m + 1;
                                end
                        else
                                R := m - 1;
                until R < L;
                end;
        begin
        res := -1;
        for i := 2 to n do
                begin
                Locate := maxlongint;
                BinarySearch;
                if Locate <> maxlongint then
                if v[i] - Lm[Locate] > res then
                        res := v[i] - Lm[Locate];
                end;
        writeln(res);
        end;
begin
        enter;
        init1st;
        sort(1, n);
        init2nd;
        process;
end.