const
        inp = 'NEAREST.inp';
        out = 'NEAREST.out';
        maxN = 100 * 1000;
type
        Node = record
                x, y: real;
                end;
var
        res: real;
        n, Lim, LimL, LimR: longint;
        x, y: array[1..maxN] of real;
        Strip, SLeft, SRight: array[1..maxN + 1] of Node;
procedure enter;
        var
                i: longint;
        begin
        assign(input, inp);
        reset(input);
        readln(n);
        for i := 1 to n do
                readln(x[i], y[i]);
        close(input);
        end;
procedure sort(l, r: longint);
        var
                i, j, id: longint;
                xD, yD, tmp: real;
        begin
        i := l;
        j := r;
        id := random(R - L + 1) + L;
        xD := x[id];
        yD := y[id];
        repeat
                while (x[i] < xD) or ((x[i] = xD) and (y[i] < yD)) do i := i + 1;
                while (x[j] > xD) or ((x[j] = xD) and (y[j] > yD)) do j := j - 1;
                if i <= j then
                        begin
                        tmp := y[i];
                        y[i] := y[j];
                        y[j] := tmp;
                        tmp := x[i];
                        x[i] := x[j];
                        x[j] := tmp;
                        i := i + 1;
                        j := j - 1;
                        end;
        until i > j;
        if l < j then sort(l, j);
        if i < r then sort(i, r);
        end;

function min(a, b: real): real; inline;
        begin if a < b then exit(a) else exit(b); end;

function Nearest(L, R: longint): real;
        var
                DL, DR, D, MidPointx: real;
                i, j, mid: longint;
        begin
        D := maxlongint;
        if L >= R then
                exit(D);
        if R - L + 1 = 2 then
                exit(sqrt(sqr(x[L] - x[R]) + sqr(y[L] - y[R])));
        mid := (L + R) shr 1;
        DL := Nearest(L, Mid);
        DR := Nearest(Mid + 1, R);
        D := min(DL, DR);
        MidPointx := (x[mid] + x[mid + 1]) / 2;
        // Trip Left
        LimL := 0;
        for i := L to mid do
        if abs(x[i] - MidPointX) < D then
                begin
                inc(LimL);
                SLeft[LimL].x := X[i];
                SLeft[LimL].y := Y[i];
                end;
        SLeft[LimL + 1].y := maxlongint;
        // Trip Right
        LimR := 0;
        for i := mid + 1 to R do
        if abs(x[i] - MidPointX) < D then
                begin
                inc(LimR);
                SRight[LimR].x := X[i];
                SRight[LimR].y := Y[i];
                end;
        SRight[LimR + 1].y := maxlongint;
        // Join
        Lim := 0;
        i := 1;
        j := 1;
        while Lim < LimL + LimR do
                begin
                Lim := Lim + 1;
                if SLeft[i].y < SRight[j].y then
                        begin
                        Strip[Lim] := SLeft[i];
                        i := i + 1;
                        end
                else
                        begin
                        Strip[Lim] := SRight[j];
                        j := j + 1;
                        end;
                end;
        // Nearest Strip
        for i := 1 to Lim do
        for j := i + 1 to Lim do
                begin
                if Strip[j].y - Strip[i].y >= D then
                        break;
                if sqrt(sqr(Strip[j].x - Strip[i].x) + sqr(Strip[j].y - Strip[i].y)) < D then
                        D := sqrt(sqr(Strip[j].x - Strip[i].x) + sqr(Strip[j].y - Strip[i].y));
                end;
        exit(D);
        end;
procedure prinf;
        begin
        assign(output, out);
        rewrite(output);
        writeln(res:0:3);
        close(output);
        end;
begin
        randomize;
        enter;
        sort(1, n);
        res := Nearest(1, N);
        prinf;
end.