const
        inp='';
        out='';
        maxlb=17;
        maxn=131072;
type
        treetype=record
        max,c:longint;
        end;
var
        n,m,q,u,v,k,nb:longint;
        b:array[1..maxn] of treetype;
function max(a,b:longint):longint;inline;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure insertt;
        var
                fu,fv,nt:longint;
        procedure updatet(u:longint);
                begin
                while u>0 do
                        begin
                        if 2*u<maxn then
                        b[u].max:=max(b[2*u].max,b[2*u+1].max)+b[u].c else
                        b[u].max:=b[u].c;
                        u:=u div 2;
                        end;
                end;
        begin
        u:=nb+u-1;
        v:=nb+v-1;
        fu:=0;
        fv:=0;
        while u<>v do
                begin
                if (u and 1=1)and(fu=0) then
                        begin
                        fu:=1;
                        b[u].c:=b[u].c+k;
                        updatet(u);
                        end;
                if ((u and 1=0)and(fu=1))and(u+1<>v) then
                        begin
                        nt:=u+1;
                        b[nt].c:=b[nt].c+k;
                        updatet(nt);
                        end;
                if (v and 1=0)and(fv=0) then
                        begin
                        fv:=1;
                        b[v].c:=b[v].c+k;
                        updatet(v);
                        end;
                if ((v and 1=1)and(u+1<>v))and(fv=1) then
                        begin
                        nt:=v-1;
                        b[nt].c:=b[nt].c+k;
                        updatet(nt);
                        end;
                u:=u div 2;
                v:=v div 2;
                end;
        if fu=0 then
        if fv=0 then
                begin
                b[u].c:=b[u].c+k;
                updatet(u);
                end;
        if fu=1 then
        if fv=0 then
                begin
                nt:=v*2+1;
                b[nt].c:=b[nt].c+k;
                updatet(nt);
                end;
        if fu=0 then
        if fv=1 then
                begin
                nt:=u*2;
                b[nt].c:=b[nt].c+k;
                updatet(nt);
                end;
        end;
function countt:longint;
        var
                tmpu,tmpv,tmp,fu,fv:longint;
        begin
        tmpu:=0;
        tmpv:=0;
        u:=nb+u-1;
        v:=nb+v-1;
        fu:=0;
        fv:=0;
        while u<>v do
                begin
                if (u and 1=1)and(fu=0) then
                        begin
                        fu:=1;
                        tmpu:=max(tmpu,b[u].max);
                        end else
                if ((u and 1=0)and(fu=1))and(u+1<>v) then
                        tmpu:=max(tmpu+b[u].c,b[u+1].max)
                else
                        tmpu:=tmpu+b[u].c;
                if (v and 1=0)and(fv=0) then
                        begin
                        fv:=1;
                        tmpv:=max(tmpv,b[v].max);
                        end else
                if ((v and 1=1)and(fv=1))and(u+1<>v) then
                        tmpv:=max(tmpv+b[v].c,b[v-1].max)
                else
                        tmpv:=tmpv+b[v].c;
                u:=u div 2;
                v:=v div 2;
                tmp:=max(tmpu,tmpv);
                end;
        if fu=0 then
        if fv=0 then
                begin
                tmp:=max(tmp,b[u].max);
                u:=u div 2;
                end;
        if fu=0 then
        if fv=1 then
                tmp:=max(tmpv,b[u*2].max);
        if fu=1 then
        if fv=0 then
                tmp:=max(tmpu,b[v*2+1].max);
        while u>0 do
                begin
                tmp:=tmp+b[u].c;
                u:=u div 2;
                end;
        exit(tmp);
        end;
procedure solveNB;
        var
                i,k:longint;
        begin
        k:=n-1;
        for i:=maxlb downto 1 do
        if k shr i>0 then break;
        nb:=1 shl (i+1);
        end;
procedure IPO;
        var
                f,fo:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        solveNB;
        for i:= 1 to m do
                begin
                readln(f,u,v,k);
                insertt;
                end;
        readln(f,q);
        assign(fo,out);
        rewrite(fo);
        for i:= 1 to q do
                begin
                readln(f,u,v);
                writeln(fo,countt);
                end;
        close(fo);
        close(f);
        end;
begin
        IPO;
end.


