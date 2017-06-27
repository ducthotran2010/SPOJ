var
        s:string;
procedure rw(be,af:string);
        var
                i:byte;
        begin
        be:=' '+be+' ';
        af:=' '+af+' ';
        while (pos(be,s)<>0) do begin
                i:=pos(be,s);
                delete(s,i,length(be));
                insert(af,s,i);
        end;
        end;
procedure R(be,af:string);
        var
                i:byte;
        begin
        while pos(be,s)<>0 do begin
                i:=pos(be,s);
                delete(s,i,length(be));
                insert(af,s,i);
        end;
        end;
begin
        readln(s);
        s:=' '+s+' ';
        RW('k','khong');
        RW('ko','khong');
        RW('ng','nguoi');
        RW('n','nhieu');
        RW('dc','duoc');
        RW('hok','khong');
        RW('ntn','nhu the nao');
        RW('kq','ket qua');
        R('j','gi');
        R('w','qu');
        R('f','ph');
        R('dz','d');
        R('z','d');
        writeln(copy(s,2,length(s)-1));
end.
