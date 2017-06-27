uses crt;
const
        inp='Number.INP';
        out='Number.OUT';
type
        mang=array[1..100]of byte[9];
        int=integer;
var
        a,b:mang;
        la,lb:int;
procedure format(var a,b:mang; la,lb:Int);
        var
                tmp,i:int;
        begin
        if la>lb then
                begin
                for i:= lb downto 1 do
                        begin
                        tmp:=b[i];
                        b[i]:=b[i+la-lb+1];
                        b[i+la-lb+1]:=tmp;
                        end;
                for i:= 1 to la-lb+1 do b[i]:=0;
                end;
        lb:=la;
        end;
procedure nhap;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        la:=0;
        repeat
                inc(la);
                read(f,a[la]);
        until eoln(f);
        readln(f);
        lb:=0;
        repeat
                inc(lb);
                read(f,b[lb]);
        until eoln(f);
        close(f);
        format(a,b,la,lb);
        end;
procedure plus(a,b:mang);
        var
                tmp:array[1..100]of byte;
                i:int;
        begin
        for i:= la downto 1 do
                begin
                tmp[i]:=a[i]+b[i];
                if tmp[i]>=10 then
                        begin
                        dec(tmp[i],10);
                        inc(tmp[i-1]);
                        end;
                end;
        for i:= 1 to la do write(tmp[i]);
        end;
begin
        nhap;
        plus(a,b);
end.
