const
        inp = 'INTSLE.inp';
        out = 'INTSLE.out';
var
        i, n, D, Dx, Dy, U: longint;
        F: array[1..2,1..3] of longint;
procedure swap;
        var
                i, tmp: longint;
        begin
        for i := 1 to 3 do
                begin
                tmp := F[1,i];
                F[1,i] := F[2,i];
                F[2,i] := tmp;
                end;
        end;
function GCD(a, b: longint): longint;
        var
                tmp: longint;
        begin
        while b > 0 do
                begin
                a := a mod b;
                tmp := a;
                a := b;
                b := tmp;
                end;
        exit(a);
        end;
procedure Solve;
        begin
        D := F[1,1] * F[2,2] - F[1,2] * F[2,1];
        Dx := F[1,2] * F[2,3] - F[1,3] * F[2,2];
        Dy := F[1,3] * F[2,1] - F[1,1] * F[2,3];
        if D <> 0 then
                begin
                if Dx mod D = 0 then
                if Dy mod D = 0 then
                        begin
                        writeln(trunc(-Dx / D), #32, trunc(-Dy / D));
                        exit;
                        end;
                writeln('NO SOLUTION');
                exit;
                end
        else
        if (Dx = 0) and (Dy = 0) then
                begin
                if (F[1,1] = F[1,2]) and (F[1,2] = 0) then
                        Swap;
                U := GCD(F[1,1], F[1,2]);
                if ((U = 0) and (F[1,3] <> 0))
                or ((U <> 0) and (F[1,3] mod U <> 0)) then
                        writeln('NO SOLUTION')
                else
                        writeln('INFINITE');
                exit;
                end;
        writeln('NO SOLUTION');
        end;
begin
        //assign(input, inp);
        //reset(input);
        readln(n);
        for i := 1 to n do
                begin
                readln(F[1,1], F[1,2], F[1,3], F[2,1], F[2,2], F[2,3]);
                Solve;
                end;
        //close(input);
end.
