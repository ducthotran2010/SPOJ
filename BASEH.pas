var
        k:int64;
        s:string;
begin
        read(k);
        repeat
                s:=chr(k mod 2+48)+s;
                k:=k div 2;
        until k=0;
        writeln(s);
end.
