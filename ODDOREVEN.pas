const
        sm:string='02468..13579..';
        so:string='+-*';
        inp='ODDOREVEN.inp';
        out='ODDOREVEN.out';
var
        resp:longint;
        s,u:ansistring;
        sx,sy:string;
procedure input;
        var
                f:text;
        begin
        assign(f,inp);
        reset(f);
        readln(f,s);
        readln(f,sx);
        readln(f,sy);
        close(f);
        end;
procedure init;
        var
                n,i:longint;
        begin
        if sx='Even' then sm[6]:='x' else sm[13]:='x';
        if sy='Even' then sm[7]:='y' else sm[14]:='y';
        s:=s+'+';
        n:=length(s);
        u:='';
        for i:= 1 to n do
        if pos(s[i],so)<>0 then u:=u+s[i-1]+s[i];
        end;
procedure process;
        var
                resm,i,fp,fm,n:longint;
        begin
        fp:=1;
        fm:=0;
        resp:=0;
        resm:=1;
        n:=length(u);
        for i:= 1 to n do
        if i and 1=0 then
        if u[i]='*' then
                begin
                if fp=1 then
                        begin
                        resm:=(pos(u[i+1],sm)div 8)and(pos(u[i-1],sm) div 8);
                        fp:=0;
                        end
                else
                        resm:=(pos(u[i+1],sm)div 8)and resm;
                fm:=1;
                end
        else// if u[i-2]<>'*' then
                begin
                if fm=1 then
                        begin
                        resp:=resp xor resm;
                        resm:=1;
                        fm:=0;
                        end
                else resp:=resp xor(pos(u[i-1],sm)div 8);
                fp:=1;
                end;
        end;
procedure prinf;
        var
                f:text;
        begin
        assign(f,out);
        rewrite(f);
        if resp=1 then
        writeln(f,'Odd') else writeln(f,'Even');
        close(f);
        end;
begin
        input;
        init;
        process;
        prinf;
end.
