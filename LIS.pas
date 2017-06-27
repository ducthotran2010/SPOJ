const
        maxn=30000;
        inp='';
type
        tree=^index;
        index=record
                v:longint;
                max:integer;
                l,r:tree;
        end;
var
t:tree;
n:integer;
procedure input;
        var
                f:text;
                i,sl,max:integer;
                x:longint;
        procedure insert(var t:tree);
                begin
                if t=nil then begin
                        new(t);
                        t^.v:=x;
                        t^.max:=sl;
                        t^.l:=nil;
                        t^.r:=nil;
                end else if x>t^.v then begin
                        if sl<t^.max+1 then sl:=t^.max+1;
                        insert(t^.r);
                end else begin
                        insert(t^.l);
                        if sl>t^.max then t^.max:=sl;
                end;
                end;
        begin
        t:=nil;
        assign(f,inp);
        reset(f);
        readln(f,n);
        max:=0;
        for i:= 1 to n do begin
                read(f,x);
                sl:=1;
                insert(t);
                if sl>max then max:=sl;
        end;
        close(f);
        writeln(max);
        end;
begin
        input;
end.