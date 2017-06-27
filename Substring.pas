uses crt;
const
        inp='LCS.inp';
        out='LCS.out';
var
        lx,ly:integer;
        x,y:array[1..1000]of char;
        f:array[0..1000,0..1000] of integer;
procedure nhap;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        lx:=0;
        while not eoln(f) do
                begin
                inc(lx);
                read(f,x[lx]);
                end;
        readln(f);
        ly:=0;
        while not eoln(f) do
                begin
                inc(ly);
                read(f,y[ly]);
                end;
        close(f);
        end;
function max(a,b:integer):integer;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure qhd;
        var
                i,j:integer;
                had:array[1..1000]of boolean;

        begin
        fillchar(had,sizeof(had),true);
        for i:= 1 to ly do
                for j:= 1 to lx do
                begin
                if x[j]=y[i] then
                    f[i,j]:=f[i-1,j-1]+1;
                if x[j]<>y[i] then
                    f[i,j]:=max(f[i-1,j],f[i,j-1]);
                end;
        for i:= 1 to ly do
                begin
                for j:= 1 to lx do write(f[i,j],' ');
                writeln;
                end;
        end;
procedure trace;
        var
                i,j:integer;
                dd:array[1..1000] of boolean;
                fi:text;
        begin
        i:=ly;
        j:=lx;
        fillchar(dd,sizeof(dd),true);
        repeat
                while (f[i,j]=f[i-1,j])and(i>1) do dec(i);
                while (f[i,j]=f[i,j-1])and(j>1) do dec(j);
                dd[i]:=false;
                if i>1 then dec(i);
                if j>1 then dec(j);

        until f[i,j]=1;
        dd[i]:=false;
        assign(fi,out);
        rewrite(fi);
        for i:= 1 to ly do
        if not dd[i] then write(fi,y[i]);
        close(fi);
        end;
begin
        clrscr;
        nhap;
        qhd;
        trace;
        readln;
end.
