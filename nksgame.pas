const
        maxn=100000;
        inp='';
type
        SValue=array[1..maxn] of longint;
var
n,min:longint;
a,b:SValue;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        for i:= 1 to n do read(f,b[i]);
        close(f);
        end;
procedure QSort(l,r:longint;var a:SValue);
        procedure sort(l,r:longint);
        var
                tmp,x,i,j:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2];
        repeat
                while a[i]<x do inc(i);
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
        begin
        sort(l,r);
        end;
procedure process;
        var
                i,j,e:longint;
        begin;
        e:=n;
        for i:= 1 to n do
        for j:= e downto 1 do
                begin
                if a[i]+b[j]=0 then
                        begin
                        min:=0;
                        exit;
                        end else
                if a[i]+b[j]<0 then
                        begin
                        if -(a[i]+b[j])<min then min:=-(a[i]+b[j]);
                        break;
                        end;
                if a[i]+b[j]<min then min:=a[i]+b[j];
                e:=j;
                end;
        end;
begin
        input;
        QSort(1,n,a);
        QSort(1,n,b);
        min:=high(longint);
        process;
        writeln(min);
end.
