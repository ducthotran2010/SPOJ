const
        inp='TOUR.INP';
        out='TOUR.OUT';
type
        mang=record
        l,r:integer;
        end;
var
        f,queue,head,trace:array[1..100] of integer;
        //8trace:array[-1..100] of integer;
        a:array[1..100] of mang;
        count,n,m,k,s:integer;
procedure nhap;
        var
                i,lm:integer;
                fi:text;
        begin
        assign(fi,inp);
        reset(fi);
        read(fi,n,k,m);
        read(fi,s);
        for i:= 1 to k do read(fi,f[i]);
        lm:=m;
        m:=0;
        for i:= 1 to lm do
                begin
                inc(m);
                read(fi,a[m].l,a[m].r);
                inc(head[a[m].l]);
                inc(head[a[m].r]);
                inc(m);
                a[m].l:=a[m-1].r;
                a[m].r:=a[m-1].l;
                end;
        for i:= 2 to m do inc(head[i],head[i-1]);
        for i:= m+1 downto 2 do head[i]:=head[i-1];
        head[1]:=0;
        close(fi);
        end;
procedure sort;
        var
                c:array[0..100] of integer;
                i:integer;
                x:array[1..100] of mang;
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
procedure BFS(s:integer);
        var
                d,u,c,i,k0,j:integer;
                //ktt,kt:boolean;
                //visited:array[0..100] of boolean;
        begin
        //fillchar(visited,sizeof(visited),false);
        fillchar(trace,sizeof(trace),0);
        d:=0;
        c:=1;
        //kt:=false;
        queue[1]:=s;
        trace[1]:=-1;
        repeat
                inc(d);
                //ktt:=false;
                u:=queue[d];
                //visited[u]:=true;
                //dem:=0;
                for i:= head[u]+1 to head[u+1] do
                if trace[a[i].r]=0 then
                        begin
                        //visited[a[i].r]:=true;
                        inc(c);
                        queue[c]:=a[i].r;
                        trace[a[i].r]:=u;
                        end;
        until d>=c;
        end;
procedure ghikq;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        write(f,count);
        close(f);
        end;
procedure DBFS;
        var
                i,j:integer;
        begin
        for i:= k+1 downto 2 do f[i]:=f[i-1];
        f[1]:=s;
        inc(k);

        count:=0;
        for i:= 2 to k do
                begin
                BFS(f[i-1]);
                j:=f[i];
                repeat
                        inc(count);
                        j:=trace[j];
                until j=f[i-1];
                //f[j-1];
                //dec(count,2);
                end;
        //inc(count,k-2);
        end;
begin
        nhap;
        sort;
        DBFS;
        ghikq;
end.
