const
        inf=20122007;
        maxp=5000000;
var
        n:longint;
        v:array[1..maxp] of longint;
procedure init;
        var
                i:longint;
        begin
        v[1]:=3;
        for i:= 2 to maxp do v[i]:=(v[i-1]*3) mod inf;
        end;
function getv(i:longint):longint;
        var
                v1,v2:int64;
        begin
        if i<=maxp then exit(v[i]);
        if i mod 2 = 0 then
                begin
                v1:=getv(i div 2);
                exit((v1*v1)mod inf);
                end
        else
                begin
                v1:=getv(i div 2);
                v2:=getv(i div 2+1);
                exit(v1*v2 mod inf);
                end;
        end;
procedure process;
        var
                i,m:longint;
                res,v1,v2:int64;
        begin
        m:=trunc(sqrt(n));
        res:=1;
        for i:= 1 to m do
        if n mod i=0 then
                begin
                if n div i<>i then
                        begin
                        v1:=getv(i)-1;
                        v2:=getv(n div i)-1;
                        res:=((v1*v2)mod inf*res)mod inf;
                        end
                else
                        begin
                        v1:=getv(i)-1;
                        res:=(v1*res)mod inf;
                        end;
                end;
        writeln(res);
        end;
begin
        readln(n);
        init;
        process;
end.
