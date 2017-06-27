const
        max=2*100000;
type
        mang=record
        sta:byte;
        v:longint;end;
var
n:longint;
a:array[1..max+1] of mang;
procedure input;
        var
                //f:text;
                i:longint;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n);
        for i:= 1 to n do
        	begin
        	read({f,}a[i].v);
        	a[i].sta:=0;
        	end;
        for i:= n+1 to n*2 do
                begin
                read({f,}a[i].v);
                a[i].sta:=1;
                end;
        //close(f);
        end;
procedure sort(l,r:longint);
        var
                tmp:mang;
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
procedure process;
        var
                count,i:longint;
        begin
        count:=0;
        for i:= 2 to n*2 do
        if a[i].sta+a[i-1].sta=1 then
                begin
                count:=count+1;
                a[i].sta:=a[i+1].sta;
                end;
        write(count);
        end;
begin
        input;
        sort(1,n*2);
        process;
end.
