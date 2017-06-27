const
        inp='DoiTien.inp';
        out='Doitien.out';
var
        f,choose,a:array[0..100] of integer;
        n,s:integer;
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,s);
        for i:= 1 to n do read(f,A[i]);
        close(f);
        end;
function min(a,b,j:integer;var k:integer):integer;
        begin
        if a<b then min:=a else
                begin
                k:=j;
                min:=b;
                end;
        end;
procedure QHD;
        var
                i,j:integer;
        begin
        fillchar(f,sizeof(f),100);
        fillchar(choose,sizeof(choose),0);
        for i:= 1 to n do choose[a[i]]:=a[i];
        for i:= 1 to n do f[a[i]]:=1;
        for i:= 1 to s do
//                begin
                for j:= 1 to n do
                if i-a[j]>=0 then
                f[i]:=min(f[i],f[i-a[j]]+f[a[j]],j,choose[i]);
        end;
procedure ghikq;
        var
                i:integer;
                fo:text;
                b:array[0..100] of integer;
        begin
        assign(fo,out);
        rewrite(fo);
        writeln(fo,f[s]);
        fillchar(b,sizeof(b),0);
        repeat
                inc(b[choose[s]]);
                s:=s-a[choose[s]];
        until choose[s]=0;
        for i:= 1 to n do
                writeln(fo,a[i],' ',b[i]);
        close(fo);
        end;
begin
        nhap;
        QHD;
        ghikq;
end.
