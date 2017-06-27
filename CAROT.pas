uses crt;
const
        maxn=300;
var
n,k:integer;
f:array[1..maxn-1] of integer;
a:array[1..maxn,1..maxn] of integer;
procedure init;
        var
                i:integer;
                l:array[1..maxn] of integer;
        begin
        f[1]:=1;
        l[1]:=1;
        for i:= 2 to n do f[i]:=f[i-1]+2;
        for i:= 2 to n do l[i]:=l[i-1]+f[i-1];
        f[1]:=0;
        for i:= 2 to n do
                f[i]:=f[i-1]+l[i-1];
        end;
procedure built;
        var
                i,j:integer;
        begin
        a[1,1]:=1;
        a[2,2]:=2;
        a[2,3]:=3;
        for i:= 4 to n do a[2,i]:=a[2,i-1]+a[2,i-2];
        for i:= 3 to n do //cot
        for j:= i to n do
                //begin
                a[i,j]:=a[i-1,j-1]*2+f[j-i+1];
                //write(a[i,j]);
                //end;
        for i:= 1 to n do
                begin
                for j:= 1 to n do write(a[i,j]:5);
                writeln;
                end;
        end;
procedure nhap;
        begin
        readln(k,n);
        if k=1 then write('1')
        else
                begin
                init;
                built;
                write(a[k,n]);
                end;
        end;
begin
        clrscr;
        nhap;
end.