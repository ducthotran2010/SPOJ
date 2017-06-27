const
        inp = 'ROAD.inp';
        out = 'ROAD.out';
        maxN = 100 * 1000;
        maxV = maxlongint;
type
        Node = record
                v, id: longint;
                end;
var
        n, k, res, Lx: longint;
        a: array[1..maxN] of longint;
        F: array[0..maxN + 2] of Node;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n, k);
        for i := 1 to n do
                begin
                readln(a[i]);
                a[i] := a[i] - k;
                end;
        close(input);
        end;
procedure init;
        var
                i: longint;
        begin
        F[1].v := 0;
        F[1].id := 0;
        for i := 2 to n + 1 do
                begin
                F[i].v := F[i - 1].v + a[i - 1];
                F[i].id := i - 1;
                end;
        end;

operator < (a, b: Node)c: boolean;
        begin exit((a.v < b.v) or ((a.v = b.v) and (a.id < b.id))); end;
operator > (a, b: Node)c: boolean;
        begin exit((a.v > b.v) or ((a.v = b.v) and (a.id > b.id))); end;

procedure sort(l, r: longint);
        var
                x, tmp: Node;
                i, j: longint;
        begin
        i := l;
        j := r;
        x := F[(l + r) div 2];
        repeat
                while F[i] < x do i := i + 1;
                while F[j] > x do j := j - 1;
                if i <= j then
                        begin
                        tmp := F[i];
                        F[i] := F[j];
                        F[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;

procedure process;
        var
                L, R, i: longint;
        begin
        L := 0;
        R := -1;
        F[0].v := maxV;
        F[n + 2].v := maxV;
        for i := 1 to n + 2 do
        if F[i].v <> F[i - 1].v then
                begin
                if R - L + 1 > res then
                        begin
                        Lx := L;
                        res := R - L + 1;
                        end;
                if R - L + 1 = res then
                if L < Lx then
                        Lx := res;
                L := F[i].id + 1;
                R := F[i].id;
                end
        else
                R := F[i].id;
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        if Lx <> 0 then
                writeln(Lx, #32, res)
        else
                writeln(0);
        close(output);
        end;

begin
        enter;
        init;
        sort(1, n + 1);
        process;
        prinf;
end.