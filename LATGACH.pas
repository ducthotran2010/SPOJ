const
        maxN = 101;
        maxS = 15;
        maxL = 1000 * 1000 * 1000 * 1000 * 1000;
type
        Int128Bit = record
                Hi, Lo: qword;
                end;
var
        i, n, t: longint;
        F: array[1..maxN] of Int128Bit;
operator +(a, b: Int128Bit)c: Int128Bit;
        var
                res: Int128Bit;
        begin
        res.Hi := a.Hi + b.Hi;
        res.Lo := a.Lo + b.Lo;
        if res.Lo >= maxL then
                begin
                res.Hi := res.Hi + res.Lo div maxL;
                res.Lo := res.Lo mod maxL;
                end;
        exit(res);
        end;
procedure prinfHi(res: int128bit);
        begin
        if res.Hi <> 0 then
                write(res.Hi);
        end;
procedure prinfLo(res: int128bit);
        var
                i, e: longint;
        begin
        if res.Hi <> 0 then
                begin
                e := maxS - (trunc(ln(res.Lo)/ln(10) + 1));
                for i := 1 to e do
                        write('0');
                writeln(res.Lo);
                exit;
                end;
        writeln(res.Lo);
        end;
begin
        F[1].Lo := 1;
        F[2].Lo := 1;
        for i := 3 to maxN do
                F[i] := F[i - 1] + F[i - 2];
        readln(t);
        for i := 1 to t do
                begin
                readln(n);
                prinfHi(F[n + 1]);
                prinfLo(F[n + 1]);
                end;
end.
