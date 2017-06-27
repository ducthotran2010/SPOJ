var
        n,e:longint;
        found:boolean;
        s,s1,s2:ansistring;
procedure init;
        var
                i:longint;
                sn:ansistring;
        begin
        sn:=s1+s2;
        s:='';
        n:=length(sn);
        for i:= 1 to n div 2 do s:=s+sn[i]+sn[n-i+1];
        if n mod 2<>0 then s:=s+sn[(n div 2)+1];
        end;
procedure process;
        var
                i,j:longint;
        function ktdx:boolean;
                var
                        j,sto:longint;
                begin
                sto:=((n-i)div 2)+i;
                for j:= i to sto do
                if s[j]<>s[2*sto-j] then
                        begin
                        i:=j;
                        exit(false);
                        end;
                e:=j;
                exit(true);
                end;
        begin
        i:=0;
        found:=false;
        repeat
                inc(i);
                if (ktdx)or(i=n) then
                        found:=true;
        until found;
        end;
procedure prinf;
        var
                i:longint;
        begin
        s1:='';
        s2:='';
        for i:= 1 to e do
        if i mod 2<>0 then
                s1:=s1+s[i]
        else
                s2:=s[i]+s2;
        writeln(s1+s2);
        end;
begin
        //readln(s1);
        //readln(s2);
        s1:='abczkym';
        s2:='zkym';
        init;
        process;
        prinf;
end.
