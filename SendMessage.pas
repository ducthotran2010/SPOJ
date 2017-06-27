const
        inp='SendMessage.inp';
        out='SendMessage.out';
var
        n:integer;
        a:array[1..100,1..100] of integer;
procedure nhap;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n);
        for i:= 1 to n do
        for j:= 1 to n do read(f,a[i,j]);
        close(f);
        end;
procedure xuly;
        var
        begin

        end;
