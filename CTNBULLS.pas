const
        maxn=100000;
        inf=2111992;
var
        n,k:longint;
        f:array[1..maxn] of longint;
procedure process;
        var
                i:longint;
        begin
        f[1]:=2;
        for i:= 2 to n do
                begin
                f[i]:=(f[i-1]+1) mod inf;
                if i-k>1 then
                f[i]:=(f[i]+f[i-k-1]-1)mod inf;
                end;
        end;
begin
        readln(n,k);
        process;
        writeln(f[n]);
end.
