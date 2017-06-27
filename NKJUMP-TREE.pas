const
        maxn=1000;
        maxb=2048;
        oo=0;
type
        rec=record
        v:longint;//value
        i:integer;//locate on a array
        end;
        tree=array[1..maxb] of rec;
var
n:integer;
t:tree;
a:array[1..maxn] of rec;
d:array[1..maxn] of integer;
procedure input;
        var
                f:text;
                i:integer;
        begin
        readln(n);
        for i:= 1 to n do
                begin
                read(a[i].v);
                a[i].i:=1;
                end;
        end;
procedure sort(l,r:integer);
        var
                i,j:integer;
                tmp,x:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r)div 2].v;
        repeat
                while x>a[i].v do inc(i);
                while a[j].v>x do dec(j);
                if i<=j then
                        begin
                        tmp:=a[i].v;
                        a[i].v:=a[j].v;
                        a[j].v:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
        end;
procedure ctree;
        var
                i:integer;
                locate:integer;
        procedure insert(x:longint;var i:integer);
                begin
                if t[i].v=oo then
                        begin
                        t[i].v:=x;
                        t[i].i:=locate;
                        end
                else
                        if t[i].v<x then
                                begin
                                i:=i*2+1;
                                insert(x,i)
                                end
                        else
                                begin
                                i:=i*2;
                                insert(x,i);
                                end;
                end;
        begin
        if n mod 2<>0 then
                begin
                t[1].v:=a[(n div 2)+1].v;
                t[1].i:=(n div 2)+1;
                end;
        for i:= n div 2 downto 1 do
                begin
                locate:=i;
                insert(a[i].v,a[i].i);
                locate:=n-i+1;
                insert(a[n-i+1].v,a[n-i+1].i);
                end;
        end;
procedure process;
        var
                maxt,i,j:integer;
                tmp:longint;
        function max(a,b:integer):integer;
                begin
                if a>b then max:=a else max:=b;
                end;
        procedure search(x:longint;v:integer);
                begin
                if t[v].v<>oo then
                        begin
                        if t[v].v>x then search(x,v*2) else
                        if t[v].v<x then search(x,(v*2)+1) else
                        if t[v].i<>i then
                                begin
                                d[j]:=max(d[j],max(d[i],d[t[v].i])+1);
                                if d[j]>maxt then maxt:=d[j];
                                end;
                        end;
                end;
        begin
        maxt:=0;
        for j:= 3 to n do
        for i:= 1 to j-1 do
                begin
                tmp:=t[a[i].i].v;
                t[a[i].i].v:=oo;
                search(a[j].v-a[i].v,1);
                t[a[i].i].v:=tmp;
                end;
        writeln(maxt+1);
        end;
begin
        input;
        sort(1,n);
        ctree;
        process;
end.
