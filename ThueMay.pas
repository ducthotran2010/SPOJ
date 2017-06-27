const
        inp = 'Thuemay.inp';
        out = 'Thuemay.out';
        maxN = 100;
type
        Node = record
                l, r, v, id: longint;
                end;
var
        n, idMax: longint;
        a: array[1..maxN] of Node;
        T, L: array[-1..maxN] of longint;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                begin
                readln(a[i].l, a[i].r, a[i].v);
                a[i].id := i;
                end;
        close(input);
        end;
procedure sort;
        var
                tmp: Node;
                i, j: longint;
        begin
        for i := 1 to n - 1 do
        for j := i + 1 to n do
        if a[i].r > a[j].r then
                begin
                tmp := a[i];
                a[i] := a[j];
                a[j] := tmp;
                end;
        end;
procedure process;
        var
                i, j: longint;
        begin
        idMax := 1;
        for i := 1 to n do
                begin
                T[i] := -1;
                L[i] := a[i].v;
                if L[idMax] < L[i] then
                        idMax := i;
                end;
        for i := 2 to n do
        for j := 1 to i - 1 do
        if a[i].l >= a[j].r then
        if L[i] < L[j] + a[i].v then
                begin
                T[i] := j;
                L[i] := L[j] + a[i].v;
                if L[i] > L[idMax] then
                        idMax := i;
                end;
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(L[idMax]);
        while idMax <> -1 do
                begin
                write(a[idMax].id, #32);
                idMax := T[idMax];
                end;
        close(output);
        end;
begin
        enter;
        sort;
        process;
        prinf;
end.