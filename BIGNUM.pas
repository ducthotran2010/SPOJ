const
        inp = 'BIGNUM.inp';
        out = 'BIGNUM.out';
        maxS = 18;
        maxL = 1000000000000000000;
type
        Int128Bit = record
                Hi, Lo: qword;
                end;
var
        sx, sy: string;
        x, y: Int128Bit;
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
function StrTo128B(s: string): Int128Bit;
        var
                e: longint;
                res: Int128Bit;
                tmp: string;
        begin
        tmp := copy(s, length(s) - maxS + 1, length(s));
        val(tmp, res.Lo, e);
        s := copy(s, 1, length(s) - length(tmp));
        val(s, res.Hi, e);
        exit(res);
        end;
begin
        assign(input, inp);
        reset(input);
        readln(sx);
        readln(sy);
        close(input);
        x := StrTo128B(sx);
        y := StrTo128B(sy);
        prinfHi(x + y);
        prinfLo(x + y);
end.