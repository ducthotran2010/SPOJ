const
        maxn=100;
        inp='FLOYD.inp';
        out='FLOYD.out';
var
        fo:text;
        n,i0,k,m,x,y:integer;
        a:array[1..maxn,1..maxn] of longint;
        v:array[1..maxn] of longint;
        d:array[1..maxn] of boolean;
        t:array[1..maxn] of integer;
procedure findmin;
        var
                i:byte;
                min:longint;
        begin
        min:=high(longint);
        for i:= 1 to n do
        if not d[i] then
        if v[i]<min then
                begin
                i0:=i;
                min:=v[i];
                end;
        d[i0]:=true;
        end;
procedure editlabel;
        var
                i:byte;
        begin
        for i:= 1 to n do
        if not d[i] then
        if a[i0,i]<>0 then
        if v[i]>v[i0]+a[i0,i] then
                begin
                v[i]:=v[i0]+a[i0,i];
                t[i]:=i0;
                end;
        end;
procedure init;
        var
                i:byte;
        begin
        for i:= 1 to n do d[i]:=false;
        for i:= 1 to n do
                t[i]:=x;
        for i:= 1 to n do
        if a[i,x]<>0 then
                v[i]:=a[i,x]
        else
                v[i]:=high(longint);
        d[x]:=true;
        v[x]:=a[x,x];
        t[x]:=-1;
        end;
procedure dijkstra;
        begin
        init;
        i0:=x;
        repeat
                findmin;
                editlabel;
        until d[y];
        end;
procedure trace;
        var
                i,step:integer;
                b:array[1..maxn] of byte;
        begin
        i:=y;
        step:=0;
        repeat
                inc(step);
                b[step]:=i;
                i:=t[i];
        until i=-1;
        write(fo,step,' ');
        for i:= step downto 1 do write(fo,b[i],' ');
        end;
procedure IPO;
        var
                f:text;
                i,c:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m,k);
        for i:= 1 to m do
                begin
                readln(f,x,y,c);
                a[x,y]:=c;
                a[y,x]:=c;
                end;
        for i:= 1 to k do
                begin
                readln(f,c,x,y);
                dijkstra;
                if c=0 then
                        write(fo,v[y])
                else
                        trace;
                writeln(fo);
                end;
        close(f);
        end;
begin
        assign(fo,out);
        rewrite(fo);
        IPO;
        close(fo);
end.
