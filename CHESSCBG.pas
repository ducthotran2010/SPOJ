const
        inp='';
        maxn=4;
var
        s1,s2,res:longint;
        a:array[-4..maxn*maxn+4,-4..maxn*maxn+4] of boolean;
        queue,step:array[1..100] of longint;
        visited:array[0..maxn*maxn-1] of boolean;
procedure input;
        var
                f:Text;
                i,j:longint;
                x:char;
        begin
        assign(f,inp);
        reset(f);
        s1:=0;
        s2:=0;
        for i:= 1 to maxn do begin
        for j:= 1 to maxn do
                begin
                read(F,x);
                if x='1' then
                s1:=s1 or (1 shl((i-1)*maxn+j-1));
                end;
                readln(f);
        end;
        for i:= 1 to maxn do begin
        for j:= 1 to maxn do
                begin
                read(F,x);
                if x='1' then
                s2:=s2 or (1 shl((i-1)*maxn+j-1));
                end;
                readln(f);
        end;
        close(f);
        end;
procedure init;
        var
                i,j:longint;
        begin
        for i:=1 to maxn do
        for j:=1 to maxn do
                begin
                a[(i-1)*maxn+j-1,(i-1)*maxn+j-2]:=true;
                a[(i-1)*maxn+j-1,(i-1)*maxn+j]:=true;
                a[(i-1)*maxn+j-1,(i-2)*maxn+j-1]:=true;
                a[(i-1)*maxn+j-1,i*maxn+j-1]:=true;
                end;
        for i:=-1 to maxn*maxn do
                begin
                a[i,-1]:=false;
                a[i,maxn*maxn]:=false;
                a[-1,i]:=false;
                a[-1,maxn*maxn]:=false;
                end;
        end;
procedure BFS(s:longint);
        var
                d,c,u,v,i:longint;
        begin
        fillchar(visited,sizeof(visited),false);
        d:=1;
        c:=0;
        queue[1]:=s;
        step[1]:=0;
        visited[s]:=true;
        repeat
                inc(c);
                u:=queue[c];
                v:=step[c];
                for i:= 0 to maxn*maxn-1 do
                if not visited[i] then
                if a[u,i] then
                        begin
                        inc(d);
                        visited[i]:=true;
                        queue[d]:=i;
                        step[d]:=v+1;
                        if (1shl i)and s2<>0 then
                        if (1shl i)and s1=0 then
                                begin
                                res:=res+step[d];
                                s1:=s1 xor (1 shl s);
                                s2:=s2 xor (1 shl i);
                                exit;
                                end;
                        end;
        until c>d;
        end;
procedure process;
        var
                i:longint;
        begin
        res:=0;
        for i:= 0 to maxn*maxn-1 do
                begin
                if s1 and(1 shl i)<>0 then
                if (s1 and(1 shl i))xor(s2 and(1shl i))=(1shl i) then
                        BFS(i);
                end;
        writeln(res);
        end;
begin
        input;
        init;
        process;
end.
