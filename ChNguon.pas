const
        inp='ChNguon.inp';
        out='ChNguon.out';
var
        x,y:string;
        lx,ly:byte;
        f:array[0..200,0..200] of byte;
procedure nhap;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        readln(f,x);
        readln(f,y);
        close(f);
        end;
function max(a,b:byte):byte;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure xuly;
        var
                i,j:byte;
        begin
        lx:=length(x);
        ly:=length(y);
        for i:= 1 to lx do
        for j:= 1 to ly do
        if x[i]=y[j] then
                f[i,j]:=f[i-1,j-1]+1
        else
                f[i,j]:=max(f[i-1,j],f[i,j-1]);
        end;
procedure ghikq;
        var
                fi:text;
                s:string;
        begin
        s:='';
        lx:=length(x);
        repeat
                while f[lx,ly]=f[lx-1,ly] do dec(lx);
                while f[lx,ly]=f[lx,ly-1] do dec(ly);
                s:=x[lx]+s;
                dec(lx);
                dec(ly);
        until f[lx,ly]=0;
        while s[1]='0' do s:=copy(s,2,length(x)-1);
        assign(fi,out);
        rewrite(fi);
        write(fi,s);
        close(fi);
        end;
begin
        nhap;
        xuly;
        ghikq;
end.