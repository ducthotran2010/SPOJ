const
        INP = '';
        OUT = '';
        MAXN = trunc(1e5);
type
        HCN = record
                x1, y1, x2, y2: Int64;
                end;
var
        n: Longint;
        res, x, y, x1, x2, y1, y2: Int64;
        a: array[1..MAXN] of HCN;
procedure enter;
        var
                i: Longint;
                minX1, minY1, maxX2, maxY2: Int64;
        begin
        assign(input, INP);
        reset(input);
        readln(n);
        minX1 := maxlongint;
        minY1 := maxlongint;
        maxX2 := -maxlongint;
        maxY2 := -maxlongint;
        for i := 1 to n do
                begin
                readln(a[i].x1, a[i].y1, a[i].x2, a[i].y2);
                if a[i].x1 < minX1 then
                        begin
                        minX1 := a[i].x1;
                        x1 := a[i].x2;
                        end;
                if a[i].x2 > maxX2 then
                        begin
                        maxX2 := a[i].x2;
                        x2 := a[i].x1 + 1;
                        end;
                if a[i].y1 < minY1 then
                        begin
                        minY1 := a[i].y1;
                        y1 := a[i].y2;
                        end;
                if a[i].y2 > maxY2 then
                        begin
                        maxY2 := a[i].y2;
                        y2 := a[i].y1 + 1;
                        end;
                end;
        end;

function max(a, b: Int64): Int64; inline;
        begin if a > b then max := a else max := b; end;
function min(a, b: Int64): Int64; inline;
        begin if a < b then min := a else min := b; end;

function dis(p: HCN): Int64;
        begin
        if (p.x1 + 1 <= x) and (x <= p.x2) then
        if (p.y1 + 1 <= y) and (y <= p.y2) then
                exit(0);
        if (p.x1 + 1 <= x) and (x <= p.x2) then
                exit(min(abs(y - p.y1 - 1), abs(y - p.y2)));
        if (p.y1 + 1 <= y) and (y <= p.y2) then
                exit(min(abs(x - p.x1 - 1), abs(x - p.x2)));

        dis :=          max(abs(x - p.x1 - 1), abs(y - p.y1 - 1));
        dis := min(dis, max(abs(x - p.x2), abs(y - p.y2)));
        dis := min(dis, max(abs(x - p.x1 - 1), abs(y - p.y2)));
        dis := min(dis, max(abs(x - p.x2), abs(y - p.y1 - 1)));
        end;
procedure process;
        var
                i: Longint;
        begin
        res := 0;
        x := (x1 + x2 + 1) shr 1;
        y := (y1 + y2 + 1) shr 1;
        for i := 1 to n do
                res := max(res, dis(a[i]));
        writeln(res);
        end;
begin
        enter;
        process;
end.
