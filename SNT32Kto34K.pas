uses crt;
var i,j:longint;f:text;s:boolean;
begin
    assign(f,'out.txt');
    rewrite(f);
    for i:= 32000 to 34000 do
        begin
        s:=true;
        for j:= 2 to trunc(sqrt(i))+1 do
            if i mod j=0 then
                begin
                s:=false;
                break;
                end;
        if s=true then write(f,i);
        end;
    close(f);
    readln;
end.

