type
        mang=record
        l,r:byte;
        gt:integer;
        end;
const
        inp='DATA.INP';
        out='DATA.OUT';
        inf=64;
        maxd=26;
var
        canh,luudem,min,dem:integer;
        head,v:array[1..27] of integer;
        //:array[1..26] of shortint;
        n,z,x,y,i0:byte;
        luukq,trace,a:array[1..26] of mang;
        kq:array[1..50] of string;
        visited:array[1..26] of boolean;
procedure setting(x,y:char;gt:integer);
        begin
        inc(canh);
        a[canh].l:=ord(x)-inf;
        a[canh].r:=ord(y)-inf;
        a[canh].gt:=gt;
        inc(head[a[canh].r]);
        inc(head[a[canh].l]);
        inc(canh);
        a[canh].l:=a[canh-1].r;
        a[canh].r:=a[canh-1].l;
        a[canh].gt:=gt;
        end;
procedure sort;
        var
                c:array[0..26] of byte;
                x:array[1..26] of mang;
                i:byte;
        begin
        for i:= 0 to maxd do c[i]:=0;
        for i:= 1 to canh do inc(c[a[i].l]);
        for i:= 1 to maxd do inc(c[i],c[i-1]);
        for i:= canh downto 1 do
                begin
                x[c[a[i].l]]:=a[i];
                dec(c[a[i].l]);
                end;
        a:=x;
        end;
procedure DFS(s:integer);
        var
                t,i:integer;
        begin

        if s=y then
                begin
                t:=0;
                for i:= 1 to dem-1 do
                if trace[i].gt<>trace[i+1].gt then
                        inc(t,1000);
                if t<min then
                        begin
                        min:=t;
                        luudem:=dem;
                        luukq:=trace;
                        end;
                end;
        for i:= head[s]+1 to head[s+1] do
        if not visited[a[i].r] then
                begin
                inc(dem);
                visited[s]:=true;
                trace[dem].r:=a[i].r;
                trace[dem].gt:=a[i].gt;
                DFS(a[i].r);
                trace[dem].r:=0;
                trace[dem].gt:=0;
                visited[s]:=false;
                dec(dem);
                end;
        end;
procedure path(i:integer);
        var
                j:integer;
        begin
        kq[i]:=chr(x+inf);
        for j:= 1 to luudem-1 do
        if luukq[j].gt<>luukq[j+1].gt then
                kq[i]:=kq[i]+chr(luukq[j].r+inf)+' '+chr(luukq[j].r+inf)
        else
                kq[i]:=kq[i]+chr(luukq[j].r+inf);
        kq[i]:=kq[i]+chr(y+inf);

        end;
procedure nhap;
        var
                f:text;
                i,j:integer;
                s:string;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do
                begin
                readln(f,s);
                for j:= 2 to length(s) do setting(s[j-1],s[j],i);
                end;
        for i:= 2 to canh do inc(head[i],head[i-1]);
        for i:= canh+1 downto 2 do head[i]:=head[i-1];
        head[1]:=0;
        sort;
        readln(f,z);
        for i:= 1 to z do
                begin
                readln(f,s);
                x:=ord(s[1])-inf;
                y:=ord(s[2])-inf;
                fillchar(visited,sizeof(visited),false);
                min:=maxint;
                dem:=0;
                DFS(x);
                path(i);
                end;
        close(f);
        end;
procedure ghikq;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        for i:= 1 to z do writeln(f,kq[i]);
        close(f);
        end;

begin
       nhap;
       ghikq;

end.
