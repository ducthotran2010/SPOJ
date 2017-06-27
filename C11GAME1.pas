//const
        //inp='C11GAME1.inp';
var
fw:boolean;
a:Array[1..12,1..12] of char;
procedure nhap;
        var
                f:text;
                i:byte;
                tmp:char;
        begin
        //assign(F,inp);
        //reset(f);
        fillchar(a,sizeof(a),'.');
        fw:=false;
        for i:= 1 to 7 do read({f,}a[1,i]);readln{(f)};
        for i:= 1 to 8 do read({f,}a[2,i]);readln{(f)};
        for i:= 1 to 9 do read({f,}a[3,i]);readln{(f)};
        for i:= 1 to 8 do read({f,}a[4,i]);readln{(f)};
        for i:= 1 to 7 do read({f,}a[5,i]);
        //close(f);
        end;
procedure xuli;
        var
                i,j:byte;
        begin
        for i:= 1 to 12 do
        for j:= 1 to 12 do
        if a[i,j]='O' then
        if a[i,j+2]<>'O' then fw:=not fw;
        if fw then writeln('Karlsson') else writeln('Lillebror');
        end;
begin
        nhap;
        xuli;
end.

