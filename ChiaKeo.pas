// Start time: 9:30pm 01/10/2014
const
        maxn=200;
        maxs=200*1000;
        inp='ChiaKeo.inp';
        out='ChiaKeo.out';
var
        n:byte;
        l,s:longint;
        a:array[1..maxn] of integer;
        d:array[0..maxs] of byte;
        c:array[1..maxn] of byte;
procedure input;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure process;
        var
                i:byte;
                j:longint;
        begin
        s:=0;
        for i:= 1 to n do s:=s+a[i];
        l:=s div 2;
        d[0]:=1;
        for i:= 1 to n do
        for j:= l downto a[i] do
                if d[j]=0 then
                if d[j-a[i]]<>0 then
                        d[j]:=i;
        end;
procedure prinf;
        var
                f:text;
                i:byte;
        begin
        assign(f,out);
        rewrite(f);
        while d[l]=0 do dec(l);
        writeln(f,s-l*2);
        repeat
                write(f,a[d[l]],' ');
                c[d[l]]:=1;
                l:=l-a[d[l]];
        until l=0;
        writeln(f);
        for i:= 1 to n do
        if c[i]=0 then write(f,a[i],' ');
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
