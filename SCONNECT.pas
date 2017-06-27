//Start code: 11:13am 28/10/2014
//Pause:      11:25am 28/10/2014
//Resume:     12:57am 28/10/2014
//First run:  01:29pm 28/10/2014
const
        inp='SCONNECT.inp';
        out='SCONNECT.out';
        maxn=100000;
        maxm=1000000;
type
        E=0..maxm;//Canh
        V=0..maxn;//Dinh
        specialarrays=record
        l,r:V;
        end;
var
        n:V;
        m:E;
        fo:text;
        count,top:longint;
        a:array[1..maxm] of specialarrays;
        stack,num,low:array[1..maxn] of V;
        d:array[1..maxn] of boolean;
        head:array[1..maxn] of E;
procedure input;
        var
                f:text;
                i:E;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to m do
                begin
                read(f,a[i].l,a[i].r);
                inc(head[a[i].l+1]);
                end;
        close(f);
        head[1]:=0;
        for i:= 2 to n+1 do head[i]:=head[i-1]+head[i];
        end;
procedure sort(l,r:V);
        var
                tmp:specialarrays;
                x,i,j:V;
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
procedure visit(s:V);
        var
                i:longint;
        function min(a,b:longint):longint;
                begin
                if a<b then min:=a else min:=b;
                end;
        begin
        inc(count);
        Low[s]:=count;
        Num[s]:=count;
        inc(top);
        Stack[top]:=s;
        for i:= head[s]+1 to head[s+1] do
        if not d[a[i].r] then
        if num[a[i].r]=0 then
                begin
                visit(a[i].r);
                low[s]:=min(low[s],low[a[i].r]);
                end
        else
                low[s]:=min(low[s],num[a[i].r]);
        if num[s]=low[s] then
                begin
                repeat
                        i:=stack[top];
                        dec(top);
                        write(fo,i,' ');
                        d[i]:=true;
                until s=i;
                writeln(fo);
                end;
        end;
procedure PP;
        var
                i:V;
        begin
        assign(fo,out);
        rewrite(fo);
        top:=0;
        count:=0;
        for i:= 1 to n do
        if num[i]=0 then
                visit(i);
        close(fo);
        end;
begin
        input;
        sort(1,n);
        PP;
end.