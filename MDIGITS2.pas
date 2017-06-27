var

        i,n:longint;
        sn,s:ansistring;
begin
readln(n);
for i:= 1 to n do
        begin
        str(i,sn);
        s:=s+sn;
        end;
str(n,sn);
write(pos(sn,s));
end.