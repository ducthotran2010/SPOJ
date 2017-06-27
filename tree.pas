const
        inp='tree.inp';
        out='tree.out';
        maxn=1000000;
type
        svalue=record
        l,r,v:longint;
        end;
var
        res1:int64;
        n,m,res2:longint;
        lP,lC:array[1..maxn] of int64;
        nC:array[1..maxn] of longint;
        a:array[1..(maxn-1)*2] of svalue;
        head:array[0..maxn] of longint;
        visited:array[1..maxn] of boolean;
procedure input;
        var
                f:text;
                i,u,v,k:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        m:=0;
        for i:= 1 to n-1 do
                begin
                readln(f,u,v,k);
                inc(m);
                a[m].l:=u;
                a[m].r:=v;
                a[m].v:=k;
                inc(m);
                a[m].l:=v;
                a[m].r:=u;
                a[m].v:=k;
                inc(head[u]);
                inc(head[v]);
                end;
        close(f);
        head[0]:=0;
        for i:= 1 to n do head[i]:=head[i-1]+head[i];
        end;
procedure DFS1(s:longint);
        var
                i:longint;
        begin
        visited[s]:=true;
        for i:= head[s-1]+1 to head[s] do
        if not visited[a[i].r] then
                begin
                nC[s]:=nC[s]+1;
                DFS1(a[i].r);
                nC[s]:=nC[s]+nC[a[i].r];
                lC[s]:=lC[s]+a[i].v*(1+nC[a[i].r])+lC[a[i].r];
                end;
        visited[s]:=false;
        end;
procedure DFS2(s:longint);
        var
                i:longint;
        begin
        for i:= head[s-1]+1 to head[s] do
        if not visited[a[i].r] then
                begin
                visited[a[i].r]:=true;
                lP[a[i].r]:=lC[s]-lC[a[i].r]-(nC[a[i].r]+1)*a[i].v+(n-nC[a[i].r]-1)*a[i].v+lP[s];
                DFS2(a[i].r);
                visited[a[i].r]:=false;
                end;
        end;
procedure process;
        var
                i:longint;
        begin
        for i:= 1 to n do begin nC[i]:=0;lC[i]:=0;lP[i]:=0;end;
        DFS1(1);
        visited[1]:=true;
        DFS2(1);
        res1:=lP[1]+lC[1];
        res2:=1;
        for i:= n downto 2 do
        if res1<lP[i]+lC[i] then
                begin
                res1:=lP[i]+lC[i];
                res2:=i;
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,res1,' ',res2);
        close(f);
        end;
procedure sort(l,r:longint);
        var
                tmp:svalue;
                x,i,j:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].l;
        repeat
                while a[i].l<x do inc(i);
                while a[j].l>x do dec(j);
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
begin
        input;
        sort(1,m);
        process;
        prinf;
end.
