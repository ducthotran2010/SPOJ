const
        maxd=100;
        maxn=100000;
        inp='';
type
        specialvalues=record
        v,l:longint;
        end;
var
        n:longint;
        f:array[1..maxn] of longint;
        a:array[1..maxn] of specialvalues;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do readln(f,a[i].v);
        close(f);
        end;
procedure sort(l,r:longint);
        var
                tmp:specialvalues;
                x,i,j:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].v;
        repeat
                while a[i].v<x do inc(i);
                while a[j].v>x do dec(j);
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
procedure init;
        var
                i:longint;
        begin
        for i:= 1 to n do a[i].l:=i;
        end;
procedure rebuild;
        var
                i:longint;
        begin
        for i:= 1 to n do f[i]:=1;
        end;
procedure process;
        var
                d:byte;
                i,j,res,x:longint;
        function max(a,b:longint):longint;
                begin
                if a>b then max:=a else max:=b;
                end;
        procedure search;
                var
                        l,r:longint;
                begin
                l:=1;
                r:=n;
                repeat
                        if a[(l+r)div 2].v<x then
                                l:=(l+r) div 2+1
                        else if a[(l+r)div 2].v>x then
                                r:=(l+r) div 2-1
                        else
                                begin
                                if a[(l+r)div 2].l<a[i].l then
                                f[i]:=max(f[i],1+f[(l+r)div 2]);
                                if a[r].v=x then
                                if a[r].l<a[i].l then
                                f[i]:=max(f[i],1+f[r]);
                                r:=r-1;
                                if l>=r then break;
                                end;
                until l>r;
                end;
        begin
        res:=0;
        for d:= 1 to maxd do
        begin
        rebuild;
        for i:= 1 to n do
                begin
                x:=a[i].v-d;
                search;
                res:=max(res,f[i]);
                end;
        end;
        writeln(res);
        end;
begin
        input;
        init;
        sort(1,n);
        process;
end.
