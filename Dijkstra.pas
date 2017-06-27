const
        inp='Dijkstra.inp';
        out='Dijkstra.out';
type
        mang=record
        l,r,gt:integer;
        end;
var
        a:array[1..1000] of mang;
        s,i0,e,n,m:integer;
        kt:boolean;
        v,t,head:array[1..1000] of integer;
        d:array[1..1000] of byte;
procedure sort;
        var
                c:array[0..1000] of integer;
                x:array[1..1000] of mang;
                i:integer;
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
procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n do d[i]:=0;
        d[s]:=1;
        i0:=s;
        t[s]:=0;
        for i:= 1 to n do v[i]:=maxint;
        for i:= head[i0]+1 to head[i0+1] do
                begin
                v[a[i].r]:=a[i].gt;
                t[a[i].r]:=i0;
                end;
        end;
procedure chondinh;
        var
                min,cs,i:integer;
        begin
        min:=maxint;
        cs:=0;
        for i:= 1 to n do
        if d[a[i].r]=0 then
        if v[a[i].r]<min then
                begin
                cs:=a[i].r;
                min:=v[cs];
                end;
        if cs<>0 then
                begin
                d[cs]:=1;
                //t[cs]:=i0;
                i0:=cs;
                end
        else    kt:=false;
        end;
procedure suanhan;
        var
                i:integer;
        begin
        for i:= head[i0]+1 to head[i0+1] do
        if d[a[i].r]=0 then
        if v[a[i].r]>v[i0]+a[i].gt then
                begin
                v[a[i].r]:=v[i0]+a[i].gt;
                t[a[i].r]:=i0;
                end;
        end;
procedure dijkstra;
        begin
        init;
        kt:=true;
        repeat
                chondinh;
                if not kt then break;
                suanhan;
        until d[e]>0;
        end;
procedure ghikq;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,v[e]);
        i:=e;
        repeat
                write(f,i,'<-');
                i:=t[i];
        until t[i]=0;
        write(f,s);
        close(f);
        end;
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,s,e);
        m:=0;
        while not seekeof(f) do
                begin
                inc(m);
                read(f,a[m].l,a[m].r,a[m].gt);
                inc(head[a[m].l]);
                inc(head[a[m].r]);
                inc(m);
                a[m].l:=a[m-1].r;
                a[m].r:=a[m-1].l;
                a[m].gt:=a[m-1].gt;
                end;
        close(F);
        for i:= 2 to n do inc(head[i],head[i-1]);
        for i:= n+1 downto 2 do head[i]:=head[i-1];
        head[1]:=0
        end;

begin
        nhap;
        sort;
        dijkstra;
        ghikq;
end.
