const
        inp = '';
        out = '';
        maxn = 5000;
        maxl = 20;
type
        arrSpecV = record
                l, r, v: longint;
                end;
var
        n, LimitN: longint;
        a: array[1..maxn] of arrSpecV;
        d, save: array[1..maxl] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        for i := 1 to n do
                begin
                read(f, a[i].l);
                a[i].v := i;
                end;
        for i := 1 to n do
                read(f, a[i].r);
        close(f);
        end;
procedure procBackTrack;
        var
                TmpV, Max, TmpS: longint;
        function maxl(i, j: longint; var l: longint): longint;
                begin
                if a[i].l > a[j].l then
                        begin
                        maxl := i;
                        l := j;
                        end
                else
                        begin
                        maxl := j;
                        l := i;
                        end;
                end;
        procedure try(deep: longint);
                var
                        i, j, p, l: longint;
                begin
                for i := 1 to n do
                if d[i] = 0 then
                for j := i + 1 to n do
                if d[j] = 0 then
                        begin
                        d[i] := deep;
                        d[j] := deep;
                        p := maxl(i, j, l);
                        TmpV := TmpV + a[p].l;
                        TmpS := TmpS + a[l].r;
                        if deep < LimitN then
                                try(deep + 1)
                        else
                        if TmpS > max then
                                begin
                                max := TmpS;
                                Save := D;
                                end;
                        TmpV := TmpV - a[p].l;
                        TmpS := TmpS - a[l].r;
                        d[i] := 0;
                        d[j] := 0;
                        end;
                end;
        procedure prinf;
                var
                        f: text;
                        i, j: longint;
                begin
                assign(f, out);
                rewrite(f);
                writeln(f, max);
                for i := 1 to LimitN do
                        begin
                        for j := 1 to n do
                        if save[j] = i then
                                write(f, j, ' ');
                        writeln(f);
                        end;
                close(f);
                end;
        begin
        for TmpV := 1 to n do
                D[TmpV] := 0;
        LimitN := n div 2;
        TmpV := 0;
        TmpS := 0;
        max := 0;
        try(1);
        prinf;
        end;
procedure procSort;
        var
                res: longint;
        procedure sort(l, r: longint);
        var
                i, j, x: longint;
                tmp: arrSpecV;
        begin
        i := l;
        j := r;
        x := a[(l + r) div 2].l;
        repeat
                while a[i].l < x do i := i + 1;
                while a[j].l > x do j := j - 1;
                if i <= j then
                        begin
                        tmp := a[i];
                        a[i] := a[j];
                        a[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;
        procedure process;
                var
                        i: longint;
                begin
                res := 0;
                for i := 1 to n do
                if i mod 2 = 0 then
                        res := res + a[i - 1].r;
                end;
        procedure prinf;
                var
                        f: text;
                        i: longint;
                begin
                assign(f, out);
                rewrite(f);
                writeln(f, res);
                for i := 1 to n do
                        begin
                        write(f, a[i].v, ' ');
                        if i mod 2 = 0 then
                                writeln(f);
                        end;
                close(f);
                end;
        begin
        sort(1, n);
        process;
        prinf;
        end;
begin
        input;
        if n <= 20 then
                procBackTrack
        else
                procSort;
end.
