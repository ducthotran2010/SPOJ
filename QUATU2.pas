const
        maxN = 8;
        Lx: array[1..4] of longint = (-2, -2, 2, 2);
        Ly: array[1..4] of longint = (-2, 2, -2, 2);
type
        Node = record
                x, y, s: longint;
                end;
var
        res, xs, ys, xe, ye: longint;
        visited: array[1..maxN,1..maxN] of boolean;
procedure BFS;
        var
                x: Node;
                i, First, Last: longint;
                Q: array[1..maxN * maxN] of Node;
        begin
        Q[1].x := xs;
        Q[1].y := ys;
        Q[1].s := 0;
        First := 0;
        Last := 1;
        repeat
                First := First + 1;
                x := Q[First];
                visited[x.x,x.y] := true;
                for i := 1 to 4 do
                if x.x + Lx[i] in [1..8] then
                if x.y + Ly[i] in [1..8] then
                if not visited[x.x + Lx[i],x.y + Ly[i]] then
                        begin
                        Last := Last + 1;
                        Q[Last].x := x.x + Lx[i];
                        Q[Last].y := x.y + Ly[i];
                        Q[Last].s := x.s + 1;
                        if Q[Last].x = xe then
                        if Q[Last].y = ye then
                                begin
                                res := Q[Last].s;
                                exit;
                                end;
                        end;
        until First >= Last;
        res := -1;
        end;
begin
        readln(xs, ys, xe, ye);
        if (xs <> xe) or (ys <> ye) then
                begin
                BFS;
                writeln(res);
                end
        else
                writeln(0);
end.