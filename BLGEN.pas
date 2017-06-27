const
        inp = '';
        out = 'BLGEN.out';
        maxN = 1000;
        maxL = 159555;
        maxP = 2154435;
var
        n, m, Limit: longint;
        a, b: array[1..maxN] of qword;
        Q: array[1..maxL] of qword;
        F: array[0..maxN,0..maxN] of longint;
        IsPrime: array[1..maxP] of boolean;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        n := 0;
        m := 0;
        while not seekeoln do
                begin
                n := n + 1;
                read(a[n]);
                end;
        readln;
        while not seekeoln do
                begin
                m := m + 1;
                read(b[m]);
                end;
        close(input);
        end;
procedure init;
        var
                i, j: qword;
        begin
        fillchar(IsPrime, sizeof(IsPrime), true);
        Limit := 0;
        i := 2;
        IsPrime[1] := false;
        while i < maxP do
                begin
                if IsPrime[i] then
                        begin
                        j := 2 * i;
                        while j <= maxP do
                                begin
                                IsPrime[j] := false;
                                j := j + i;
                                end;
                        Limit := Limit + 1;
                        Q[Limit] := i * i * i;
                        end;
                i := i + 1;
                end;
        end;

function max(a, b: longint): longint; inline;
        begin if a > b then max := a else max := b; end;

procedure process;
        var
                i, j: longint;
        function Check(x: qword): boolean;
                var
                        L, R, m: longint;
                begin
                if x = sqr(trunc(sqrt(x))) then
                        exit(true);
                L := 1;
                R := Limit;
                repeat
                        m := (L + R) shr 1;
                        if x > Q[m] then
                                l := m + 1
                        else
                        if x < Q[m] then
                                r := m - 1
                        else
                                exit(true);
                until L > R;
                exit(false);
                end;
        begin
        for i := 1 to n do
        for j := 1 to m do
                begin
                F[i,j] := max(F[i - 1,j], F[i,j - 1]);
                if a[i] = b[j] then
                if Check(a[i]) then
                if Check(b[j]) then
                        F[i,j] := F[i - 1,j - 1] + 1;
                end;
        writeln(F[n,m]);
        end;
begin
        enter;
        init;
        process;
end.