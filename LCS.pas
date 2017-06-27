//sai cmnr
const
        inp = 'LCS.inp';
        out = 'LCS.out';
        maxn = 1000;
var
        n, m, res: longint;
        x, y: string;
        LastX: array[0..255] of longint;
        LinkX, LfY, F: array[1..maxn] of longint;
procedure input;
        var
                f: text;
        begin
        assign(f, inp);
        reset(f);
        readln(f, x);
        readln(f, y);
        close(f);
        end;
procedure init;
        var
                i: longint;
                tmp: string;
                j: char;
        begin
        if length(x) < length(y) then
                begin
                tmp := x;
                x := y;
                y := tmp;
                end;
        n := length(x);
        m := length(y);
        for i := n downto 1 do
                begin
                LinkX[i] := LastX[ord(x[i])];
                LastX[ord(x[i])] := i;
                end;
        end;
procedure process;
        var
                l, i, j, k, intKC, MaxLfY: longint;
        begin
        res := 0;
        for l := 1 to m do
                begin
                if l > m - res then
                        break;
                MaxLfY := 0;
                for i := l to m do
                if LastX[ord(y[i])] <> 0 then
                        begin
                        F[i] := 1;
                        k := LastX[ord(y[i])];
                        intKC := k;
                        while k <> 0 do
                                begin
                                for j := i - 1 downto 1 do
                                if LfY[j] < k then
                                if F[i] < F[j] + 1 then
                                        begin
                                        F[i] := F[j] + 1;
                                        intKC := k;
                                        end;
                                if k > MaxLfY then
                                        break;
                                k := LinkX[k];
                                end;
                        LfY[i] := intKC;
                        if MaxLfY < LfY[i] then
                                MaxLfY := LfY[i];
                        if F[i] > res then
                                res := F[i];
                        end
                else
                        begin
                        F[i] := 0;
                        LfY[i] := 0;
                        end;
                end;
        writeln(res);
        end;
begin
        input;
        init;
        process;
end.
