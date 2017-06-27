const
        inp='';
        out='';
        maxn=100000;
type
        svalue=record
        l,r,v:longint;
        end;
var
        n,m:longint;
        res1,res2:int64;
        visited:array[1..maxn] of boolean;
        lmax:array[1..maxn] of int64;
        head:array[0..maxn] of longint;
        a:array[1..maxn] of svalue;
procedure input;
        var
                f:text;
                i,u,v,c:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        m:=0;
        for i:= 1 to n-1 do
                begin
                readln(f,u,v);
                inc(m);
                a[m].l:=u;
                a[m].r:=v;
                a[m].v:=1;
                inc(m);
                a[m].l:=v;
                a[m].r:=u;
                a[m].v:=1;
                inc(head[u]);
                inc(head[v]);
                end;
        close(f);
        head[0]:=0;
        for i:= 1 to n do head[i]:=head[i-1]+head[i];
        end;
procedure DFS(s:longint);
        var
                i,tmp:longint;
        begin
        visited[s]:=true;
        for i:= head[s-1]+1 to head[s] do
        if not visited[a[i].r] then
                begin
                DFS(a[i].r);
                if s<>1 then
                        begin
                        if Lmax[a[i].r]+a[i].v>lmax[s] then
                                LMax[s]:=LMax[a[i].r]+a[i].v;
                        end
                else
                        begin
                        if Lmax[a[i].r]+a[i].v>res2 then
                                res2:=lmax[a[i].r]+a[i].v;
                        if res2>res1 then
                                begin
                                tmp:=res1;
                                res1:=res2;
                                res2:=tmp;
                                end;
                        end;
                end;
        visited[s]:=false;
        end;
procedure process;
        begin
        res1:=0;
        res2:=0;
        DFS(1);
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,res1+res2);
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
