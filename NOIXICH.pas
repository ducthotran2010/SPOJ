const
        {inp='NOIXICH.INP';
        out='NOIXICH.OUT';}
        maxn=20000;
var
a:array[-2..maxn] of integer;
time:integer;
procedure nhap;
        var
                {f:text;}
                i:integer;
        begin
        {assign(f,inp);
        reset(f);}
        read({f,}a[0]);
        a[-1]:=0;
        for i:= 1 to a[0] do
                begin
                read({f,}a[i]);
                if a[i]<a[0] then inc(a[-1]);
                end;
        {close(f);}
        end;
procedure sort(l,r:integer);
        var
                i,j,tmp,x:integer;
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
procedure xuli;
        var
                i,tmp:integer;
        begin
        sort(1,a[0]);
        if a[-1]=0 then
                time:=a[0]-1
        else
        begin
        time:=0;
        a[-2]:=a[0]-a[-1];
        while (a[0]>1) and (a[-1]<>0) do
                begin
                tmp:=a[1];
                if tmp>=a[0] then
                        begin
                        time:=time+a[0]-1;
                        break;
                        end;
                time:=time+tmp;
                for i:= a[0] downto a[0]-tmp do a[i]:=0;
                a[-1]:=a[-1]-tmp-2+a[-2];
                a[0]:=a[0]-tmp-1;
                a[-2]:=a[0]-a[-1];
                a[a[0]+1]:=-1;
                for i:= 2 to a[0]+1 do a[i-1]:=a[i];
                end;
        end;
        end;
procedure ghikq;
        begin
        write(time);
        end;
begin
        nhap;
        xuli;
        ghikq;
end.
