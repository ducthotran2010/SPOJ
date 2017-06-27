uses crt;
var
        count,i,a,b:integer;
function check(i1:integer):boolean;
        var
                i2:longint;
        function int(s:string):longint;
                var
                        e:integer;
                begin
                val(s,int,e);
                end;
        function dx(i:integer):string;
                var
                        s1,s2:string;
                        j,n:integer;
                begin
                str(i,s1);
                s2:=s1;
                n:=length(s1);
                for j:= n downto 1 do
                        s2[j]:=s1[n-j+1];
                dx:=s2;
                end;
        function UCLN(a,b:longint):longint;
                var
                        tmp:integer;
                begin
                while b>0 do
                        begin
                        a:=a mod b;
                        tmp:=a;
                        a:=b;
                        b:=tmp;
                        end;
                exit(a);
                end;
        begin
        i2:=int(dx(i1));
        if UCLN(i1,i2)=1 then exit(true) else exit(false);
        end;
begin
        readln(a,b);
        count:=0;
        for i:= a to b do
        if check(i) then inc(count);
        write(count);
end.
