//uses crt;
const
//      inp='TongmaxLT.inp';
        maxn=50000;
var
        a:array[1..maxn] of integer;
        n,m:longint;
procedure nhap;
        var
        //      f:text;
                i,u,v:longint;
        procedure xuli(l,r:longint);
        var
                max,tmp,i,d,c:longint;
        begin
        max:=a[l];
        tmp:=0;
        d:=l;
        c:=l;
        for i:= l to r do
                begin
                tmp:=tmp+a[i];
                if tmp>max then
                        begin
                        max:=tmp;
                        c:=i;
                        end;
                if tmp<0 then
                        begin
                        tmp:=0;
                        d:=i+1;
                        end;
                end;
        writeln(max);
        end;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n);
        for i:= 1 to n do read({f,}a[i]);
        readln({f,}m);
        for i:= 1 to m do
                begin
                readln({f,}u,v);
                xuli(u,v);
                end;
        //close(f);
        end;
begin
        nhap;
end.
