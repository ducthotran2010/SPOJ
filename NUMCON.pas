// Edited
const
        inp='';
var
a:array[1..100] of ansistring;
n:byte;
procedure input;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        n:=0;
        while not eof(f) do
                begin
                inc(n);
                readln(f,a[n]);
                a[n]:=a[n]+a[n][1];
                end;
        close(f)
        end;
procedure sort(l,r:byte);
        var
                tmp,x:ansistring;
                i,j:byte;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2];
        repeat
                while a[i]>x do inc(i);
                while a[j]<x do dec(j);
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
procedure prinf;
        var
                i:byte;
        begin
        for i:= 1 to n do write(copy(a[i],1,length(a[i])-1));//pos('A',a[i])-1));
        end;
begin
        input;
        sort(1,n);
        prinf;
end.
