const
        //inp='QBROBOT.inp';
        maxn=500;
var
found,min:longint;
n,m:integer;
a,c:array[1..maxn,1..maxn] of integer;
dd:array[1..maxn] of byte;
procedure input;
        var
        //        f:text;
                i,x,y,u,v:integer;
        begin
        //assign(f,inp);
        //reset(f);
        readln({f,}n);
        for i:= 1 to n do read({f,}dd[i]);
        readln({f,}m);
        for i:= 1 to m do
                begin
                read({f,}x,y,u,v);
                a[x,y]:=u;
                a[y,x]:=u;
                c[x,y]:=v;
                c[y,x]:=v;
                end;
        //close(f);
        end;
procedure dijkstra;
        var
        kt:boolean;
        i0:integer;
        d:array[1..maxn] of byte;
        t:array[1..maxn] of integer;
        v:array[1..maxn] of longint;
        procedure init;
        var
                i:integer;
        begin
        for i:= 1 to n do d[i]:=0;
        d[1]:=1;
        i0:=1;
        t[1]:=0;
        for i:= 1 to n do v[i]:=high(longint);
        for i:= 1 to n do
                if a[i,i0]<>0 then
                begin
                v[i]:=a[i,i0];
                t[i]:=i0;
                end;
        end;
        procedure chondinh;
        var
                min:longint;
                cs,i:integer;
        begin
        min:=high(longint);
        cs:=0;
        for i:= 1 to n do
        if d[i]=0 then
        if v[i]<min then
                begin
                cs:=i;
                min:=v[i];
                end;
        if cs<>0 then
                begin
                d[cs]:=1;
                i0:=cs;
                end
        else    kt:=false;
        end;
        procedure suanhan;
        var
                i:integer;
        begin
        for i:= 1 to n do
        if d[i]=0 then
        if a[i,i0]<>0 then
        if v[i]>v[i0]+a[i,i0] then
                begin
                v[i]:=v[i0]+a[i,i0];
                t[i]:=i0;
                end;
        end;
        begin
        init;
        kt:=true;
        repeat
                chondinh;
                if not kt then break;
                suanhan;
        until d[n]>0;
        found:=v[n];
        end;
procedure process;
        var
        max,tmp:longint;
        t:integer;
        visited:array[1..maxn] of boolean;
        trace:array[1..maxn] of integer;
        procedure DFS(s:integer);
                var
                        i,tam:integer;
                begin
                if tmp=found then
                if s=n then
                        begin
                        tam:=0;
                        max:=0;
                        for i:=2 to t do
                                begin
                                inc(tam,c[trace[i],trace[i-1]]);
                                if dd[trace[i]]=1 then
                                        begin
                                        if tam>max then max:=tam;
                                        tam:=0;
                                        end;
                                end;
                        if max<min then min:=max;
                        end;
                if tmp<found then
                for i:= 1 to n do
                if a[i,s]<>0 then
                if not visited[i] then
                        begin
                        inc(t);
                        trace[t]:=i;
                        visited[i]:=true;
                        tmp:=tmp+a[i,s];
                        DFS(i);
                        dec(t);
                        tmp:=tmp-a[i,s];
                        visited[i]:=false;
                        end;
                end;
        begin
        min:=high(longint);
        t:=1;
        dd[n]:=1;
        trace[1]:=1;
        tmp:=0;
        fillchar(visited,sizeof(visited),false);
        visited[1]:=true;
        DFS(1);
        end;
begin
        input;
        dijkstra;  //find min t
        process;   //find min c
        writeln(min);
end.