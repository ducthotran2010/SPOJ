const
        inp='LIQUORS.inp';
        out='LIQUORS.out';
        maxn=100000;
var
        n,m:longint;
        nex,pre,a,Ha,Ne:array[-1..maxn] of longint;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        m:=2*n;
        for i:= 1 to m do read(f,a[i]);
        close(f);
        end;
procedure sort(l,r:longint);
        var
                tmp,x,i,j:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2];
        repeat
                while a[i]<x do inc(i);
                while a[j]>x do dec(j);
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
procedure process;
        var
                i,j,s,sav,min:longint;
        begin
        for i:=1 to m do nex[i]:=i+1;
        for i:=1 to m do pre[i]:=i-1;
        nex[m]:=-1;
        pre[1]:=-1;
        s:=1;
        for i:= 1 to n do
                begin
                while nex[s]=-2 do inc(s);
                j:=s;
                min:=high(longint);
                repeat
                        if abs(a[nex[j]]-a[j])<=min then
                                begin
                                min:=abs(a[nex[j]]-a[j]);
                                sav:=j;
                                end;
                        j:=nex[j];
                until nex[j]=-1;
                Ha[i]:=a[sav];
                Ne[i]:=a[nex[sav]];
                nex[pre[sav]]:=nex[nex[sav]];
                pre[nex[nex[sav]]]:=pre[sav];
                nex[nex[sav]]:=-2;
                nex[sav]:=-2;
                end;
        end;
procedure prinf;
        var
                f:text;
                i:longint;
        begin
        assign(f,out);
        rewrite(f);
        for i:= 1 to n do write(f,Ne[i],' ');
        writeln(f);
        for i:= 1 to n do write(f,Ha[i],' ');
        close(f);
        end;
begin
        input;
        sort(1,m);
        process;
        prinf;
end.
