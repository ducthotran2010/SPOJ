const
        inp='TheBAG.inp';
        out='TheBAG.out';
        maxn=1000;
        maxv=1000;
type
        mang=record
        kl,gt:integer;
        end;
        byte=integer;
var
        a:array[1..maxn] of mang;
        f:array[0..maxn,0..maxv] of integer;
        n:byte;
        v:longint;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,v);
        for i:= 1 to n do read(f,a[i].kl,a[i].gt);
        close(f);
        end;
function max(i,j:integer):integer;
        begin
        if i>j then max:=i else max:=j;
        end;
procedure process;
        var
                j:longint;
                i:byte;
        begin
        for i:= 1 to n do
        for j:= 1 to v do
        if a[i].kl<=j then
                f[i,j]:=max(f[i-1,j],f[i-1,j-a[i].kl]+a[i].gt)
        else
                f[i,j]:=f[i-1,j];
        for i:= 1 to n do begin
        for j:= 1 to v do write(f[i,j]:5); writeln;end;
        end;
procedure prinf;
        var
                fi:text;
        begin
        assign(fi,out);
        rewrite(fi);
        writeln(fi,f[n,v]);
        repeat
                while f[n,v]=f[n-1,v] do dec(n);
                write(fi,n,' ');
                dec(v,a[n].kl);
                dec(n);
        until f[n,v]=0;
        close(fi);
        end;
begin
        input;
        process;
        prinf;
end.
