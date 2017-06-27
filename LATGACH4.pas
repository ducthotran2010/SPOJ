const
        maxp=10000000;
        inf=111539786;
var
        i,t:byte;
        n:longint;
        f:array[1..maxP] of longint;
procedure init;
        var
                i:longint;
        begin
        f[1]:=1;
        f[2]:=1;
        for i:= 3 to maxP do
        f[i]:=(f[i-1]+f[i-2])mod inf;
        end;
function fi(n:longint):int64;
        var
                x,y:int64;
        begin
        if n<=maxP then
                exit(f[n]);
        if n mod 2 = 0 then
                begin
                x:=fi(n div 2-1);
                y:=fi(n div 2);
                exit(((x*2+y)*y) mod inf);
                end
        else
                begin
                x:=fi(n div 2);
                y:=fi(n div 2+1);
                x:=(x*x)mod inf;
                y:=(y*y)mod inf;
                exit((x+y)mod inf);
                end;
        end;
begin
init;
readln(t);
for i:= 1 to t do
        begin
        readln(n);
        writeln(fi(n+1));
        end;
end.
