const
        inp='RELATIVES.INP';
        out='RELATIVES.OUT';
        maxl=1023;
var
n,res:longint;
sl:array[0..maxl] of longint;
procedure input;
        var
                f:text;
                i,b,t:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(F,n);
        for i:=1 to n do
                begin
                read(f,t);
                b:=0;
                repeat
                        b:=b or (1shl(t mod 10));
                        t:=t div 10;
                until t=0;
                inc(sl[b]);
                end;
        close(f);
        end;
procedure process;
        var
                i,j:longint;
        begin
        res:=0;
        for i:= 0 to maxl do
        for j:= i to maxl do
                if i and j<>0 then
                if i=j then
                        res:=res+(sl[i]*(sl[i]-1))div 2
                else
                        res:=res+sl[i]*sl[j];
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        writeln(f,res);
        close(f);
        end;
begin
        input;
        process;
        prinf;
end.