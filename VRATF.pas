var
        n, k: Longint;
function getV(n: Longint): Longint ;
        begin
        if ((n xor k) and 1 = 0) and (n > k) then
                getV := getV((n + k) div 2) + getV((n - k) div 2)
        else
                exit(1);
        end;
begin
        readln(n, k);
        writeln(getV(n));
end.
