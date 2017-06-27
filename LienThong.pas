const
        inp='LienThong.INP';
        out='LienThong.OUT';
        maxdinh=200;
var
        n,m,count:integer;
        a:array[1..maxdinh,1..maxdinh] of byte;
        visited:array[1..maxdinh] of boolean;
procedure nhap;
        var
                f:text;
                x,y,i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        fillchar(a,sizeof(a),0);
        for i:= 1 to m do
                begin
                read(f,x,y);
                a[x,y]:=1;
                a[y,x]:=1;
                end;
        close(f);
        end;
procedure DFS(x:integer);
        var
                y:integer;
        begin
        visited[x]:=true;
        for y:= 1 to n do
        if not visited[y] then
        if a[x,y]=1 then
                DFS(y);
        end;
procedure DDFS;
        var
                x:integer;
        begin
        for x:= 1 to n do
        if not visited[x] then
                begin
                DFS(x);
                inc(count);
                end;
        end;
procedure ghikq;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        write(f,count);
        close(f);
        end;
begin
        nhap;
        DDFS;
        ghikq;
end.