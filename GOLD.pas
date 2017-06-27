const
        inp='GOLD.inp';
        maxgt=30;
var
n,s,w:integer;
max:longint;
f:array[-maxgt-1..maxgt,-maxgt-1..maxgt] of integer;
procedure input;
        var
                fi:text;
                i,x,y:integer;
        begin
        assign(fi,inp);
        reset(fi);
        readln(fi,s,w);
        readln(fi,n);
        for i:= 1 to n do
                begin
                readln(fi,x,y);
                f[x,y]:=1;
                end;
        close(fi);
        for i:= 1 to n do
        begin
        for x:= 1 to n do write(f[i,x],' ');
        writeln;
        end;
        end;
procedure init;
        var
                i,j:integer;
        begin
        for i:= -maxgt to maxgt do
        for j:= -maxgt to maxgt do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+f[i,j];
        end;
procedure process(k1,k2:integer);
        var
                i,j:integer;
        begin
        for i:= -maxgt+k1 to maxgt do
        for j:= -maxgt+k2 to maxgt do
        if f[i,j]+f[i-k1,j-k2]-f[i,j-k2]-f[i-k1,j]>max then
                max:=f[i,j]+f[i-k1,j-k2]-f[i,j-k2]-f[i-k1,j];
        end;
begin
        input;
        init;
        max:=0;
        process(s+1,w+1);
        write(max);
end.
