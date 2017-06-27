uses crt;
const
        inp='SALE.INP';
        out='SALE.OUT';
var
        n,k,p:qword;
procedure nhap;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,k,p);
        close(f);
        end;
procedure xuly;
        var
                x,y:qword;
                f:text;
        begin
        y:=p+1;
        x:=k*p*(n div y);
        n:=(n-(n div y)*y)*p;
        x:=x+n;
        assign(f,out);
        rewrite(f);
        write(f,x);
        close(f);
        end;
begin
        clrscr;
        nhap;
        xuly;
end.
