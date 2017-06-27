{uses crt;}
const
        //inp='LCS.inp';
        //out='LCS.out';
        maxl=255;
var
        lx,ly:byte;
        x,y:string;//array[1..1000]of char;
        f:array[0..maxl,0..maxl] of integer;
procedure nhap;
        begin
        readln(x);
        readln(y);
        lx:=length(x);
        ly:=length(y);
        end;
function max(a,b:integer):integer;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure qhd;
        var
                i,j:byte;
                //had:array[1..maxl]of boolean;

        begin
        //fillchar(had,sizeof(had),true);
        for i:= 1 to ly do
        for j:= 1 to lx do
                begin
                if x[j]=y[i] then
                    f[i,j]:=f[i-1,j-1]+1;
                if x[j]<>y[i] then
                    f[i,j]:=max(f[i-1,j],f[i,j-1]);
                end; {
        for i:= 1 to ly do
                begin
                for j:= 1 to lx do write(f[i,j]);
                writeln;
                end;  }
        end;
begin
        nhap;
        qhd;
        write(f[ly,lx]);
end.
