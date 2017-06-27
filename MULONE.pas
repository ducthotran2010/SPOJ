const
        sc='123456789';
var
        t,n,i,j:longint;
        s1,s2:ansistring;
procedure build;
        var
                i:longint;
        begin
        for i:= 2 to n do
        if (i-1) mod 9<>0 then
                begin
                s1:=s1+sc[(i-1)mod 9];//chr((i-1) mod 9+48);
                s2:={chr((i-1) mod 9+1+48)}sc[(i-1) mod 9+1]+s2;
                end
        else
                begin
                s1[(i-2)]:='9';
                s1:=s1+'0';
                s2:='0'+s2;
                end;
        end;

begin
        readln(t);
        for i:= 1 to t do
                begin
                readln(n);
                s1:='';
                s2:='1';
                build;
                writeln('12345679012345678987654320987654321');
                writeln(s1+s2);
                end;
end.

