var
        n,k:int64;
function josephus(n,m:int64):int64;
        var
                p,nn,mm:int64;
        begin
        p := m * n;
        nn := n + 1;
        mm := m - 1;
        while p > n do
                p := p + (p - nn) div mm - n;
        josephus:=p;
        end;
begin
        readln(n);
        readln(k);
        write(josephus(n,k));
end.
