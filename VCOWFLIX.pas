var
n:byte;
max,tmp,c:integer;
a:array[1..16] of integer;
procedure inp;
        var
                i:integer;
        begin
        readln(c,n);
        for i:= 1 to n do read(a[i]);
        end;
procedure try(i:byte);
        var
                j:byte;
        begin
        for j:= 0 to 1 do
                begin
                tmp:=tmp+a[i]*j;
                if tmp<=c then
                        begin
                        if i=n then
                                begin
                                if tmp>max then max:=tmp;
                                end
                        else try(i+1);
                        end;
                tmp:=tmp-a[i]*j;
                end;
        end;
begin
        inp;
        tmp:=0;
        max:=0;
        try(1);
        write(max);
end.