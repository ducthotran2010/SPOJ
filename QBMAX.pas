const
        //inp='QBMAX.INP';
        //out='QBMAX.OUT';
        maxn=100;

var
m,n:byte;
f:array[0..maxn+1,0..maxn+1] of longint;
a:array[1..maxn,1..maxn] of shortint;
fmax:longint;
procedure nhap;
        var
                //f:text;
                i,j:byte;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}m,n);
        for i:= 1 to m do
                begin
                for j:= 1 to n do
                        read({f,}a[i,j]);
                readln{(f)};
                end;
        //close(f);
        end;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure xuly;
        var
                i,j:byte;
        begin
        for i:= 0 to m+1 do
        for j:= 0 to n do f[i,j]:=low(longint);
        for i:= 1 to m do f[i,1]:=a[i,1];
        for j:= 2 to n do
        for i:= 1 to m do
                f[i,j]:=max(max(f[i-1,j-1],f[i,j-1]),f[i+1,j-1])+a[i,j];
        fmax:=f[1,n];
        for i:= 2 to m do
        if f[i,n]>fmax then fmax:=f[i,n];
        end;
begin
        nhap;
        xuly;
        write(fmax);
end.
