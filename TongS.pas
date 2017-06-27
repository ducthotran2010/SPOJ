uses crt,windows;
const
        inp='TongS.inp';
var
        a:array[1..10000] of integer;
        s,n:integer;
        t:longint;

procedure nhap;
        var
                f:text;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        read(f,s);
        i:=0;
        while not seekeof(f) do
                begin
                inc(i);
                read(f,a[i]);
                end;
        close(f);
        n:=i;
        end;
procedure xuli;
        var
                i,j,d,c:integer;
                kt:boolean;
                f:array[0..10000] of longint;
        begin
        f[0]:=0;
        kt:=true;
        for i:= 1 to n do f[i]:=f[i-1]+a[i];
        for i:= 1 to n do
                if kt then
                begin
                if f[i]=s then
                        begin
                        d:=1;
                        c:=i;
                        kt:=false;
                        end else
                if f[i]>s then
                        for j:= 1 to i-1 do
                        if f[i]-f[j]=s then
                                begin
                                d:=j+1;
                                c:=i;
                                kt:=false;
                                end;
                end
                else break;
        writeln((gettickcount-t)/1000:0:5);
        for i:= d to c do write(a[i],' ');
        writeln;
        end;
procedure xuli2;
        var
                i,d,c,j:integer;
                kt:boolean;
                tmp:longint;
        begin
        kt:=true;
        d:=0;
        c:=0;
        for i:= 1 to n do
                if kt then
                begin
                tmp:=0;
                for j:= i to n do
                        begin
                        tmp:=tmp+a[j];
                        if tmp=s then
                                begin
                                d:=i;
                                c:=j;
                                kt:=false;
                                end;
                        if tmp>s then break;
                        end;
                end
                else break;
        writeln((gettickcount-t)/1000:0:5);
        for i:= d to c do write(a[i],' ');
       {}
        end;
begin
        nhap;
        clrscr;
        t:=gettickcount;
        xuli;
        t:=gettickcount;
        xuli2;
end.
