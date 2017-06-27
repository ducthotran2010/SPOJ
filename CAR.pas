const
        inp='';
        maxn=10000;
type
        real=double;
        SValue=record
        m,l:integer;
        d:byte;
        h:real;
        end;
var
        n:integer;
        a:array[1..maxn] of SValue;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i].m);
        for i:= 1 to n do read(f,a[i].d);
        for i:= 1 to n do a[i].l:=i;
        close(f);
        end;
procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n do a[i].h:=a[i].m/a[i].d;
        end;
procedure sort(l,r:integer);
        var
                tmp:SValue;
                x:real;
                i,j:integer;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].h;
        repeat
                while a[i].h>x do inc(i);
                while a[j].h<x do dec(j);
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
                i:integer;
                sm,days:int64;
        begin
        sm:=0;
        days:=0;
        for i:= 1 to n do
                begin
                days:=days+a[i].d;
                sm:=sm+days*a[i].m;
                end;
        writeln(sm);
        for i:= 1 to n do write(a[i].l,' ');
        end;
begin
        input;
        init;
        sort(1,n);
        prinf;
end.