uses crt;
const inp='dothi1.inp';
      out='dothi.out';
      maxdinh=100000;
      maxcanh=1000000;
type
     xet = record
                f,l:longint;
                end;
     ta=array[1..maxcanh] of xet;
     th=array[1..maxdinh] of longint;
     tv=array[1..maxdinh] of boolean;
var n,m,s,t:longint;
    a:ta;
    head:th;
    tim:boolean;
    v:tv;
    fi:text;
procedure sapxep(l,r:longint);
        var tam:xet;
            i,j:longint;

        begin
        for i:= l to r do
        for j:= l to r do
                if a[j].f>a[i].f then
                begin
                tam:=a[i];
                a[i]:=a[j];
                a[j]:=tam;
                end;
        end;
procedure sapxep2(l,r:longint);
        var tam:xet;
            i,j:longint;

        begin
        for i:= l to r do
        for j:= l to r do
                if a[j].l>a[i].l then
                begin
                tam:=a[i];
                a[i]:=a[j];
                a[j]:=tam;
                end;
        end;
procedure nhap;
        var
                ktdinh:tv;
                fi:text;
                i,u,v:longint;
        begin
        assign(fi,inp);
        reset(fi);
        readln(fi,n,m,s,t);
        for i:= 1 to m do
                readln(fi,a[i].f,a[i].l);
        close(fi);
        for i:= 1 to n do ktdinh[i]:=false;
        for i:= 1 to m do
                if a[i].f in [1..n] then ktdinh[a[i].f]:=true;
        for i:= 1 to n do
                if ktdinh[i]=false then
                begin
                inc(m);
                a[m].f:=i;
                a[m].l:=0;
                end;
        sapxep(1,m);
        u:=1;
        v:=1;
        for i:= 2 to m do
                if a[i-1].f<>a[i].f then
                        begin
                        v:=i-1;
                        sapxep2(u,v);
                        u:=i;
                        end;
        u:=1;
        v:=0;
        head[u]:=0;
        for i:= 2 to m do
                if a[i-1].f<>a[i].f then
                        begin
                        v:=i-1;
                        inc(u);
                        head[u]:=v;
                        end;
        for i:= 1 to m do write(a[i].l:3);
        writeln;
        for i:= 1 to u do write(head[i]:3);
        writeln;
        end;
procedure Dfs(u:longint);
        var j:longint;
        begin
        if u=t then
                begin
                        tim:=true;
                        write(fi,t:7);
                end;
        j:=0;
        if not tim then
                for j:= head[u]+1 to head[u+1] do
                        if a[j].l<>0 then
                        if not v[a[j].l] then
                                begin
                                if not v[u] then
                                write(fi,u:7);
                                v[u]:=true;
                                dfs(a[j].l);
                                if tim then break;
                                end;
        end;
begin
        clrscr;
        nhap;
        tim:=false;
        assign(fi,out);
        rewrite(fi);
        dfs(s);
        if not tim then
                begin
                rewrite(fi);
                write(fi,'There is no way from ',s,' to ',t);
                end;
        close(fi);
        writeln('DONE!');
        {for s:= 1 to n do
                if rs[s] then write(s:6);}
        readln;
end.
