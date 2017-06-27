const
        inp='PTHI.inp';
        out='PTHI.out';
        maxn=100;
var
        n:byte;
        a:array[0..maxn] of integer;
procedure input;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do
                begin
                readln(f,a[i]);
                inc(a[i],4);
                end;
        close(f);
        end;
procedure process;
        var
                i,locate:byte;
                tmp,max:integer;
        begin
        max:=a[1];
        tmp:=a[1];
        locate:=1;
        for i:= 2 to n do
                begin
                inc(tmp,a[i]);
                if max<a[i] then
                        begin
                        max:=a[i];
                        a[0]:=tmp;
                        locate:=i;
                        end;
                end;
        if locate<>1 then write(a[0]-locate) else write(max);
        end;
begin
        input;
        process;
end.