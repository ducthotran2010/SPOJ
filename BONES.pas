const
        maxp=80;
var
        i,j,k,a,b,c,max:integer;
        d:array[0..maxp] of integer;
begin
        readln(a,b,c);
        for i:= 1 to a do
        for j:= 1 to b do
        for k:= 1 to c do
                inc(d[i+j+k]);
        max:=0;
        for i:= 1 to maxp do
        if d[i]>d[max] then
                max:=i;
        writeln(max);
end.