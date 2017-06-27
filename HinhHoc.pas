const
        inp='HinhHoc.inp';
        maxn=10;
type
        point=record
        x,y:real;end;
var
        n:integer;
        a:array[0..maxn] of point;
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i].x,a[i].y);
        close(f);
        end;
procedure tinh;
        var
                i,j:integer;
                s:real;
        begin
        a[0]:=a[n];
        a[n+1]:=a[1];
        s:=0;
        for i:= 1 to n do
                s:=s+(a[i-1].x-a[i+1].x)*a[i].y;
        writeln(abs(s)/2:0:1);
        end;
begin
        nhap;
        tinh;
end.
