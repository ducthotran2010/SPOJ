var
        s:ansistring;
procedure process;
        var
                i,j:byte;
                left:boolean;
        begin
        i:=1;
        j:=length(s);
        left:=false;
        repeat
                if s[i]<>s[j] then
                        begin
                        if left then
                                begin
                                insert(s[j],s,i);
                                inc(i);
                                left:=not left;
                                end
                        else
                                begin
                                insert(s[i],s,j+1);
                                inc(i);
                                left:=not left;
                                end;
                        end
                else
                        begin
                        inc(i);
                        dec(j);
                        end;
        until i>=j;
        writeln(s);
        end;
begin
        readln(s);
        process;
end.