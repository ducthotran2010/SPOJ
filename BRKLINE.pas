//Start time: 8:06pm 22/10/2014
//First run: 9:05pm 22/10/2014
const
        inp='BRKLINE.inp';
        out='BRKLINE.out';
        maxn=1000;
var
        n:word;
        m:longint;
        trace,pre,nex:array[1..maxn] of word;
        a:array[1..maxn,1..maxn] of byte;
        visited:array[1..maxn] of boolean;
procedure input;
        var
                f:text;
                i:longint;
                x,y:word;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to m do
                begin
                read(f,x,y);
                a[x,y]:=1;
                a[y,x]:=1;
                end;
        close(f);
        end;
procedure prinf;
        var
                f:text;
                i:word;
        begin
        assign(f,out);
        rewrite(f);
        for i:= 1 to n do write(f,trace[i],' ');
        close(f);
        halt;
        end;
function check(a,b:integer):boolean;
        begin
        if b>nex[a] then exit(false);
        exit(true);
        end;
procedure DFS(s,step:word);
        var
                i:word;
                prt,net:word;
        begin
        trace[step]:=s;
        if step=n then prinf;
        for i:= 1 to n do
        if not visited[i] then
        if a[s,i]=1 then
        if check(s,i) then
        if check(i,s) then
                begin
                prt:=pre[nex[i]];
                net:=nex[pre[i]];
                pre[nex[i]]:=pre[i];
                nex[pre[i]]:=nex[i];
                visited[i]:=true;
                DFS(i,step+1);
                visited[i]:=false;
                pre[nex[i]]:=prt;
                nex[pre[i]]:=net;
                end;
        end;
procedure init;
        var
                i:word;
        begin
        for i:= 1 to n do
                begin
                pre[i]:=i-1;
                nex[i]:=i+1;
                end;
        pre[1]:=n;
        nex[n]:=1;
        end;
procedure DDFS;
        var
                i,prt,net:word;
        begin
        for i:= 1 to n do
                begin
                fillchar(visited,sizeof(visited),false);
                visited[i]:=true;
                pre[nex[i]]:=pre[i];
                nex[pre[i]]:=nex[i];
                DFS(i,1);
                pre[nex[i]]:=i;
                nex[pre[i]]:=i;
                end;
        end;
procedure prinfnotfound;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,-1);
        close(f);
        end;
begin
        input;
        init;
        DDFS;
        prinfnotfound;
end.