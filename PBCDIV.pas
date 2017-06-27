var
        a,b:int64;
        t,i:longint;
begin
readln(t);
for i:= 1 to t do begin
        readln(a,b);
        a:=a-1;
        writeln((b div 12+b div 30-2*(b div 60))-(a div 12+a div 30-2*(a div 60)));
end;
end.
