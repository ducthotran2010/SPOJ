const
        max=1000;
        inp='';
var
n,m:integer;
a:array[1..max] of longint;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(F,inp);
        reset(f);
        readln(f,n,m);
        for i:=1 to m do readln(f,a[i]);
        close(F);
        end;
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
procedure process;
        var
                i,max,cs:longint;
                sl:integer;
        begin
        max:=0;
        cs:=0;
        for i:= 1 to m do
                begin
                sl:=m-i+1;
                if sl>n then sl:=n;
                if sl*a[i]>max then
                        begin
                        max:=sl*a[i];
                        cs:=a[i];
                        end;
                end;
        write(cs,' ',max);
        end;

begin
        input;
        sort(1,m);
        process;
end.
