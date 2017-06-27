const
        maxn=10;
        maxk=10000;
type
        mang=array[1..maxn*2] of byte;
var
n:byte;
k:longint;
ak:array[2..maxn-1] of longint=(2,2,4,96,1024,2880,81024,770144);
x:mang;
dd:array[1..maxn*2] of boolean;
function ktnt(i:integer):boolean;
        var
                j:byte;
                kt:boolean;
        begin
        kt:=true;
        for j:= 2 to trunc(sqrt(i)) do
        if i mod j = 0 then
                begin
                kt:=false;
                break;
                end;
        exit(kt);
        end;
procedure prinf;
        var
             j:byte;
        begin
        for j:= 1 to n do write(x[j],' ');
        writeln;
        end;
procedure try(i:byte);
        var
                j:byte;
        begin
        for j:= 1 to n do
        if not dd[j] then
                begin
                x[i]:=j;
                if (k>maxk)or(k>ak[n div 2]) then exit;
                dd[j]:=true;
                if i>=2 then
                        begin
                        if ktnt(x[i]+x[i-1]) then
                        begin
                        if i=n then
                                begin
                                if ktnt(x[n]+x[1]) then
                                begin
                                inc(k);
                                if (k<=ak[n div 2])and(k<=maxk) then prinf;
                                end;
                                end
                        else try(i+1);
                        end
                        end
                else try(i+1);
                dd[j]:=false;
                end;
        end;
begin
        readln(n);
        writeln(ak[n]);
        n:=n*2;
        fillchar(dd,sizeof(dd),false);
        try(1);
end.
