const
        inp = 'Phonghop.inp';
        out = 'Phonghop.out';
        maxN = 100;
type
        Node = record
                l, r, id: longint;
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
                readln(a[i].l, a[i].r);
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
        for j := i + 1 to n  do
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
        L[1] := 1;
        idMax := 1;
        for i := 1 to n do
                begin
                L[i] := 1;
                T[i] := -1;
                end;
        for i := 2 to n do
        for j := 1 to i - 1 do
        if a[j].r <= a[i].l then
        if L[i] < L[j] + 1 then
                begin
                L[i] := L[j] + 1;
                T[i] := j;
                if L[idMax] < L[i] then
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
