const
        inp='';
        maxn=2000;
var
        m,n:integer;
        a:array[1..maxn,1..maxn] of byte;
        visited:array[1..maxn] of boolean;
procedure input;
        var
                f:text;
                i,x,y:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to m do
                begin
                readln(f,x,y);
                a[x,y]:=1;
                a[y,x]:=1;
                end;
        close(f);
        end;
procedure visit(s:integer);
        var
                i:integer;
        begin
        for i:= 1 to n do
        if a[s,i]=1 then
        if not visited[i] then
                begin
                visited[i]:=true;
                visit(i);
                end;
        end;
procedure process;
        var
                t,i:integer;
        begin
        t:=0;
        for i:= 1 to n do
        if not visited[i] then
                begin
                inc(t);
                visited[i]:=true;
                visit(i);
                end;
        writeln(m-n+t);
        end;
begin
        input;
        process;
end.