const
        maxn=1000;
        inp='';
var
        m,n:integer;
        step:longint;
        a:array[0..maxn+1,0..maxn+1] of char;
        f:array[1..maxn,1..maxn] of longint;
procedure input;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to m do
                begin
                for j:= 1 to n do read(f,a[i,j]);
                readln(f);
                end;
        close(f);
        end;
procedure turn(i,j,z,k:integer);
        begin
        if a[i+z,j+k]='.' then
                begin
                step:=step+1;
                turn(i+z,j+k,z,k);
                end;
        end;
procedure process;
        var
                i,j:integer;
        begin
        for i:= 1 to m do
        for j:= 1 to n do
        if a[i,j]='.' then
                begin
                step:=1;
                turn(i,j,-1,-1);
                turn(i,j,-1,0);
                turn(i,j,-1,1);
                turn(i,j,0,-1);
                turn(i,j,0,1);
                turn(i,j,1,0);
                turn(i,j,1,-1);
                turn(i,j,1,1);
                f[i,j]:=step;
                end;
        end;
procedure prinf;
        var
                i,j:integer;
        begin
        for i:= 1 to m do
                begin
                for j:= 1 to n do write(f[i,j],' ');
                writeln;
                end;
        end;
begin
        input;
        process;
        prinf;
end.
