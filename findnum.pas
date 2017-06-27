var
        n,i:int64;
function demuoc(i:int64):int64;
        var
                tmp:int64;
                j:longint;
        begin
        tmp:=0;
        for j:= 1 to trunc(sqrt(i)) do
        if i mod j=0 then begin
                inc(tmp);
                if i div j<>j then inc(tmp);
                if tmp>n then break;
        end;
        demuoc:=tmp;
        end;
begin
        readln(n);
        i:=n;
        repeat
                if demuoc(i)=n then begin
                        writeln(i);
                        halt;
                end;
                inc(i);
        until 1>2;
end.
