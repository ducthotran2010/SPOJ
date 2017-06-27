var
n,m:byte;
st,sk,tmp:ansistring;
d:array['A'..'Z'] of byte;
gtm:array[0..9] of longint=(1,1,2,6,24,120,720,5040,40320,362880);
procedure try(i:byte);
        var
                j:byte;
        begin
        for j:= 1 to m do
        if d[sk[j]]>0 then
                begin
                tmp[i]:=sk[j];
                d[sk[j]]:=d[sk[j]]-1;
                if i<n then try(i+1)
                else writeln(tmp);
                d[sk[j]]:=d[sk[j]]+1;
                end;
        end;
procedure sort(l,r:byte);
        var
                tmp,x:char;
                i,j:byte;
        begin
        i:=l;
        j:=r;
        x:=st[(l+r) div 2];
        repeat
                while st[i]<x do inc(i);
                while st[j]>x do dec(j);
                if i<=j then
                        begin
                        tmp:=st[i];
                        st[i]:=st[j];
                        st[j]:=tmp;
                        inc(i);
                        dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
        end;
function findk:longint;
        var
                i:byte;
                j:char;
                tmp:longint;
        begin
        tmp:=gtm[n];
        for i:= 1 to n do inc(d[st[i]]);
        for j:= 'A' to 'Z' do tmp:=tmp div gtm[d[j]];
        m:=0;
        sk:=st;
        st:=st+'a';
        for i:= 2 to n+1 do
        if st[i-1]<>st[i] then begin
                inc(m);
                sk[m]:=st[i-1];
        end;
        findk:=tmp;
        end;
begin
        readln(st);
        n:=length(st);
        sort(1,n);
        tmp:=st;
        fillchar(d,sizeof(d),0);
        writeln(findk);
        try(1);
end.
