var
        s1,s2:string;
        i,n,max:integer;
begin

        readln(s1);
        readln(s2);
        n:=length(s1);
        for i:= n downto 1 do
                begin
                if copy(s1,i,n-i+1)=copy(s2,1,n-i+1) then
                if n-i+1>max then max:=n-i+1;
                end;
        write(length(s1)+length(s2)-max);
end.