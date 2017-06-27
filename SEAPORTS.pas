// O(nlogn);
const
        maxn=100000;
        inp='SEAPORTS.inp';
        out='SEAPORTS.out';
type
        index=record
        l,r,h:longint;
        end;
var
        m,n,result:longint;
        a:array[1..maxn] of index;
        l,f:array[1..maxn] of longint;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to n do
                begin
                readln(f,a[i].l,a[i].r);
                a[i].h:=i;
                end;
        close(f);
        end;
procedure sort(l,r:longint);
        var
                x,i,j:longint;
                tmp:index;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r) div 2].r;
        repeat
                while a[i].r<x do inc(i);
                while a[j].r>x do dec(j);
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

                i,j:integer;
        begin
        result:=0;
        j:=1;
        for i:= 1 to m do f[i]:=0;
        for i:= 1 to n do
                begin
                l[a[i].h]:=0;
                if a[i].l>=f[j] then
                        begin
                        f[j]:=a[i].r;
                        l[a[i].h]:=j;
                        inc(result);
                        inc(j);
                        if j>m then j:=1;
                        end;
                end;
        end;
procedure prinf;
        var
                f:text;
                i:longint;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,result);
        for i:= 1 to n do write(f,l[i],' ');
        close(f);
        end;
begin
        input;
        sort(1,n);
        process;
        prinf;
end.