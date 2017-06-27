const
        INP = '';
        OUT = '';
        MAXN = trunc(1e5);
type
        Point = record
                x, y: Int64;
                end;
var
        n: Longint;
        res: Int64;
        Lim1, Lim2: Point;
procedure enter;
        var
                i, j: Longint;
                p, p1, p2: Point;
                x1, x2, y1, y2: Int64;
        begin
        assign(input, INP);
        reset(input);
        readln(n);
        with Lim1 do begin x := -maxlongint; y := -maxlongint; end;
        with Lim2 do begin x := maxlongint; y := maxlongint; end;
        for i := 1 to n do
                begin
                p1.y := maxlongint;
                p2.y := -maxlongint;
                for j := 1 to 4 do
                        begin
                        with p do read(x, y);
                        if p.y > p2.y then p2 := p;
                        if p.y < p1.y then p1 := p;
                        end;
                x1 := p1.x + p1.y;
                y1 := p1.y - p1.x;
                x2 := p2.x + p2.y;
                y2 := p2.y - p2.x;
                if Lim1.x < x1 then Lim1.x := x1;
                if Lim1.y < y1 then Lim1.y := y1;
                if Lim2.x > x2 then Lim2.x := x2;
                if Lim2.y > y2 then Lim2.y := y2;
                end;
        close(input);
        end;
procedure prinf;
        var
                L, R: Int64;
        begin
        assign(output, OUT);
        rewrite(output);
        L := Lim2.x - Lim1.x - 1;
        R := Lim2.y - Lim1.y - 1;
        res := L * R;
        if (L <= 0) or (R <= 0) then
                writeln(0)
        else
        if (Lim1.x + Lim1.y) and 1 = 0 then
                writeln(trunc((res + 1) / 2))
        else
                writeln(trunc(res / 2));
        close(output);
        end;
begin
        enter;
        prinf;
end.
