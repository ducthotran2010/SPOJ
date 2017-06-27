const
        inp='';
        maxn=2000;
var
        n:longint;
        a:array[1..maxn] of longint;
        f:array[1..maxn,1..maxn] of longint;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure init;
        var
                i:longint;
        begin
        for i:= 1 to n do f[i,i]:=a[i]*n;
        end;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure process;
        var
                i,j,t:longint;
        begin
        for i:= n downto 1 do
        for j:= i+1 to n do
                begin
                t:=n-(j-i);
                f[i,j]:=max(f[i,j-1]+a[j]*t,f[i+1,j]+a[i]*t);
                end;
        writeln(f[1,n]);
        end;
begin
        input;
        init;
        process;
end.