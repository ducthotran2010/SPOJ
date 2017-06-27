// Start time: 8:43pm 02/10/2014
// End time: 8:54pm 02/10/2014
const
        inp='XL01.inp';
        out='';
        maxn=1000;
var
        n:integer;
        a:array[1..maxn,1..maxn] of byte;
        t:array[1..maxn] of integer;
        visited:array[1..maxn] of boolean;
procedure input;
        var
                f:text;
                i,j:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        repeat
                read(f,i);
                repeat
                        read(f,j);
                        a[i,j]:=1;
                until eoln(f);
        until seekeof(f);
        close(f);
        end;
procedure process;
        var
                i,j,e:integer;
                check:boolean;
        begin
        e:=0;
        i:=1;
        repeat
        if not visited[i] then
                begin
                check:=true;
                for j:= 1 to n do
                if a[j,i]=1 then
                        begin
                        check:=false;
                        break;
                        end;
                if check then
                        begin
                        for j:= 1 to n do a[i,j]:=0;
                        visited[i]:=true;
                        inc(e);
                        t[e]:=i;
                        i:=1;
                        end;
                end;
                inc(i);
                if i>n then i:=1;
        until e=n;
        end;
procedure prinf;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        for i:= 1 to n do write(f,t[i],' ');
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.
