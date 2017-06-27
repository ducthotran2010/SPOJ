const
        inp='';
        out='';
        maxn=1000;
var
        m,n,top:integer;
        max:longint;
        a:array[1..maxn,1..maxn] of byte;
        nex,pre,q,h:array[0..maxn+1] of integer;
procedure input;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to m do
        for j:= 1 to n do read(f,a[i,j]);
        close(f);
        end;
procedure buildnex;
        var
                j:integer;
        begin
        q[0]:=n+1;
        top:=0;
        nex[n+1]:=n;
        for j:= n downto 1 do
        if h[j]>h[j+1] then
                begin
                nex[j]:=j;
                inc(top);
                q[top]:=j;
                end
        else
                begin
                while h[q[top]]>=h[j] do dec(top);
                inc(top);
                nex[j]:=nex[q[top]];
                q[top]:=j;
                end;
        end;
procedure buildpre;
        var
                j:integer;
        begin
        q[0]:=0;
        top:=0;
        pre[0]:=1;
        for j:= 1 to n do
        if h[j]>h[j-1] then
                begin
                pre[j]:=j;
                inc(top);
                q[top]:=j;
                end
        else
                begin
                while h[q[top]]>=h[j] do dec(top);
                inc(top);
                pre[j]:=pre[q[top]];
                q[top]:=j;
                end;
        end;
procedure process(mode:byte);
        var
                i,j:integer;
        function min(a,b:integer):integer;
                begin
                if a<b then min:=a else min:=b;
                end;
        begin
        for j:= 1 to n do h[j]:=0;
        for i:= 1 to m do
                begin
                for j:= 1 to n do
                if a[i,j]=mode then inc(h[j]) else h[j]:=0;
                buildpre;
                buildnex;
                for j:= 1 to n do
                if min(h[j],(nex[j]-pre[j]+1))>max then
                        max:=min(h[j],(nex[j]-pre[j]+1));
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,max);
        close(f);
        end;
begin
        input;
        max:=0;
        h[0]:=-1;
        h[n+1]:=-1;
        process(1);
        process(0);
        prinf;
end.