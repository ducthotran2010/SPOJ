const
        inp='LITES.inp';
        maxn=100000;
procedure query0(k,l,r:longint);
        var
                m:longint;
        begin
        if (v<l)or(u>r) then exit;
        if (u<=l)and(r<=v) then
                begin
                ITstt[k]:=ITstt[k]xor 1;
                if l=r then
                ITnumber[k]:=ITstt[k];
                exit;
                end;
        m:=(l+r)div 2;
        stt:=stt xor ITstt[k];
        query0(k*2,l,m);
        query1(k*2+1,m+1,r);
        //ITstt[k]:=ITstt[k]xor(ITstt[k*2]and ITstt[k*2+1]);
        ITnumber[k]:=ITnumber[k*2]+ITnumber[k*2+1];
        end;
procedure query1(k,l,r:longint);
        var
                m:longint;
        begin
        if (v<l)or(u>r) then exit;
        if u<=l then
        if r<=v then
                begin
                res:=res:=ITnumber[k];
                exit;
                end;
        m:=(l+r)div 2;
        query1(k*2,l,m);
        query1(k*2+1,m+1,r);
        end;
procedure IPO;
        var
                f:text;
                i,mode:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n,m);
        for i:= 1 to m do
                begin
                readln(f,mode,u,v);
                if mode=0 then
                        query0(1,1,n)
                else
                        begin
                        res:=0;
                        query1(1,1,n);
                        writeln(res);
                        end;
                end;
        close(f);
        end;