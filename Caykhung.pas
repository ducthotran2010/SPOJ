const
        inp='Caykhung.inp';
        out='Caykhung.out';
        maxdinh=200;
type
        mang=record
        l,r,v:integer;
        end;
var
        i0,dem,n,m:integer;
        a:array[1..maxdinh,1..maxdinh] of integer;
        trace:array[1..maxdinh] of mang;
        d:array[1..maxdinh] of byte;
        t,v:array[1..maxdinh] of integer;
procedure nhap;
        var
                f:text;
                i,x,y,c:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        for i:= 1 to m do
                begin
                read(f,x,y,c);
                a[x,y]:=c;
                a[y,x]:=c;
                end;
        close(f);
        end;
procedure init;
        var
                i:integer;
        begin
        fillchar(d,sizeof(d),0);
        i0:=1;
        d[i0]:=1;
        t[i0]:=-1;
        for i:= 1 to n do v[i]:=maxint;
        for i:= 1 to n do
                if a[i0,i]<>0 then
                begin
                v[i]:=a[i0,i];
                t[i]:=i0;
                end;
        end;
procedure chondinh;
        var
                cs,i,min:integer;
        begin
        min:=maxint;
        for i:= 1 to n do
        if d[i]=0 then
        if min>v[i] then
                begin
                min:=v[i];
                cs:=i;
                end;
        inc(dem);
        trace[dem].l:=t[cs];
        trace[dem].r:=cs;
        trace[dem].v:=a[cs,t[cs]];
        d[cs]:=1;
        i0:=cs;
        end;
procedure suanhan;
        var
                i:integer;
        begin
        for i:= 1 to n do
        if d[i]=0 then
        if v[i]>v[i0]+a[i0,i] then
                begin
                v[i]:=v[i0]+a[i0,i];
                t[i]:=i0;
                end;
        end;
procedure prim;
        begin
        init;
        dem:=0;
        repeat
                chondinh;
                suanhan;
        until dem=n-1;
        end;
procedure ghikq;
        var
                f:text;
                t,i:integer;
        begin
        assign(f,out);
        rewrite(f);
        t:=0;
        for i:= 1 to dem do
                begin
                writeln(f,trace[i].l,' ',trace[i].r,' ',trace[i].v);
                t:=t+trace[i].v;
                end;
        write(f,t);
        close(F);
        end;
begin
        nhap;
        prim;
        ghikq;
end.
