const
        inp='SXUAT.inp';
        out='SXUAT.out';
        maxn=100;
var
n:byte;
a:array[0..100] of integer;
procedure input;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        a[0]:=0;
        for i:= 1 to n do
                begin
                readln(f,a[i]);
                inc(a[0],a[i]);
                end;
        close(f);
        end;
procedure process;
        var
                locate:byte;
        procedure fix(locate:byte);
                var
                        i:byte;
                begin
                dec(n);
                inc(a[locate-1],a[locate]);
                for i:= locate to n do a[i]:=a[i+1];
                end;
        function findmin(var j:byte):integer;
                var
                        min:integer;
                        i:byte;
                begin
                min:=a[1]+a[2];
                j:=2;
                for i:= 3 to n do
                if a[i]+a[i-1]<min then
                        begin
                        min:=a[i]+a[i-1];
                        j:=i;
                        end;
                findmin:=min;
                end;
        begin
        repeat
                inc(a[0],findmin(locate));
                fix(locate);
        until n=2;
        end;
begin
        input;
        process;
        writeln(a[0]);
end.