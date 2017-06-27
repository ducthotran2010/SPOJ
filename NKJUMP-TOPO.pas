const
        inp='';
        out='';
        maxn=1000;
var
        n:integer;
        a:array[1..maxn] of longint;
        f:array[1..maxn] of integer;
        c:array[1..maxn,1..maxn] of byte;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure sort(l,r:integer);
        var
                i,j:integer;
                tmp,x:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r)div 2];
        repeat
                while x>a[i] do inc(i);
                while a[j]>x do dec(j);
                if i<=j then
                        begin
                        tmp:=a[i];
                        a[i]:=a[j];
                        a[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
        end;
procedure init;
        var
                k,l,r,e:integer;
        begin
        for k:= 3 to n do
                begin
                e:=k-1;
                for l:= 1 to k-1 do
                for r:= e downto l+1 do
                if a[l]+a[r]=a[k] then
                        begin
                        c[l,k]:=1;
                        c[r,k]:=1;
                        end
                else if a[l]+a[r]<a[k] then
                        begin
                        e:=r;
                        break;
                        end;
                end;
        end;
procedure process;
        var
                i,j,max:integer;
        begin
        f[n]:=0;
        max:=0;
        for i:= n-1 downto 1 do
                begin
                f[i]:=0;
                for j:=i+1 to n do
                if c[i,j]=1 then
                if f[i]<f[j]+1 then
                        f[i]:=f[j]+1;
                if max<f[i] then max:=f[i];
                end;
        writeln(max+1);
        end;
begin
        input;
        sort(1,n);
        init;
        process;
end.