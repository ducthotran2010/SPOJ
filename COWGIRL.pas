const
        maxp=31;
        maxm=15;
        inp='';
var
        fi:text;
        res:qword;
        t,i,n,m,p,tmp:longint;
        check:array[0..maxp,0..maxp] of boolean;
        f:array[1..maxm,0..maxp] of longint;
procedure buildtable;
        var
                i,j,k,tmp:longint;
        begin
        fillchar(check,sizeof(check),true);
        for i:= 0 to p do
        for j:= 0 to p do
        for k:= 0 to n-2 do
                begin
                tmp:=3 shl k;
                if i and tmp=tmp then
                if j and tmp=tmp then
                        check[i,j]:=false;
                if (not i) and tmp=tmp then
                if (not j) and tmp=tmp then
                        check[i,j]:=false;
                end;
        end;
procedure process;
        var
                i,j,k:longint;
        begin
        fillchar(f,sizeof(f),0);
        for i:= 0 to p do f[1,i]:=1;
        for i:= 2 to m do
                begin
                for j:= 0 to p do
                for k:= 0 to p do
                if check[k,j] then
                        f[i,j]:=f[i,j]+f[i-1,k];
                end;
        for i:= 0 to p do res:=res+f[m,i];
        end;
begin
        assign(fi,inp);
        reset(fi);
        readln(fi,t);
        for i:= 1 to t do
                begin
                res:=0;
                readln(fi,m,n);
                if n>m then
                        begin
                        tmp:=n;
                        n:=m;
                        m:=tmp;
                        end;
                p:=(1 shl n)-1;
                buildtable;
                if (m<>1)and(n=1) then res:=1 shl m else
                if (m=1)and(n=1) then res:=2 else process;
                writeln(res);
                end;
        close(fi);
end.
