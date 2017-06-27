const
        inp='MINROAD.inp';
        out='MINROAD.out';
        maxn=300000;
type
        mang=record
        v:longint;
        l:byte;
        end;
var
        t:array[1..maxn] of mang;
        min,n,a,b:longint;
procedure sort(l,h:longint);
        var
                i,j,x:longint;
                tmp:mang;
        begin
        i:=l;
        j:=h;
        x:=t[(l+h) div 2].v;
        repeat
                while t[i].v<x do inc(i);
                while t[j].v>x do dec(j);
                if i<=j then
                        begin
                        tmp:=t[i];
                        t[i]:=t[j];
                        t[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<h then sort(i,h);
        end;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,a,b);
        for i:=1 to n do read(f,t[i].v,t[i].l);
        close(f);
        end;
procedure process;
        var
                j,i,da,db:longint;
        begin
        j:=1;
        da:=0;
        db:=0;
        min:=high(longint);
        for i:=1 to n do
                begin
                if t[i].l=1 then inc(da) else inc(db);
                while (da>=a) and (db>=b) do
                        begin
                        if t[i].v-t[j].v<min then min:=t[i].v-t[j].v;
                        if t[j].l=1 then dec(da) else dec(db);
                        inc(j);
                        end;
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        if min=high(longint) then min:=-1;
        writeln(f,min);
        close(f);
        end;
begin
        input;
        sort(1,n);
        process;
        prinf;
end.
