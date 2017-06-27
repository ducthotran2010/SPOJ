uses crt;
const
        inp='DOITIEN.INP';
var
        a,b:array[1..100] of word;
        dd:array[1..100] of boolean;
        n,m,msa,min,vt:word;
        kt:boolean;
procedure nhap;
        var
                f:text;
                i:byte;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,m);
        msa:=m;
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
                begin
                b[i]:=m div a[i];
                {write(b[i],' ');}
                end;
        {writeln;}
        end;
procedure rec;
        var
                t,s:word;
                i:byte;
        begin
        t:=a[vt];
        for i:= 1 to min do
                begin
                s:=t*i;
                if s>m then
                        begin
                        s:=t*(i-1);
                        break;
                        end;
                end;
        writeln(t,' ',s div t);
        m:=m-s;
        if m=0 then kt:=true;
        end;
procedure choose;
        var
                i:word;
        begin
        buildb;
        min:=b[1];
        vt:=1;
        for i:= 2 to n do
                if min>b[i] then
                if dd[i] then
                if b[i]<>0 then
                begin
                min:=b[i];
                vt:=i;
                end;
        if min=0 then
                begin
                m:=msa;
                exit;
                end;
        dd[vt]:=false;
        rec;
        end;
procedure xuli;
        var
                i:word;
        begin
        kt:=false;
        i:=0;
        repeat
                choose;
                inc(i);
                if i>n then kt:=true;
        until kt;
        end;
begin
        clrscr;
        nhap;
        fillchar(dd,sizeof(dd),true);
        xuli;
        readln;
end.
