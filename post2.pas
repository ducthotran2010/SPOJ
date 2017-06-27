const
        maxn=100000;
        maxgt=50000;
        inp='';
var
na,nb:longint;
found:boolean;
a,b:array[1..maxn] of longint;
da,db,dd:array[-maxgt..maxgt] of qword;
procedure input;
        var
                f:text;
                n,i,c:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        na:=0;
        nb:=0;
        for i:= 1 to n do
                begin
                inc(na);
                read(f,a[na]);
                if da[a[na]]>0 then dec(na);
                inc(da[a[na]]);
                end;
        readln(f);
        for i:= 1 to n do
                begin
                inc(nb);
                read(f,b[nb]);
                if db[b[nb]]>0 then dec(nb);
                inc(db[b[nb]]);
                end;
        readln(f);
        for i:= 1 to n do
                begin
                read(f,c);
                inc(dd[c]);
                end;
        close(f);
        end;
procedure process;
        var
                count:qword;
                i,j:longint;
        begin
        count:=0;
        for i:= 1 to na do
        for j:= 1 to nb do
        if a[i]+b[j]<=maxgt then
        if a[i]+b[j]>=-maxgt then
                count:=count+da[a[i]]*db[b[j]]*dd[a[i]+b[j]];
        write(count);
        end;
begin
        input;
        process;
end.
