const
        maxn=100000;
        inp='';
var
        n,now,bef,mustchoose:longint;
        pre,nex:array[0..maxn+1] of longint;
procedure init;
        var
                i:longint;
        begin
        for i:= 1 to n do nex[i]:=i+1;
        for i:= 1 to n do pre[i]:=i-1;
        end;
procedure IPO;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        init;
        mustchoose:=0;
        bef:=0;
        for i:= 1 to n do
                begin
                readln(f,now);
                if now<bef then
                if now<>mustchoose then
                        begin
                        writeln('YES');
                        exit;
                        end;
                mustchoose:=pre[now];
                nex[pre[now]]:=nex[now];
                pre[nex[now]]:=pre[now];
                bef:=now;
                end;
        writeln('NO');
        close(f);
        end;
begin
        IPO;
end.
