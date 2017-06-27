const
        inp='';
        maxn=10000;
        maxl=2;
        nc=4;
        maxp=(1 shl nc)-1;
var
        res,n,maxv:longint;
        a:array[1..nc,1..maxn] of longint;
        f:array[0..maxp,1..maxn] of longint;
        choose:array[0..maxp] of boolean;
        check:array[0..maxp,0..maxp] of boolean;
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
procedure init;
        var
                i,k,tmp:longint;
        begin
        fillchar(choose,sizeof(choose),true);
        fillchar(check,sizeof(check),false);
        for i:= 0 to maxp do
        for k:= 0 to maxl do
                begin
                tmp:=3 shl k;
                if i and tmp=tmp then
                        choose[i]:=false;
                end;                     {
        for i:= 0 to maxp do
        if choose[i] then write(i:5);    writeln;     }
        end;
procedure buildcheckfunc;
        var
                i,j:longint;
        begin
        for i:= 0 to maxp do
        if choose[i] then
        for j:= 0 to maxp do
        if choose[j] then
        if i and j=0 then check[i,j]:=true; {
        for i:= 0 to maxp do
        for j:= 0 to maxp do
        if check[i,j] then writeln(i,' ',j); }
        end;
function max(a,b:longint):longint;
        begin
        if a>b then max:=a else max:=b;
        end;
procedure process; //chua xet th bang toan so am
        var
                i,l,k,z,tmp:longint;
        begin
        for i:= 0 to maxp do
        if choose[i] then
        for k:= 0 to maxl+1 do
        if i and (1 shl k)<>0 then
                f[i,1]:=f[i,1]+a[k+1,1];
        for i:= 2 to n do
        for k:= 0 to maxp do
        if choose[k] then
        for z:= 0 to maxp do
        if check[k,z] then
                begin
                tmp:=0;
                for l:= 0 to maxl+1 do
                if k and (1 shl l)<>0 then
                        tmp:=tmp+a[l+1,i];
                f[k,i]:=max(f[k,i],f[z,i-1]+tmp);
                end;
        end;
procedure prinf;
        var
                i,j:longint;
        begin
        res:=0;
        for i:= 0 to maxp do
        if f[i,n]>res then res:=f[i,n];
        writeln(res);    {
        for i:= 1 to n do begin
        for j:= 0 to maxp do write(f[j,i]:5);writeln;end;}
        end;
begin
        input;
        if maxv>=0 then
                begin
                init;
                buildcheckfunc;
                process;
                prinf;
                end
        else
                writeln(maxv);
end.