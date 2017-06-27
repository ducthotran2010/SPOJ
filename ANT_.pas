var
        m,n,i,f:int64;
begin
        readln(n);
        readln(m);
        f:=1;
        i:=2;
        if n<>1 then
                repeat
                f:=(f-1+m) mod i+1;
                inc(i);
                until i+1=n;
        write(f);
end.