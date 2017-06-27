const
        maxn=20;
        inp='';
var
found:boolean;
s,k,n:byte;
tmp:integer;
luu,x:array[0..maxn] of byte;
a:array[1..maxn,1..maxn] of byte;
procedure nhap;
        var
                f:text;
                i,j:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,s,k,n);
        for i:= 1 to n do
        for j:= 1 to k do read(f,a[i,j]);
        close(f);
        end;
procedure try(i:byte);
        var
                j:byte;
        begin
        for j:= 1 to n do
        if not found then
                begin
                x[i]:=a[j,i];
                tmp:=tmp+a[j,i];
                if tmp<=s then
                if x[i]>=x[i-1] then
                        begin
                        if i=k then
                        if tmp=s then
                                begin
                                found:=true;
                                luu:=x;
                                exit;
                                end;
                        if i<>k then try(i+1);
                        end;
                tmp:=tmp-a[j,i];
                end;
        end;
procedure ghikq;
        var
                i:byte;
        begin
        if found then
                begin
                writeln('YES');
                for i:= 1 to k do write(luu[i],' ')
                end
        else
                writeln('NO');
        end;
begin
        nhap;
        tmp:=0;
        found:=false;
        x[0]:=0;
        try(1);
        ghikq;
end.
