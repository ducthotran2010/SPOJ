const
        inp='CPI.inp';
        out='CPI.out';
        maxn=100000;
var
        n,u,v,value,m:longint;
        res:extended;
        ITs,ITc:array[1..maxn*8] of longint;
        a:array[1..maxn] of longint;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure query1(l,r,k:longint);
        var
                m:longint;
        begin
        if (l>v)or(r<u) then exit;
        if (u<=l)and(r<=v) then
                begin
                ITc[k]:=ITc[k]+value;
                ITs[k]:=ITs[k]+{ITc[k]}value*(r-l+1);
                exit;
                end;
        m:=(l+r)div 2;
        query1(l,m,k*2);
        query1(m+1,r,k*2+1);
        ITs[k]:=ITs[k*2]+ITs[k*2+1]+ITc[k]*(r-l+1);
        end;
procedure query0(l,r,k,tmp:longint);
        var
                m:longint;
        begin
        if (l>v)or(r<u) then exit;
        if (u<=l)and(r<=v) then
                begin
                res:=res+ITs[k]+tmp;
                exit;
                end;
        m:=(l+r)div 2;
        query0(l,m,k*2,tmp+ITc[k]);
        query0(m+1,r,k*2+1,tmp+ITc[k]);
        end;
procedure initv(l,r,k:longint);
        var
                m:longint;
        begin
        if l=r then
                begin
                ITs[k]:=a[l];
                exit;
                end;
        m:=(l+r)div 2;
        initv(l,m,k*2);
        initv(m+1,r,k*2+1);
        ITs[k]:=ITs[k*2]+ITs[k*2+1];
        end;
procedure IPO;
        var
                f,fo:text;
                i,mode:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to n do read(f,a[i]);
        initv(1,n,1);
        assign(fo,out);
        rewrite(fo);
        for i:= 1 to m do
                begin
                read(f,mode);
                if mode=1 then
                        begin
                        readln(f,u,v,value);
                        query1(1,n,1);
                        end
                else
                        begin
                        res:=0;
                        readln(f,u,v);
                        query0(1,n,1,0);
                        res:=res/(v-u+1);
                        writeln(fo,res:0:4);
                        end;
                end;
        close(fo);
        close(f);
        end;
begin
        IPO;
end.