const
        inp='';
        maxn=50000;
        maxint=high(longint);
        minint=low(longint);
var
        n,m,u,v,minv,maxv:longint;
        a:array[1..maxn] of longint;
        ITmin,ITmax:array[1..maxn*8] of longint;
function max(a,b:longint):longint;inline;
        begin
        if a>b then max:=a else max:=b;
        end;
function min(a,b:longint):longint;inline;
        begin
        if a<b then min:=a else min:=b;
        end;
procedure initv(k,l,r:longint);
        var
                m:longint;
        begin
        if l=r then
                begin
                ITmax[k]:=a[l];
                ITmin[k]:=a[l];
                exit;
                end;
        m:=(l+r)div 2;
        initv(k*2,l,m);
        initv(k*2+1,m+1,r);
        ITmax[k]:=max(ITmax[k*2],ITmax[k*2+1]);
        ITmin[k]:=min(ITmin[k*2],ITmin[k*2+1]);
        end;
procedure query(k,l,r:longint);
        var
                m:longint;
        begin
        if (l>v)or(u>r) then exit;
        if (u<=l)and(r<=v) then
                begin
                maxv:=max(ITmax[k],maxv);
                minv:=min(ITmin[k],minv);
                exit;
                end;
        m:=(l+r)div 2;
        query(k*2,l,m);
        query(k*2+1,m+1,r);
        end;
procedure IPO;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to n do read(f,a[i]);
        initv(1,1,n);
        for i:= 1 to m do
                begin
                readln(f,u,v);
                minv:=maxint;
                maxv:=minint;
                query(1,1,n);
                writeln(maxv-minv);
                end;
        close(f);
        end;
begin
        IPO;
end.