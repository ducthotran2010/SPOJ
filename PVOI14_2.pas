{$M 200000000}
const
        INP = '';
        OUT = '';
        MAXN = 1000;
        Lx: array[1..4] of Longint = (0, 0, 1, -1);
        Ly: array[1..4] of Longint = (-1, 1, 0, 0);
var
        n, res, Count, Val, T, LimL, LimR: Longint;
        A: array[1..MAXN, 1..MAXN] of Longint;
        Num: array[1..MAXN,1..MAXN] of Longint;
        Block: array[1..MAXN * 2, 1..MAXN] of Boolean;
procedure enter;
        var
                i, j: Longint;
        begin
        assign(input, INP);
        reset(input);
        readln(n);
        for i := 1 to n do
        for j := 1 to n do
                read(A[i, j]);
        close(input);
        end;
procedure getM(x, y, i, j: Integer; var Mx, My: Integer); inline;
        begin
        if i = x then
                begin
                Mx := i shl 1 - 1;
                My := j;
                if My > y then My := y;
                end
        else
                begin
                Mx := i;
                if Mx > x then Mx := x;
                Mx := Mx shl 1;
                My := j;
                end;
        end;
procedure Visit(i, j: Integer);
        var
                x, y, k, Mx, My: Integer;
        begin
        T := T + 1;
        Num[i, j] := T;
        Count := Count + 1;
        for k := 1 to 4 do
                begin
                x := i + Lx[k];
                y := j + Ly[k];
                if (x <= 0) or (n < x) then continue;
                if (y <= 0) or (n < y) then continue;
                getM(x, y, i, j, Mx, My);
                //-----------------------------------
                if not Block[Mx, My] then
                if (LimL <= Num[x, y]) and (Num[x, y] <= LimR) then
                if Val = abs(A[i, j] - A[x, y]) then
                        begin
                        Block[Mx, My] := true;
                        Visit(x, y);
                        end;
                end;
        end;
procedure process;
        var
                i, j, k, Mx, My, x, y: Integer;
        begin
        T := 0;
        LimL := 0;
        LimR := 0;
        res := 1;
        for i := 1 to n do
        for j := 1 to n do
        for k := 1 to 4 do
                begin
                x := i + Lx[k];
                y := j + Ly[k];
                if (x <= 0) or (n < x) then continue;
                if (y <= 0) or (n < y) then continue;
                getM(x, y, i, j, Mx, My);
                //------------- Solve ---------------
                if not Block[Mx, My] then
                if (LimL <= Num[x, y]) and (Num[x, y] <= LimR) then
                        begin
                        Count := 0;
                        Val := abs(A[i, j] - A[x, y]);
                        Visit(x, y);
                        LimR := T;
                        end;
                if Count > res then
                        res := Count;
                end;
        end;
procedure prinf;
        begin
        assign(output, OUT);
        rewrite(output);
        writeln(res);
        close(output);
        end;
begin
        enter;
        process;
        prinf;
end.
