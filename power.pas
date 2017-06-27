uses math;
const
        inp='';
        maxpower=39;// max of power in this limit
var
        f:text;
        i,t:integer;
        l,r:int64;
procedure process;
        var
                power:byte;
                tmp:int64;
        begin
        for power:=maxpower downto 1 do
                begin
                tmp:=trunc(exp(ln(r)/power));
                tmp:=tmp**power;
                //tmp:=round(exp(ln(tmp)*power));
                if l<=tmp then
                if tmp<=r then
                        break;
                end;
        writeln('Case #',i,': ',power)
        end;
begin
        assign(f,inp);
        reset(f);
        readln(f,t);
        for i:= 1 to t do
                begin
                readln(f,l,r);
                process;
                end;
        close(f);
end.





