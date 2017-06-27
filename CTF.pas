//uses crt;
const
        inp='';
var
        x,y,z,c,a,b,k:qword;
        s,s1,s2,s3:string;
procedure format;
        var
                e:integer;
        begin
        if s[pos('.',s)+1]='(' then insert('0',s,pos('(',s));
        s1:=copy(s,1,pos('.',s)-1);
        s:=copy(s,pos('.',s)+1,length(s)-pos('.',s)+1);
        s2:=copy(s,1,pos('(',s)-1);
        s:=copy(s,pos('(',s)+1,length(s)-pos('(',s)+1);
        s3:=copy(s,1,pos(')',s)-1);
        val(s1,x,e);
        val(s2,y,e);
        val(s3,z,e);
        s2:=s2+s3;
        val(s2,k,e);
        end;
function m10(n:byte):qword;
        var
                tmp:qword;
                i:byte;
        begin
        tmp:=10;
        for i:= 2 to n do tmp:=tmp*10;
        m10:=tmp;
        end;
function x10p9(n:byte):qword;
        var
                tmp:qword;
                i:byte;
        begin
        tmp:=9;
        for i:= 2 to n do
                begin
                tmp:=tmp*10;
                tmp:=tmp+9;
                end;
        x10p9:=tmp;
        end;
procedure process;
        begin
        if (x=0)and(y=0)and(z=0) then begin
                a:=0;
                b:=1;
        end else if (y=0)and(z=0) then begin
                a:=x;
                b:=1;
        end else if (y<>0)and(z=0) then begin
                a:=y;
                b:=m10(1+trunc(ln(y)/ln(10)));
                if x<>0 then
                        a:=a+x*b;
        end else if (y=0)and(z<>0) then begin
                a:=z;
                b:=x10p9(1+trunc(ln(z)/ln(10)));
                if x<>0 then
                        a:=a+x*b;
        end else if (y<>0)and(z<>0) then begin
                a:=k-y;
                b:=x10p9(1+trunc(ln(z)/ln(10)))*m10(trunc(ln(y)/ln(10))+1);
                if x<>0 then
                        a:=a+x*b;
        end;
        end;
function ucln(a,b:qword):qword;
        begin
        while b<>0 do
                begin
                a:=a mod b;
                k:=a;
                a:=b;
                b:=k;
                end;
        ucln:=a;
        end;
procedure input;
        var
                f:text;
                t,i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,t);
        for i:= 1 to t do begin
                readln(f,s);
                format;
                process;
                c:=ucln(a,b);
                writeln(a div c,'/',b div c);
        end;
        close(f);
        end;
begin
        input;
end.
