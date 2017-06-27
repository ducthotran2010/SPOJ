const
        maxn=30;
        inp='';
var
        n:longint;
        f:array[0..maxn] of longint;
procedure IPO;
        var
                fi:text;
                i:longint;
        begin
        assign(fi,inp);
        reset(fi);
        repeat
                readln(fi,n);
                if n=-1 then break;
                writeln(f[n]);
        until false;
        close(fi);
        end;
procedure init;
        var
                i:longint;
        begin
        f[0]:=1;
        f[2]:=3;
        for i:=4 to maxn do f[i]:=4*f[i-2]-f[i-4];
        end;
begin
        init;
        IPO;
end.