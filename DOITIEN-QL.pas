uses crt;
const
        inp='DOITIEN.INP';
var
        a,luu,b,x:array[1..100] of word;
        n,m,min:word;
        ld:boolean;
procedure nhap;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        writeln(n,' ',m);
        for i:= 1 to n do
                begin
                read(f,a[i]);
                write(a[i],' ');
                end;
        writeln;
        close(f);
        end;
procedure buildb;
        var
                i:word;
        begin
        for i:= 1 to n do
                b[i]:=m div a[i];
        end;
procedure tinh;
        var
                s,i,t:word;
        begin
        s:=0;
        t:=0;
        for i:= 1 to n do
                s:=s+x[i]*a[i];
        for i:= 1 to n do
                t:=t+x[i];
        if s=m then
        if ld then
                begin
                luu:=x;
                min:=t;
                ld:=false;
                end;
        if s=m then
        if t<min then
                luu:=x;
x        end;
procedure try(i:byte);
        var
                j:word;
        begin
        for j:= 1 to b[i] do
                begin
                x[i]:=j;
                if i=n then tinh
                else try(i+1);
                end;
        end;
procedure ghikq;
        var
                i:word;
        begin
        writeln(min);
        for i:= 1 to n do write(luu[i],' ');
        end;
begin
        nhap;
        ld:=true;
        buildb;
        try(1);
        ghikq;
        readln;
end.
