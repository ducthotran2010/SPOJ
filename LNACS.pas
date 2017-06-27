const
        inp='';
        maxn=1000;
type
        SValue=record
        v,a,b:integer;
        end;
var
        m,n:integer;
        x,y:array[1..maxn] of integer;
        f:array[0..maxn,0..maxn] of SValue;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to m do read(f,x[i]);
        for i:= 1 to n do read(F,y[i]);
        close(f);
        end;
function max(a,b:SValue):SValue;
        begin
        if a.v>b.v then max:=a else max:=b;
        end;
procedure init;
        var
                i:integer;
        begin
        for i:= 0 to m do
                begin
                f[i,0].v:=0;
                f[i,0].a:=-1;
                f[i,0].b:=-1;
                end;
        for i:= 1 to n do
                begin
                f[0,i].v:=0;
                f[0,i].a:=-1;
                f[0,i].b:=-1;
                end;
        end;
procedure process;
        var
                i,j:integer;
        begin
        for i:= 1 to m do
        for j:= 1 to n do
                begin
                f[i,j]:=max(f[i-1,j],f[i,j-1]);
                if x[i]=y[j] then
                if i-f[i-1,j-1].a>1 then
                if j-f[i-1,j-1].b>1 then
                if f[i-1,j-1].v+1>f[i,j].v then
                        begin
                        f[i,j].v:=f[i-1,j-1].v+1;
                        f[i,j].a:=i;
                        f[i,j].b:=j;
                        end;
                end;
        end;
begin
        input;
        init;
        process;
        writeln(f[m,n].v);
end.