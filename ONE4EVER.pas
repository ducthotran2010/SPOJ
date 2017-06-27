{$MODE OBJFPC}
const
        INP = '';
        OUT = 'ONE4EVER.out';
        MAXK = 2;
type
        Matrix = array[1..MAXK,1..MAXK] of Int64;
var
        t, i: Longint;
        n, m, a, b: Int64;
        res: Matrix;
        InpMatrix: Matrix = ((0, 0), (0, 0));
        DefMatrix: Matrix = ((0, 0), (1, 1));
function fastMult(a, b: Int64): Int64;
        begin
        if (a = 0) or (b = 0) then
                exit(0);
        if ln(a)/ln(10) + ln(b)/ln(10) + 1 >= 16 then
                begin
                if b and 1 = 0 then
                        exit((fastMult(a, b div 2) * 2) mod m);
                exit((fastMult(a, b div 2) * 2 + a) mod m);
                end;
        exit((a * b) mod m);
        end;
operator *(a, b: Matrix)c: Matrix;
        var
                i, j, k: Longint;
        begin
        for i := 1 to 2 do
        for j := 1 to 2 do
                result[i,j] := 0;
        for i := 1 to 2 do
        for j := 1 to 2 do
        for k := 1 to 2 do
                result[i,j] := (result[i,j] + fastMult(a[i,k], b[k,j])) mod m;
        end;
operator **(a: Matrix; n: Int64)c: Matrix;
        begin
        if n <= 1 then
                exit(a);
        result := a ** (n shr 1);
        result := result * result;
        if n and 1 = 1 then
                result := result * a;
        end;
begin
        assign(input, INP);
        reset(input);
        readln(t);
        for i := 1 to t do
                begin
                readln(a, b, m, n);
                DefMatrix[1,1] := a;
                InpMatrix[1,1] := b mod m;
                InpMatrix[1,2] := b mod m;
                res := InpMatrix * (DefMatrix ** (n - 1));
                if n = 1 then
                        writeln(InpMatrix[1,1])
                else
                        writeln(res[1,1]);
                end;
        close(input);
end.