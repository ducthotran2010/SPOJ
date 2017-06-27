var
        x1, x2, x3, y1, y2, y3: longint;
function check: longint;
        begin
        if (x2 <> x3) and (y2 <> y3) then
                exit(-1);
        if (y3 = 0) or (y3 = 9) then
                exit(-1);
        if (x3 = 0) or (x3 = 8) then
                exit(-1);
        if y2 = y3 then begin
                if y1 = y2 then begin
                        if (x1 in [x2..x3]) or (x1 in [x3..x2]) then
                                exit(4)
                        else
                                exit(1);
                end
                else begin
                        if (x1 in [x2..x3]) or (x1 in [x3..x2]) then
                                exit(3)
                        else
                                exit(2);
                end;
        end;
        if x2 = x3 then begin
                if x1 = x2 then begin
                        if (y1 in [y2..y3]) or (y1 in [y3..y2]) then
                                exit(4)
                        else
                                exit(1);
                end
                else begin
                        if (y1 in [y2..y3]) or (y1 in [y3..y2]) then
                                exit(3)
                        else
                                exit(2);
                end;
        end;
        end;
begin
        readln(y1, x1);
        readln(y2, x2);
        readln(y3, x3);
        writeln(check);
end.