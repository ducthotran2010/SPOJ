uses crt;
const
        inp='lares.inp';
        out='lares.out';
var
        n,m,k:longint;
procedure nhap;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        read(f,m,n,k);
        close(f);
        end;
function kt(t:longint):boolean;
        begin
        kt:=false;
        if (t<=n) then
        if (2*t<=m) then
        if (m+n-t*3>=k) then kt:=true;
        end;
procedure xuli;
        var
                t:longint;
                f:text;
        begin
        t:=(m+n-k)div 3;
        while not kt(t) do dec(t);
        while kt(t+1) do inc(t);
        assign(f,out);
        rewrite(f);
        writeln(f,t);
        close(f);
        end;
begin
        clrscr;
        nhap;
        xuli;
        readln;
end.
