const
        inp = 'NKTEAM.inp';
        maxN = 100 * 1000;
var
        n: longint;
        a, rank: array[1..3,1..maxN] of longint;
procedure enter;
        var
                r, i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for r := 1 to n do
                begin
                read(i);
                rank[1,i] := r;
                a[1,r] := i;
                end;
        for r := 1 to n do
                begin
                read(i);
                rank[2,i] := r;
                a[2,r] := i;
                end;
        for r := 1 to n do
                begin
                read(i);
                rank[3,i] := r;
                a[3,r] := i;
                end;
        close(input);
        end;
procedure process;
        var
                i, j, k: longint;
        begin
        k := n;
        for i := 1 to n do
        for j := 1 to rank[1,i] do
        if rank[1,a[1,j]] < rank[1,i] then
        if rank[2,a[1,j]] < rank[2,i] then
        if rank[3,a[1,j]] < rank[3,i] then
                begin
                k := k - 1;
                break;
                end;
        writeln(k);
        end;
begin
        enter;
        process;
end.
