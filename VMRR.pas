uses crt;
const
        inp='';
var
xy:string;
n:longint;
s:ansistring;
procedure input;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        readln(f,s);
        n:=length(s);
        readln(f,xy);
        close(f);
        end;
procedure process;
        var
                i:longint;
                ca,count:qword;
        begin
        ca:=0;
        count:=0;
        for i:= 1 to n do
        begin
        if ord(s[i])=ord(xy[2]) then inc(count,ca);
        if ord(s[i])=ord(xy[1]) then inc(ca);
        end;
        write(count);
        end;
begin
        input;
        process;
end.