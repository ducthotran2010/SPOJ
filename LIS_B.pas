// Start time: 9:50pm 01/10/2014
// End time: 10:12pm 01/10/2014
{--------EDIT-------}
// Time: 10:40-10:47pm 01/10/2014
// Edit binary search
const
        inp='';
        out='';
        maxn=30000;
var
        n:integer;
        a:array[1..maxn] of longint;
        h:array[1..maxn] of integer;
procedure input;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure process;
        var
                s,e,i,f,r:integer;
        begin
        h[1]:=1;
        s:=1;
        e:=1;
        for i:= 2 to n do
                if a[i]<=a[h[1]] then
                        begin
                        h[1]:=i;
                        end
                else if a[i]>a[h[e]] then
                        begin
                        inc(e);
                        h[e]:=i;
                        end
                else
                        begin
                        f:=1;
                        r:=e;
                        while f<r do
                                if a[h[(f+r)div 2]]<a[i] then
                                        f:=1+((f+r) div 2)
                                else
                                        r:=(f+r) div 2;
                        h[(f+r)div 2]:=i;
                        end;
        writeln(e);
        end;
begin
        input;
        process;
end.