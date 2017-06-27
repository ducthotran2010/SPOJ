const
        inp = 'LSS.inp';
        out = 'LSS.out';
        maxn = 1000;
var
        n, g: longint;
        L, F: array [0..maxn,0..maxn] of extended;
        SS, S: array [0..maxn] of qword;
        a: array[1..maxn] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n, g);
        for i := 1 to n do
                read(f, a[i]);
        close(f);
        end;
procedure init;
        var
                i, j: longint;
        begin
        S[0] := 0;
        SS[0] := 0;
        for i := 1 to n do
                S[i] := S[i - 1] + a[i];
        for i := 1 to n do
        for j := i to n do
                L[i,j] := (S[j] - S[i - 1]) / (j - i + 1);
        for i := 1 to n do
        for j := 1 to n do
                F[i,j] := maxlongint;
        for i := 1 to n do
                SS[i] := SS[i - 1] + a[i] * a[i];
        end;

procedure process;
        var
                i, j, k: longint;
                SumSKtoJ, SumKtoJ: qword;
                Tmp: extended;
        begin
        F[1,1] := 0;
        For i := 1 to n do
                begin
                SumKtoJ := S[i] - S[0];
                SumSKtoJ := SS[i] - SS[0];
                F[1,i] := SumSKtoJ - 2 * L[1,i] * SumKtoJ + i * sqr(L[1,i]);
                end;
        for i := 2 to g do
        for j := 1 to n do
        for k := 1 to j - 1 do
                begin
                SumKtoJ := S[j] - S[k];
                SumSKtoJ := SS[j] - SS[k];
                Tmp := SumSKtoJ - 2 * L[k + 1,j] * SumKtoJ + (j - k) * sqr(L[k + 1,j]);
                if F[i,j] > F[i - 1,k] + Tmp then
                        F[i,j] := F[i - 1,k] + Tmp;
                end;
        end;
procedure prinf;
        var
                fo: text;
        begin
        assign(fo, out);
        rewrite(fo);
        writeln(fo, F[g,n]:0:2);
        close(fo);
        end;
begin
        input;
        init;
        process;
        prinf;
end.