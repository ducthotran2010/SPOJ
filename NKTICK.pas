const
        inp='';
        max=60000;

var
n:longint;
t,r:array[1..max] of integer;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,t[i]);
        for i:= 1 to n-1 do read(f,r[i]);
        close(f);
        end;
function min(a,b:longint):longint;
        begin
        if a<b then min:=a else min:=b;
        end;
procedure process;
        var
                i:longint;
                f:array[0..max] of longint;
        begin
        f[0]:=0;
        f[1]:=t[1];
        for i:= 2 to n do
                f[i]:=min(f[i-1]+t[i],f[i-2]+r[i-1]);
        writeln(f[n]);
        end;
begin
        input;
        process;
end.
