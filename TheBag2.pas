const
        inp='TheBag2.inp';
        out='TheBag2.out';
type
        mang=record
        v,gt:integer;
        end;
var
        n,v:integer;
        a:array[1..100] of mang;//=record v,gt:integer end;
        f:array[0..100] of integer;
        choose:array[1..100] of integer;
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,v);
        for i:= 1 to n do read(f,a[i].v,a[i].gt);
        close(f);
        end;
function max(a,b,j:integer;var k:integer):integer;
        begin
        if a>b then
                max:=a
        else
                begin
                max:=b;
                k:=j;
                end;
        end;
procedure xuly;
        var
                k,i,j:integer;
        begin
        fillchar(choose,sizeof(choose),0);
        for i:= 1 to v do f[a[i].v]:=0;
        for i:= 1 to n do
               // begin
                f[a[i].v]:=a[i].gt;
               // choose[a[i].v]:=1;
                //end;
        for i:= 1 to v do
        begin
        k:=a[i].v;
        for j:= 1 to n do
        if i-a[j].v>=0 then
                begin

                f[i]:=max(f[i],f[i-a[j].v]+a[j].gt,j,k);
                end;
        inc(choose[k]);
        end;
                //end;
        end;
procedure ghikq;
        var
                fo:text;
                i:integer;
        begin
        assign(fo,out);
        rewrite(fo);
        writeln(fo,f[v]);
        for i:= 1 to n do
        if choose[i]<>0 then
                write(fo,i,' ',choose[i]);
        close(fo);
        end;
begin
        nhap;
        xuly;
        ghikq;
end.