const
       { inp='COLOREC.inp';
        out='COLOREC.out'; }
        maxn=100000;
type
        mang=record
        x,y:integer;
        gt:byte;
        end;
var
        count,n:longint;
        d:array[-200..200,-200..200] of byte;
        a:array[1..maxn] of mang;

procedure nhap;
        var
                {f:text;}
                i:longint;
        begin
        {assign(f,inp);
        reset(f);}
        readln({f,}n);
        fillchar(d,sizeof(d),0);
        for i:= 1 to n do
                begin
                readln({f,}a[i].x,a[i].y,a[i].gt);
                d[a[i].x,a[i].y]:=a[i].gt;
                end;
        {close(f);   }
        end;
procedure xuli;
        var
                i,j:longint;
        begin
        count:=0;
        for i:= 1 to n do
        for j:= i to n do
        if a[i].x<>a[j].x then
        if a[i].y<>a[j].y then
        if a[i].gt<>a[j].gt then
        if a[i].gt*a[j].gt*d[a[i].x,a[j].y]*d[a[j].x,a[i].y]=24 then
        if a[i].gt+a[j].gt+d[a[i].x,a[j].y]+d[a[j].x,a[i].y]=10 then
                inc(count);
        end;
procedure ghikq;
        {var
                f:text;
        }begin
        {assign(f,out);
        rewrite(f);
        }write({f,}count div 2);
        {close(f);}
        end;
begin
        nhap;
        xuli;
        ghikq;
end.

