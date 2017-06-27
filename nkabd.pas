var
        count,l,i,r:longint;
function sumu(i:longint):int64;
        var
                j:longint;
                count:int64;
        begin
        count:=0;
        for j:= 1 to trunc(sqrt(i)) do
        if i mod j=0 then
                begin
                inc(count,j);
                if (j<>i div j)and(i div j<>i) then
                inc(count,i div j);
                if count>i then break;
                end;
        sumu:=count;
        end;
begin
        readln(l,r);
        count:=0;
        for i:= l to r do
        if sumu(i)>i then inc(count);
        write(count);
end.
