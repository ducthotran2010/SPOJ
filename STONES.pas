const
        inp='STONES.inp';
        out='STONES.out';
        maxn=1000;
        //-2 used
        //-1 end of array
var
        n:integer;
        a,nex,pre:array[-1..maxn] of integer;
procedure input;
        var
                f:text;
                i:integer;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        for i:= 1 to n do read(f,a[i]);
        close(f);
        end;
procedure process;
        var
                sav,i,j,s:integer;
                sum,min:longint;
        begin
        for i:= 1 to n do pre[i]:=i-1;
        for i:= 1 to n do nex[i]:=i+1;
        nex[n]:=-1;
        pre[1]:=-1;
        n:=n-1;
        s:=1;
        sum:=0;
        for i:= 1 to n do
                begin
                while nex[s]=-2 do inc(s);
                j:=s;
                min:=high(longint);
                while nex[j]<>-1 do
                        begin
                        if a[j]+a[nex[j]]<min then
                                begin
                                min:=a[j]+a[nex[j]];
                                sav:=j;
                                end;
                        j:=nex[j];
                        end;
                j:=sav;
                sum:=sum+min;
                a[j]:=min;
                sav:=nex[j];
                pre[nex[nex[j]]]:=pre[nex[j]];
                nex[pre[nex[j]]]:=nex[nex[j]];
                nex[sav]:=-2;
                end;
        writeln(sum);
        end;
begin
        input;
        process;
end.
