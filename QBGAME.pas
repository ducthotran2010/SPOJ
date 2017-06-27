const
        inp='';
        maxn=10000;
        maxl=6;
        nc=8;
        maxp=(1 shl nc)-1;
        maxc=55;
var
        n:longint;
        res,maxv:int64;
        a:array[1..nc,1..maxn] of int64;
        f:array[1..maxc,1..maxn] of int64;
        c:array[1..maxc] of longint=(0,1,2,4,5,8,9,10,16,17,18,20,21,32,33,34,36,37,40,41,42,64,65,66,68,69,72,73,74,80,81,82,84,85,128,129,130,132,133,136,137,138,144,145,146,148,149,160,161,162,164,165,168,169,170);
        check:array[1..maxc,1..maxc] of boolean;
procedure input;
        var
                f:text;
                i,j:longint;
        begin
        assign(f,inp);
        reset(f);
        readln(f,n);
        maxv:=low(longint);
        for i:= 1 to nc do
        for j:= 1 to n do
                begin
                read(f,a[i,j]);
                if a[i,j]>maxv then maxv:=a[i,j];
                end;
        close(f);
        end;
procedure buildcheckfunc;
        var
                i,j:longint;
        begin
        for i:= 1 to maxc do
        for j:= i to maxc do
        if c[i]and c[j]=0 then
                begin
                check[i,j]:=true;
                check[j,i]:=true;
                end;
        end;
function max(a,b:int64):int64;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure process;
        var
                i,l,k,z:longint;
                tmp:int64;
        begin
        for i:= 1 to maxc do
        for k:= 0 to maxl+1 do
        if c[i] and (1 shl k)<>0 then
                f[i,1]:=f[i,1]+a[k+1,1];
        for i:= 2 to n do
        for k:= 1 to maxc do
                begin
                tmp:=0;
                for l:= 0 to maxl+1 do
                if c[k] and (1 shl l)<>0 then
                        tmp:=tmp+a[l+1,i];
                for z:= 1 to maxc do
                if check[k,z] then
                        f[k,i]:=max(f[k,i],f[z,i-1]+tmp);
                end;
        end;
procedure prinf;
        var
                i,j:longint;
        begin
        res:=0;
        for i:= 1to maxc do
        if f[i,n]>res then res:=f[i,n];
        writeln(res);
        end;
begin
        input;
        if maxv>=0 then
                begin
                buildcheckfunc;
                process;
                prinf;
                end
        else
                writeln(maxv);
end.
