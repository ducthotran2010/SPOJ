var
        kq,t,a,b,i:int64;
        j:longint;
procedure swap;
        var
                tmp:int64;
        begin
        tmp:=a;
        a:=b;
        b:=tmp;
        end;
begin
i:=0;
readln(t);
for j:= 1 to t do begin
        readln(a,b);
        if a>b then swap;
        i:=0;
        kq:=0;
        repeat
                inc(i);
                a:=a+i;
                b:=b-i;
                inc(kq,2);
        until (abs(a-b)>=0)and(abs(a-b)<=i+1);
        if a<b then inc(kq);
        writeln(kq);
        end;
end.
