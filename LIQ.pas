const
        {inp='LIQ.INP';
        out='LIQ.OUT';}
        maxn=30000;
        {maxa=10000;}
var
        a,d:array[1..maxn] of integer;
        n,max:integer;
procedure nhap;
        var
        //        f:text;
                i:integer;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n);
        for i:= 1 to n do read({f,}a[i]);
        {close(f);}
        end;
procedure find(l,r,i:integer);
        var
                x:integer;
        begin
        x:=(l+r) div 2;
        if l=r then
                begin
                if a[x]<a[i] then
                if d[x]>max then max:=d[x];
                end
        else
        if a[x]<a[i] then
                begin
                if d[x]>max then max:=d[x];
                Find(((l+r) div 2)+1,r,i);
                end
        else
                begin
                Find(l,(l+r)div 2,i);
                Find(((l+r)div 2)+1,r,i);
                end;
        end;
procedure xuly;
        var
                i:integer;
        begin
        d[1]:=1;
        for i:= 2 to n do
                begin
                max:=0;
                Find(1,i,i);
                d[i]:=max+1;
                end;
        end;
procedure ghikq;
        var
                i:integer;
        begin
        max:=d[1];
        for i:= 2 to n do
        if d[i]>max then max:=d[i];
        write(max);
        end;
begin
        nhap;
        xuly;
        ghikq;
end.
