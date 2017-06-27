const
        maxkn=200000;
        {inp='NKBUS.inp';}
var
        n,m,sumt:longword;
        a:array[0..maxkn] of longword;
procedure nhap;
        var
                {f:text;}
                t,i,j,k:longint;
        begin
        {assign(f,inp);
        reset(f);}
        readln({f,}n,m);
        sumt:=0;
        a[0]:=0;
        t:=0;
        for i:= 1 to n do
                begin
                sumt:=sumt+t;
                read({f,}t,k);
                for j:= 1 to k do
                        begin
                        inc(a[0]);
                        read({f,}a[a[0]]);
                        if a[a[0]]-sumt>0 then
                                dec(a[a[0]],sumt)
                        else
                                a[a[0]]:=0;
                        end;
                end;
        inc(sumt,t);
        {close(f);}
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
procedure ghikq;
        begin
        if m>a[0] then
                write(sumt+a[a[0]])
        else
                write(sumt+a[m]);
        end;
begin
        nhap;
        sort(1,a[0]);
        ghikq;
end.
