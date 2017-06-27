//uses crt;
const
        //inp='NKJUMP.inp';
        maxn=1000;
var
n:integer;
a:array[0..maxn] of longint;
procedure input;
        var
                f:text;
                i:integer;
        begin
        //assign(f,inp);
        //reset(f);
        randomize;
        readln({f,}n);
        for i:= 1 to n do read({f,}a[i]);
        //close(f);
        a[0]:=low(longint);
        end;
procedure sort(l,r:integer);
        var
                i,j:integer;
                tmp,x:longint;
        begin
        i:=l;
        j:=r;
        x:=a[(l+r)div 2];
        repeat
                while x>a[i] do inc(i);
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
        i,j,max:integer;
        d:array[1..maxn] of integer;
        procedure search(l,r,i:integer;x:longint);
                begin
                repeat
                        while x<a[(l+r)div 2] do dec(r);
                        while x>a[(l+r)div 2] do inc(l);
                        if x=a[(l+r)div 2] then
                        if l<=r then
                                begin
                                if d[(l+r)div 2]+1>d[i] then d[i]:=d[(l+r)div 2]+1;
                                break;
                                end;
                until l>=r;
                end;
        begin
        max:=1;
        d[1]:=1;
        d[2]:=1;
        //write(1:5,1:5);
        for i:= 3 to n do
                begin
                d[i]:=1;
                for j:= 1 to i-2 do search(j+1,i-1,i,a[i]-a[j]);
                if d[i]>max then max:=d[i];
                end;
        //writeln;
        writeln(max);
        end;
begin
        input;
        sort(1,n);
        process;
end.
