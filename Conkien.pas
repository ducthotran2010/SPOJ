const
        inp='Conkien.inp';
        out='Conkien.out';
        left=2;
        up=1;
        maxn=1000;
var
        n,m:integer;
        t:array[1..maxn,1..maxn] of shortint;
        a,f:array[1..maxn,1..maxn] of integer;
        gt:longint;
procedure nhap;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,m,n);
        for i:= 1 to m do
        for j:= 1 to n do
                read(f,a[i,j]);
        close(f);
        end;
function max(a,b:integer;var k:shortint):integer;
        begin
        if a>b then
                begin
                max:=a;
                k:=left;
                end
        else
                begin
                max:=b;
                k:=up;
                end;
        end;
procedure process;
        var
                i,j:integer;
        begin
        f[1,1]:=a[1,1];
        t[1,1]:=-1;
        for i:= 2 to m do
                begin
                f[i,1]:=f[i-1,1]+a[i,1];
                t[i,1]:=left;
                end;
        for i:= 2 to n do
                begin
                f[1,i]:=f[1,i-1]+a[1,i];
                t[1,i]:=up;
                end;
        for i:= 2 to m do
        for j:= 2 to n do
                f[i,j]:=max(f[i-1,j],f[i,j-1],t[i,j])+a[i,j];
        gt:=f[m,n];
        end;
procedure ghikq;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,gt);
        i:=m;
        j:=n;
        repeat
                write(f,a[i,j],'<-');
                if t[i,j]=left then dec(i) else dec(j);
        until t[i,j]=-1;
        write(f,a[i,j]);
        close(f);
        end;
begin
        nhap;
        process;
        ghikq;
end.
