uses crt;
const
        inp='Number.INP';
        out='Number.OUT';
var
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        i:=0;
        repeat
                inc(i);
                read(f,a[i]);
        until eoln(f);
        readln(f);
        i:=0;
        repeat
                inc(i);
                read(f,b[i]);
        until eoln(f);
        close(f);
        end;
procedure
begin
        nhap;
        write(plus(a,b));
end;