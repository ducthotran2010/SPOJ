const
        inp = 'BIENTAU.inp';
        out = 'BIENTAU.out';
        maxN = 5000;
        Base = 26;
        Hased = 100003;
var
        n, res: longint;
        H, F, A, P: array[0..maxN] of int64;
procedure enter;
        var
                i, x, y: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        read(x);
        for i := 1 to n - 1 do
                begin
                read(y);
                a[i] := x - y + 100;
                x := y;
                end;
        close(input);
        end;
procedure init;
        var
                i: longint;
        begin
        n := n - 1;
        //---------
        H[0] := 0;
        H[1] := a[1] mod Hased;
        for i := 2 to n do
                H[i] := (H[i - 1] * Base + a[i]) mod Hased;
        //---------
        P[0] := 1;
        for i := 1 to n do
                P[i] := (P[i - 1] * Base) mod Hased;
        //---------
        F[0] := 0;
        F[1] := a[1];
        for i := 2 to n do
                F[i] := F[i - 1] + a[i];
        end;

function GetH(i, j: longint): int64;
        begin exit(((H[j] - H[i - 1] * P[j - i + 1]) + Hased * Hased) mod Hased); end;
function GetV(i, j: longint): int64;
        begin exit(F[j] - F[i - 1]); end;

procedure process;
        var
                L, i, j: longint;
        begin
        res := 0;
        L := n shr 1;
        while L > 0 do
                begin
                for i := 1 to n - 2 * L + 1 do
                for j := i + L + 1 to n - L + 1 do
                if GetH(i, i + L - 1) = GetH(j, j + L - 1) then
                if GetV(i, i + L - 1) = GetV(j, j + L - 1) then
                        begin
                        res := L + 1;
                        exit;
                        end;
                L := L - 1;
                end;
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        init;
        process;
        prinf;
end.
