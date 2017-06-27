var
        s2,s5,n:integer;
        s:ansistring;
procedure sort(l,r:integer);
        var
                i,j:integer;
                tmp,x:char;
        begin
        i:=l;
        j:=r;
        x:=s[(l+r) div 2];
        repeat
                while s[i]<x do inc(i);
                while s[j]>x do dec(j);
                if i<=j then
                        begin
                        tmp:=s[i];
                        s[i]:=s[j];
                        s[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
        end;
procedure findk;
        var
                i,j,tmp1,tmp2:integer;
                tmp:longint;
        procedure init(n:integer;var s2,s5:integer);
                var
                        j,i:integer;
                        c:byte;
                begin
                s2:=0;
                s5:=0;
                for i:= 2 to n do
                        begin
                        j:=i;
                        c:=2;
                        repeat
                                if j mod c=0 then
                                        begin
                                        if c=2 then inc(s2) else
                                        if c=5 then inc(s5);
                                        j:=j div c;
                                        end
                                else inc(c);
                                if c>5 then break;
                        until j=1;
                        end;
                end;

        begin
        init(n,s2,s5);
        j:=1;
        for i:= 2 to n do
        if s[i]<>s[i-1] then
                begin
                init(j,tmp1,tmp2);
                s2:=s2-tmp1;
                s5:=s5-tmp2;
                j:=1;
                end
        else inc(j);
        if j<>1 then
                begin
                init(j,tmp1,tmp2);
                s2:=s2-tmp1;
                s5:=s5-tmp2;
                end;
        end;
function min(a,b:integer):integer;
        begin
        if a<b then min:=a else min:=b;
        end;
begin
        readln(s);
        n:=length(s);
        sort(1,n);
        findk;
        writeln(min(s5,s2));
end.
