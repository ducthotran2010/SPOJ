uses crt;
const
        inp='DAYCON.IN';
        out='DAYCON.OUT';
var
        n,d,c:byte;
        s:word;
        l,a:array[1..200] of byte;
procedure nhap;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,s);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure xuli;
        var
                j:byte;
                i:word;
                luu:array[1..200] of byte;
        begin
        for i:= 1 to n do
                l[i]:=1;
        for i:= 1 to s do
        if l[i]=0 then
        for j:= 1 to n do
                if i-a[j]>0 then
                begin
                l[i]:=l[i-a[j]]+l[a[j]];
                luu[i]:=j;
                break;
                end;
        for i:= 1 to s do
        if l[i]<=n then write(l[i],' ') else write('0 ');
        writeln;
        for i:= 1 to s do
        if luu[i]<=n then write(luu[i],' ') else write('0 ');


        end;
begin
        nhap;
        xuli;
        readln;
end.
