const
        max=200;
        maxs=40000;
        inp='NTSEQS.inp';
        out='NTSEQS.out';
var
n:byte;
s,sfix:longint;
a:array[1..max] of longint;
status:array[1..max] of byte;
d:array[0..maxs] of byte;
procedure input;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,s);
        for i:= 1 to n do begin
                read(f,a[i]);
                d[a[i]]:=d[a[i]]+1;
        end;
        close(f);
        end;
function p(s:longint):byte;
        var
                i:byte;
        begin
        for i:= 1 to n do
        if s-a[i]>=0 then
        if status[i]=0 then begin
                status[i]:=1;
                d[a[i]]:=d[a[i]]-1;
                if d[a[i]]>=0 then begin
                        if d[s-a[i]]=0 then
                        if p(s-a[i])=1 then exit(1);
                        if d[s-a[i]]>0 then begin
                                sfix:=s-a[i];
                                exit(1);
                        end;
                end;
                status[i]:=0;
                d[a[i]]:=d[a[i]]+1;
        end;
        p:=0;
        end;
procedure output;
        var
                f:text;
                i:byte;
procedure fix;
        var
                i:byte;
        begin
        for i:= n downto 1 do
        if status[i]=0 then
        if a[i]=sfix then begin
                status[i]:=1;
                break;
        end;
        end;
        begin
        assign(f,out);
        rewrite(f);
        if p(s)=1 then begin
                writeln(f,1);
                fix;
                for i:= 1 to n do write(f,status[i],' ');
        end else
                writeln(f,0);
        close(f);
        end;

begin
        input;
        output;
end.