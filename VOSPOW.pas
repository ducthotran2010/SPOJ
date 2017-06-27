const
        inp='VOSPOW.inp';
        maxn=10000000;
        maxc=1 shl 20;
var
        f:text;
        mul,seed,n,k,t,base:qword;
        a:array[1..maxn] of qword;
function aicap(x,n:qword):qword;
        var
                res,k:qword;
        begin
        k:=x;
        res:=1;
        while n>0 do
                begin
                if n and 1=1 then res:=res*k mod base;
                k:=k*k mod base;
                n:=n shr 1;
                end;
        exit(res);
        end;
procedure process;
        var
                res:qword;
                i:longint;
        begin
        res:=0;
        for i:= 1 to n do
                res:=(res+aicap(aicap(a[i],k),t))mod base;
        writeln(res);
        end;
procedure builda;
        var
                i:longint;
        begin
        a[1]:=(mul*seed+seed) mod maxC;
        for i:= 2 to n do a[i]:=(a[i-1]*mul+seed) mod maxC;
        end;
begin
        assign(f,inp);
        reset(f);
        readln(f,n,k,t,base);
        readln(f,mul,seed);
        close(f);
        builda;
        process;
end.
