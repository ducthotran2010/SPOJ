uses crt;
const
        inp='HCN.INP';
	out='HCN.OUT';
type
        mang=record
        x,y:integer;
        gt:byte;
        end;
var
        dd:array[-200..200,-200..200] of byte;
        a:array[1..100000] of mang;
        n,count:word;
procedure nhap;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        read(f,n);
        fillchar(dd,sizeof(dd),0);
        for i:= 1 to n do
                begin
                read(f,a[i].x,a[i].y,a[i].gt);
                dd[a[i].x,a[i].y]:=a[i].gt;
                end;
        close(f);
        end;
procedure xuly;
        var
                i,j:integer;
        begin
        count:=0;
        for i:= 1 to n do
        for j:= 1 to n do
        if a[i].x<>a[j].x then
        if a[i].y<>a[j].y then
        if a[i].gt*a[j].gt*dd[a[i].x,a[j].y]*dd[a[j].x,a[i].y]=24 then
                inc(count);
        end;
procedure ghikq;
	var
		f:text;
	begin
	assign(f,out);
	rewrite(f);
	write(f,count div 4);
	close(f);
	end;
begin
        nhap;
        xuly;
	ghikq;
end.