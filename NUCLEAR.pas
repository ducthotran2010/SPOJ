const
        inp = 'NUCLEAR.inp';
        out = 'NUCLEAR.out';
        maxn = 30000;
var
        n, q, Ax, Ay, Bx, By, intMaxRA, intMaxRB: longint;
        x, y, RqA, RqB, DfA, DfB, AnB, Ans: array [0..maxn] of longint;
        R: array[0..maxn,0..maxn] of longint;
procedure input;
        var
                f: text;
                i: longint;
        begin
        assign(f, inp);
        reset(f);
        readln(f, n);
        intMaxRA := 0;
        intMaxRB := 0;
        for i := 1 to n do
                read(f, x[i], y[i]);
        readln(f, Ax, Ay, Bx, By, q);
        for i := 1 to q do
                begin
                read(f, RqA[i], RqB[i]);
                if RqA[i] > intMaxRA then
                        intMaxRA := RqA[i];
                if RqB[i] > intMaxRB then
                        intMaxRB := RqB[i];
                end;
        close(f);
        end;
procedure process;
        var
                Tmp1: extended;
                i, j, Tmp2, intDfA, intDfB: longint;
        begin
        for i := 1 to n do
                begin
                Tmp1 := sqrt(sqr(Ax - x[i]) + sqr(Ay - y[i]));
                Tmp2 := trunc(Tmp1);
                if Tmp1 - Tmp2 > 0 then
                        intDfA := Tmp2 + 1
                else
                        intDfA := Tmp2;
                DfA[intDfA] := DfA[intDfA] + 1;
                //-------------------------------------------
                Tmp1 := sqrt(sqr(Bx - x[i]) + sqr(By - y[i]));
                Tmp2 := trunc(Tmp1);
                if Tmp1 - Tmp2 > 0 then
                        intDfB := Tmp2 + 1
                else
                        intDfB := Tmp2;
                DfB[intDfB] := DfB[intDfB] + 1;
                //-------------------------------------------
                R[intDfA,intDfB] := R[intDfA,intDfB] + 1;
                end;
        for i := 1 to maxn do
                begin
                DfA[i] := DfA[i - 1] + DfA[i];
                DfB[i] := DfB[i - 1] + DfB[i];
                AnB[i] := AnB[i - 1] + AnB[i];
                end;
        for i := 1 to intMaxRA do
        for j := 1 to intMaxRB do
                R[i,j] := R[i - 1,j] + R[i,j - 1] - R[i - 1,j - 1] + R[i,j];
        end;
procedure prinf;
        var
                f: text;
                i: longint;
        begin
        assign(f, out);
        rewrite(f);
        for i := 1 to q do
                writeln(f, DfA[RqA[i]] + DfB[RqB[i]] - R[RqA[i],RqB[i]]);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
