const
        inp='Doan.inp';
        out='Doan.out';
        Min_Line=1;
        max_line=100000;
type
        mang=record
        d:boolean;
        max:integer;
        end;
        mang2=record
        l,r:integer;
        end;
var
        dd:array[min_line-1..max_line] of mang;
        kq:array[min_line..max_line] of mang2;
        p,q:integer;
        dem,n:longint;
procedure nhap;
        var
                f:text;
                x,y:integer;
                i:longint;
        begin
        assign(f,inp);
        reset(f);
        read(f,n,p,q);
{        for i:= min_line to max_line do
                begin
                dd[i].d:=false;
                dd[i].max:=-maxint;
                end;
 }       for i:= 1 to n do
                begin
                readln(f,x,y);
                dd[x].d:=true;
                if dd[x].max<y then dd[x].max:=y;
                end;
        close(f);
        end;
function Find_First_Line:integer;
        var
                max,cs,i:integer;

        begin
        max:=0;
        cs:=0;
        for i:= Min_Line to p do
        if dd[i].d then
        if dd[i].max>max then
                begin
                max:=dd[i].max;
                cs:=i;
                end;
        Find_First_Line:=cs;
        end;
procedure xuly;
        var
                x:integer;
        begin
        x:=Find_First_Line;
        dem:=0;
        repeat
                inc(dem);
                kq[dem].l:=x;
                kq[dem].r:=dd[x].max;
                x:=dd[x].max;
                if x<q then
                while not dd[x].d do dec(x);
        until x>=q;
        end;
procedure ghikq;
        var
                f:text;
                i:integer;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,dem);
        for i:= 1 to dem do writeln(f,kq[i].l,' ',kq[i].r);
        close(f);
        end;
begin
        nhap;
        xuly;
        ghikq;
end.