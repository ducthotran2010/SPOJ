const
        max=50000;
        inp='KMIN.inp';

type
        mang=array[0..max] of longint;
var
        a,b:mang;
        k:longint;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,a[0],b[0],k);
        for i:= 1 to a[0] do readln(f,a[i]);
        for i:= 1 to b[0] do readln(f,b[i]);
        close(f);
        end;
procedure sort(l,r:longint;var a:mang);
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
        if l<j then sort(l,j,a);
        if i<r then sort(i,r,a);
        end;
procedure process;
        var
                kt,i,j:longint;
        function min(a,b:int64):int64;
                begin
                if a<b then begin
                        min:=a;
                        inc(j);
                end else begin
                        min:=b;
                        inc(i);
                end;
                end;
        begin
        kt:=0;
        i:=1;
        j:=1;
        a[a[0]+1]:=high(longint);
        b[b[0]+1]:=high(longint);
        inc(kt);
        writeln(a[i]+b[j]);
        if kt=k then halt;
        repeat
                inc(kt);
                writeln(min(a[i]+b[j+1],a[i+1]+b[j]));
                if kt=k then halt;
        until (i=a[0])and(j=b[0]);
        end;
begin
        input;
        sort(1,a[0],a);
        sort(1,b[0],b);
        process;
end.
