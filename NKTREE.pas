const
        inp='';
var
        f:text;
        kt:boolean;
        x,y,z,k:longint;
begin
        assign(f,inp);
        reset(f);
        read(f,y);
        kt:=true;
        x:=low(longint);
        z:=high(longint);
        while (kt) and(not seekeof(f))  do
                begin
                read(f,k);
                if (z>=k)and(k>=y) then
                        begin
                        x:=y;
                        y:=k;
                        end
                else
                if (x<=k)and(k<=y) then
                        begin
                        z:=y;
                        y:=k;
                        end
                else kt:=false;
                end;
        if kt then write('YES') else write('NO');
        close(f);
end.
