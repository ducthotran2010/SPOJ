//Start time: 4:19pm 19/10/14
//End time: 4:30pm 19/10/14
const
        max=1000000;
var
        x,a:string;
        m,n:longint;
        next:array[1..max+1] of longint;
procedure init;
        var
                jj,j:longint;
        begin
        jj:=0;
        j:=1;
        next[1]:=0;
        while j<=n do
                begin
                while (jj>0) and (x[j]<>x[jj]) do jj:=next[jj];
                inc(j);
                inc(jj);
                if x[j]=x[jj] then
                        next[j]:=next[jj]
                else
                        next[j]:=jj;
                end;
        end;
procedure process;
        var
                i,j:longint;
        begin
        i:=1;
        j:=1;
        repeat
                while (j>0) and (a[i]<>x[j]) do j:=next[j];
                inc(i);
                inc(j);
                if j>n then
                        begin
                        write(i-j+1,' ');
                        j:=next[j];
                        end;
        until i>m;
        end;
begin
        readln(a);
        readln(x);
        m:=length(a);
        n:=length(x);
        init;
        process;
end.