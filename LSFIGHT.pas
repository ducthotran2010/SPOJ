const
        inp='';
        maxn=500;
var
        n,res:longint;
        a:array[1..maxn,1..maxn] of boolean;
        f:array[1..maxn] of boolean;
procedure input;
        var
                f:text;
                i,j,x:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do
        for j:= 1 to n do
                begin
                read(f,x);
                a[i,j]:=false;
                if x=1 then a[i,j]:=true;
                end;
        close(f);
        end;
procedure process;
        var
                i,j,k:longint;
        begin
        for i:= 1 to n do
        for j:= 1 to n do
                begin
                if not a[i,j] then
                for k:= 1 to n do
                if a[i,k] then
                if a[k,j] then
                        begin
                        a[i,j]:=true;
                        break;
                        end;
                end;
        end;
procedure prinf;
        var
                i,j:longint;
        begin
        res:=n;
        for i:= 1 to n do
                begin
                for j:= 1 to n do
                if not a[i,j] then
                        begin
                        dec(res);
                        f[i]:=false;
                        break;
                        end;
                end;
        writeln(res);
        for i:= 1 to n do
        if f[i] then writeln(i);
        end;
begin
        input;
        fillchar(f,sizeof(f),true);
        process;
        prinf;
end.