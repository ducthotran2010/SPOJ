const
        inp='Daukhi.inp';
        out='Daukhi.out';
var
        m,n,k:integer;
        a:array[1..1000,1..1000] of integer;
        max:longint;
procedure nhap;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,m,n,k);
        for i:= 1 to m do
        for j:= 1 to n do
                read(f,a[i,j]);
        close(f);
        end;
procedure process;
        var
                f:array[0..1000,0..1000] of integer;
                i,j:integer;
        begin
        fillchar(f,sizeof(f),0);
        f[1,1]:=a[1,1];
        for i:= 2 to m do
                f[i,1]:=f[i-1,1]+a[i,1];
        for i:= 2 to n do
                f[1,i]:=f[1,i-1]+a[1,i];
        for i:= 2 to m do
        for j:= 2 to n do
                f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
        max:=0;
        for i:= k to m do
        for j:= k to n do
        if f[i,j]-f[i-k,j]-f[i,j-k]>max then
                max:=f[i,j]-f[i-k,j]-f[i,j-k];
        end;
procedure ghikq;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,max);
        close(f);
        end;
begin
        nhap;
        process;
        ghikq;
end.
