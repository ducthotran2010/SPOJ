const
        inp='RACE.INP';
        out='RACE.OUT';
type
        mang=record
        cs,gt:longint;
        end;
        index=array[1..100000] of mang;
var
        n:longint;
        a,b,c:index;
        writeb:boolean;
        maxa,maxb:longint;
procedure nhap;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        read(f,n);
        maxa:=0;
        maxb:=0;
        for i:= 1 to n do
                begin
                read(f,a[i].gt);
                if a[i].gt>maxa then maxa:=a[i].gt;
                a[i].cs:=i;
                end;
        for i:= 1 to n do
                begin
                read(f,b[i].gt);
                b[i].cs:=i;
                end;
        close(f);
        end;
procedure sort1(l,r:longint;var a:index);
        var
                i,j,x:longint;
                tmp:mang;
        begin
        i:= l;
        j:= r;
        x:=a[(l+r) div 2].gt;
        repeat
                while a[i].gt<x do inc(i);
                while a[j].gt>x do dec(j);
                if i<=j then
                begin
                tmp:=a[i];
                a[i]:=a[j];
                a[j]:=tmp;
                inc(i);
                dec(j);
                end;
        until i>j;
        if l<j then sort1(l,j,a);
        if i<r then sort1(i,r,a)
        end;
procedure sort2(l,r:longint);
        var
                i,j,x:longint;
                tmp:mang;
        begin
        i:= l;
        j:= r;
        x:=b[(l+r) div 2].gt;
        repeat
                while b[i].gt>x do inc(i);
                while b[j].gt<x do dec(j);
                if i<=j then
                begin
                tmp:=b[i];
                b[i]:=b[j];
                b[j]:=tmp;
                inc(i);
                dec(j);
                end;
        until i>j;
        if l<j then sort2(l,j);
        if i<r then sort2(i,r);
        end;
procedure init;
        var
                i,pointb,pointc:longint;
        begin
        sort1(1,n,a);
        sort2(1,n);
        c:=b;
        writeb:=true;
        for i:= 1 to n do
        if b[i].gt<=maxa then begin sort1(i,n,b); break;end;
        for i:= 1 to n do
        if c[i].gt<maxa then begin sort1(i,n,c); break;end;
        pointb:=0;
        pointc:=0;
        for i:= 1 to n do
                begin
                if a[i].gt>b[i].gt then inc(pointb) else
                if a[i].gt<b[i].gt then dec(pointb);
                if a[i].gt>c[i].gt then inc(pointc) else
                if a[i].gt<c[i].gt then dec(pointc);
                end;
        if pointc>pointb then writeb:=false;
        end;
procedure ghikq;
        var
                f:text;
                i:longint;
        begin
        assign(f,out);
        rewrite(f);
        if writeb then
                for i:= 1 to n do writeln(f,a[i].cs,' ',b[i].cs)
        else
                for i:= 1 to n do writeln(f,a[i].cs,' ',c[i].cs);
        close(f);
        end;
begin
        nhap;
        init;
        ghikq;
end.
