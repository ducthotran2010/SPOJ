const
        inp='nkmines.inp';
        max=200;
var
n,m:byte;
x:array[-1..max+2,-1..max+2] of byte;
a:array[0..max+1,0..max+1] of byte;
procedure input;
        var
                f:text;
                i,j:byte;
        begin
        assign(f,inp);
        reset(f);
        readln(f,m,n);
        for i:= 1 to m do begin
        for j:= 1 to n do read(f,a[i,j]);readln(f);end;
        close(f);
        for i:= 0 to m+1 do
                begin
                a[i,0]:=9;
                a[i,n+1]:=9;
                end;
        for i:= 0 to n+1 do
                begin
                a[0,i]:=9;
                a[m+1,i]:=9;
                end;
        end;
function sumaround(a,b:integer):byte;
        var
                tmp:byte;
        begin
        tmp:=x[a-1,b-1];
        tmp:=tmp+x[a-1,b];
        tmp:=tmp+x[a-1,b+1];
        tmp:=tmp+x[a,b-1];
        tmp:=tmp+x[a,b+1];
        tmp:=tmp+x[a+1,b-1];
        tmp:=tmp+x[a+1,b];
        tmp:=tmp+x[a+1,b+1];
        sumaround:=tmp;
        end;
procedure prinf;
        var
                i,j:byte;
        begin
        for i:= 1 to m do
                begin
                for j:= 1 to n do write(x[i,j],' ');
                writeln;
                end;
        end;
procedure check;
        var
                kt:boolean;
                i,j:byte;
        begin
        kt:=true;
        for i:= 1 to m do
        if kt then
        for j:= 1 to n do
        if sumaround(i,j)<>a[i,j] then
                begin
                kt:=false;
                break;
                end;
        if kt then
                begin
                prinf;
                halt;
                end;
        end;
procedure try(i,j:byte);
        var
                k:byte;
        function kt(i,j:byte):boolean;
                var
                        tmp:boolean;
                begin
                tmp:=false;
                if a[i-1,j-1]>=sumaround(i-1,j-1) then
                if a[i-1,j]>=sumaround(i-1,j) then
                if a[i-1,j+1]>=sumaround(i-1,j+1) then
                if a[i,j-1]>=sumaround(i,j-1) then
                if a[i,j+1]>=sumaround(i,j+1) then
                if a[i+1,j-1]>=sumaround(i+1,j-1) then
                if a[i+1,j]>=sumaround(i+1,j) then
                if a[i+1,j+1]>=sumaround(i+1,j+1) then
                        tmp:=true;
                kt:=tmp;
                end;
        begin
        for k:= 0 to 1 do
                begin
                x[i,j]:=k;
                if kt(i,j) then
                begin

                if (i=m)and(j=n) then
                        check
                else
                if i<m then try(i+1,j)
                else
                if j<n then try(1,j+1);
                end;
                x[i,j]:=0;
                end;
        end;
procedure process;
        begin
        fillchar(x,sizeof(x),0);
        try(1,1);
        end;
begin
        input;
        process;
end.
