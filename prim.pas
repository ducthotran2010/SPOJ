uses crt;
const
        inp='Prim.inp';
type
        mang=record
        l,r,gt:integer;
        end;
var
        a:array[1..1000] of mang;
        head:array[1..1001] of integer;
        n,m:integer;
procedure nhap;
        var
                f:text;
                i,u,v,c:integer;
                dd:array[1..1000] of boolean;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        for i:= 1 to n do dd[i]:=false;
        i:=0;
        while not seekeof(f) do
                begin
                read(f,u,v,c);
                inc(i);
                a[i].l:=u;
                a[i].r:=v;
                a[i].gt:=c;
                inc(i);
                a[i].l:=v;
                a[i].r:=u;
                a[i].gt:=c;
                dd[u]:=true;
                dd[v]:=true;
                end;
        for u:= 1 to n do
        if not dd[i] then
                begin
                inc(i);
                a[i].l:=u;
                a[i].r:=0;
                end;
        m:=i;
        close(f);
        end;
procedure sort;
        var
                i:integer;
                c:array[0..1000] of word;
                x:array[1..1000] of mang;
        begin
        for i:= 0 to n do c[i]:=0;
        for i:= 1 to m do inc(c[a[i].l]);
        for i:= 1 to n do inc(c[i],c[i-1]);
        for i:= m downto 1 do
                begin
                x[c[a[i].l]]:=a[i];
                dec(c[a[i].l]);
                end;
        a:=x;
        end;
procedure sort2(l,h:word);
        var
                i,j:word;
                c:array[0..1000] of word;
                x:array[1..1000] of mang;
        begin
        fillchar(x,sizeof(x),0);
        for i:= 0 to n do c[i]:=0;
        for i:= l to h do inc(c[a[i].r]);
        for i:= 1 to n do inc(c[i],c[i-1]);
        for i:= h downto l do
                begin
                x[c[a[i].r]]:=a[i];
                dec(c[a[i].r]);
                end;
        j:=0;
        for i:= l to h do
                begin
                inc(j);
                x[j]:=a[i];
                end;
        end;
procedure chead;
        var
                h,j,i:integer;
        begin
        j:=1;
        h:=1;
        head[1]:=0;
        for i:= 2 to m do
        if a[i].l<>a[i-1].l then
                begin
                sort2(j,i-1);
                inc(h);
                head[h]:=i-1;
                end;
        head[h+1]:=m;
        for i:= 1 to m do write(a[i].l,' ');
        writeln;
        for i:= 1 to h+1 do write(head[i],' ');
        end;
procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n do d[i]:=0;
        d[1]:=1;
        i0:=1;
        for i:= 1 to n do v[i]:=maxint;
        for i:= head[1]+1 to head[1] do v[i]:=a[i].gt;
        end;
procedure chondinh;
        var
        begin
        min:=maxint;
        for i:= 1 to n do
        if d[i]=0 then
        if v[i]<min then
                begin
                min:=v[i];
                cs:=i;
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
begin
        nhap;
        sort;
        chead;
        prim;
end.
