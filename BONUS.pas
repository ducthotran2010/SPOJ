const
        maxn=1000;
var
        max:longword;
        n,k:integer;
        a:array[1..maxn,1..maxn] of longword;
procedure nhap;
        var
                i,j:integer;
        begin
        readln(n,k);
        for i:= 1 to n do
        for j:= 1 to n do read(a[i,j]);
        end;
procedure xuli;
        var
                i,j:integer;
                f:array[0..maxn,0..maxn] of longword;
        begin
        fillchar(f,sizeof(f),0);
        f[1,1]:=a[1,1];
        for i:= 2 to n do
                f[i,1]:=f[i-1,1]+a[i,1];
        for i:= 2 to n do
                f[1,i]:=f[1,i-1]+a[1,i];
        for i:= 2 to n do
        for j:= 2 to n do
                f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
        max:=0;
        for i:= k to n do
        for j:= k to n do
        if f[i,j]+f[i-k,j-k]-f[i-k,j]-f[i,j-k]>max then
        max:=f[i,j]+f[i-k,j-k]-f[i-k,j]-f[i,j-k];
        end;
procedure ghikq;
        begin
        write(max);
        end;
begin
        nhap;
        xuli;
        ghikq;
end.