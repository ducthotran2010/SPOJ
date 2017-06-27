const
        inp='';
        maxn=50000;
var
        res,pre,n,u,v:longint;
        a:array[1..maxn] of longint;
        ITsum,ITans,ITp,ITs:array[1..maxn*8] of longint;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure initV(k,l,r:longint);
        var
                mid:longint;
        begin
        if l=r then
                begin
                ITsum[k]:=a[l];
                ITs[k]:=a[l];
                ITp[k]:=a[l];
                ITans[k]:=a[l];
                exit;
                end;
        mid:=(l+r)div 2;
        initv(k*2,l,mid);
        initv(k*2+1,mid+1,r);
        ITsum[k]:=ITsum[k*2]+ITsum[k*2+1];
        ITp[k]:=max(ITp[k*2],ITp[k*2+1]+ITsum[k*2]);
        ITs[k]:=max(ITs[k*2+1],ITs[k*2]+ITsum[k*2+1]);
        ITans[k]:=max(max(ITans[k*2],ITans[k*2+1]),ITp[k*2+1]+ITs[k*2]);
        end;
procedure query(k,l,r:longint);
        var
                mid:longint;
        begin
        if (l>v)or(r<u) then exit;
        if (u<=l)and(r<=v) then
                begin
                res:=max(res,max(pre+ITp[k],ITans[k]));
                pre:=max(0,max(pre+ITsum[k],ITs[k]));
                exit;
                end;
        mid:=(l+r)div 2;
        query(k*2,l,mid);
        query(k*2+1,mid+1,r);
        end;
procedure IPO;
        var
                f:text;
                i,m:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        initv(1,1,n);
        readln(f,m);
        for i:= 1 to m do
                begin
                readln(f,u,v);
                res:=low(longint);
                pre:=0;
                query(1,1,n);
                writeln(res);
                end;
        close(f);
        end;
begin
        IPO;
end.